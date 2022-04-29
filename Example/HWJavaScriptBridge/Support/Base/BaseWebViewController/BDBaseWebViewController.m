//
//  BDBaseWebViewController.m
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/2/7.
//  Copyright © Howen Technology All rights reserved.
//

#import "BDBaseWebViewController.h"
#import "UIStyle.h"
#include <objc/runtime.h>
#include <objc/message.h>

@interface BDBaseWebViewController ()<WKNavigationDelegate, WKUIDelegate>
@property(nonatomic,strong)UIProgressView *progressView;
@end

@implementation BDBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc]init];
    config.preferences = [[WKPreferences alloc]init];
    config.userContentController = [[WKUserContentController alloc]init];
    NSString *jspath = [[NSBundle mainBundle]pathForResource:@"jscode.txt" ofType:nil];
//    NSString *jspath = [[NSBundle mainBundle]pathForResource:@"honejsbridge.js" ofType:nil];
    NSString *str = [NSString stringWithContentsOfFile:jspath encoding:NSUTF8StringEncoding error:nil];
    //注入时机是在webview加载状态WKUserScriptInjectionTimeAtDocumentStart、WKUserScriptInjectionTimeAtDocumentEnd
    WKUserScript *userScript = [[WKUserScript alloc] initWithSource:str injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    //关键代码，把jscode.txt读取的内容字符注入到js
    [config.userContentController addUserScript:userScript];
//    [config.userContentController addScriptMessageHandler:self name:@"timing"];

    
    _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_HEIGHT) configuration:config];//初始化
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    
    [self.view addSubview:_webView];
    
    // 设置进度条
    _progressView = [[UIProgressView alloc]init];
    _progressView.frame = CGRectMake(0, NAV_HEIGHT, SCREEN_WIDTH, 1);
    _progressView.transform = CGAffineTransformMakeScale(1.0f, 0.5f);
    _progressView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_progressView];
    // 添加监测
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew| NSKeyValueObservingOptionOld context:nil];
    
    //1.网络
    _webView.allowsBackForwardNavigationGestures = YES;
    if (self.url) {
        NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:self.url];
        [_webView loadRequest:request];
    }
}

// 实现监测
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqual: @"estimatedProgress"] && object == _webView) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:_webView.estimatedProgress animated:YES];
        if(_webView.estimatedProgress >= 1.0f)
        {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:NO];
            }];
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)setUrl:(NSURL *)url{
    _url = url;
    if (self.url) {
        NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:self.url];
        [_webView loadRequest:request];
    }
}

-(NSDictionary *)performanceResult{
    __block BOOL end = NO;
    __block id result;
    [self.webView evaluateJavaScript:@"timing()" completionHandler:^(id obj, NSError * _Nullable error) {
        result = obj;
        end = YES;
    }];
    while (!end) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    return result;
}

@end
