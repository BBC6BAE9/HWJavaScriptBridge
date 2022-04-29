//
//  HNWebViewBridge.h
//  JSBridge
//
//  Created by ihenryhuang on 2022/4/24.
//  Copyright © 2022 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import "HWBaseJavaScriptBridge.h"

NS_ASSUME_NONNULL_BEGIN

@interface HWWebViewJavaScriptBridge : HWBaseJavaScriptBridge

- (instancetype)initWithWebView:(WKWebView *)webview;

@end

NS_ASSUME_NONNULL_END
