var messageHandlers = {};
var responseCallbacks = {};
var eventHandlers = {};
var uniqueId = 1;

function log(message) {
  if (typeof myLog === 'function') {
    myLog(message);
  } else {
    console.log(message);
  }
}

// ******** Native 回调消息统一处理 ********
/**
 * 统一处理 Native 调用消息数据
 * @param {Object} message
 * @param {String} message.handlerName 接口名
 * @param {Object} message.data 回调数据
 * @param {String} message?.responseId JS主动调用时的回调id
 * @param {String} message?.callbackId Native主动调用时的回调id
 */
function handleHoneMessageFromNative(messageJSONStr) {
  log("RECIEVE:" + messageJSONStr);
  var message = JSON.parse(messageJSONStr);

  // JS 调用 native 回调接
  if (message.responseId) {
    handleNativeCallbackMessage(message);
    return;
  }
  // 调用JS监听的事件
  if (message.callbackId) {
    handleNativeCalledEvent(message);
    return;
  }

  return message.handlerName;
}

/**
 * 处理 native 主动调用事件
 * @param {Object} message
 * @param {String} message.handlerName 接口名
 * @param {String} message.callbackId 回调id
 * @param {Object} message.data 回调数据
 */
 function handleNativeCallbackMessage(message) {
  var handler = responseCallbacks[message.responseId];
  if (typeof handler === 'function') {
    handler(message.responseData);
    return;
  }
  log('[JS] handle response 回调方法不存在');
}

/**
 * 处理 native 主动调用事件
 * @param {Object} message
 * @param {String} message.handlerName 接口名
 * @param {String} message.callbackId 回调id
 * @param {Object} message.data 回调数据
 */
function handleNativeCalledEvent(message) {
  if (message.handlerName === 'dispatchEvent') {
    dispatchEvent(message);
  }
}

// ******** 注册 Native 调用事件 ********
/**
 * 注册事件
 * @param {String} method 方法名
 * @param {Function} handler 处理方法
 */
function registerHandler(method, handler) {
  eventHandlers[method] = handler;
}

// 处理 native 调用信息
function dispatchEvent(message) {
  var data = message.data;
  var handler = eventHandlers[data.func];
  if (!handler) {
    callNativeResponse(message.callbackId, {
      code: 101,
      msg: '接口未定义'
    });
    return
  }

  var callback = function (err, data) {
    var code = 0;
    var msg = '';
    if (err) {
      code = err.code;
      msg = err.msg;
    }
    callNativeResponse(message.callbackId, {
      code,
      msg,
      data
    })
  }
  handler(data.params, callback);
}

/**
 * 发送 Native 调用 JS 后的 Callack 信息
 * @param {String} responseId 回调id
 * @param {Object} responseData 回调数据
 */
function callNativeResponse(responseId, responseData) {
  doSend({
    responseId,
    responseData
  });
}

// ******** 调用 Native 接口事件 ********
/**
 * 调用 Native Bridge
 * @param {String} handlerName 通道接口
 * @param {Object} data 调用参数
 * @param {Function} responseCallback 回调
 */
function callNativeHandler(handlerName, data, responseCallback) {
  doSend({
    handlerName: handlerName,
    data: data
  }, responseCallback);
}

/**
 * 实际发送 Native 调用事件
 * @param {Object} message 消息对象
 * @param {Function} responseCallback 回调方法
 */
function doSend(message, responseCallback) {
  if (responseCallback) {
    var callbackId = 'cb_' + uniqueId + '_' + Date.now();
    uniqueId += 1;

    responseCallbacks[callbackId] = responseCallback;
    message['callbackId'] = callbackId;
  }
  var messageQueueString = JSON.stringify(message);
  log("SEND:" + messageQueueString);

  // 新的调用 native js 接口
  HoneJSCoreNativeBridge.callHandler(messageQueueString);
}

/**
 * 全局 JSBridge 调用对象
 */
var HoneJSCoreJSBridge = {
  callbackHandlers: {},
  messageHandlers: {},
  invoke(api, params, callback) {
    callNativeHandler('invoke', {
      func: api,
      params
    }, callback);
  },
  on(event, callback) {
    if (!this.messageHandlers[event]) {
      this.messageHandlers[event] = [];
    }
    this.messageHandlers[event].push(callback);
  },

  // native 回调 js callback
  handleHoneMessageFromNative,
  registerHandler
};

// ----- 测试代码 ------
function demo() {
  HoneJSCoreJSBridge.invoke('getDeviceInfo', {
    foo: 'bar'
  }, function (response) {
    log('JS got response', response);
  })
}

// 监听事件
HoneJSCoreJSBridge.registerHandler('preRender', function (data, callback) {
  log('preRender data=' + JSON.stringify(data));
  callback(null, {
    htmlStr: '<h1>hello, world</h1>'
  })
})
