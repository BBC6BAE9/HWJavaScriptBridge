//
//  VBWebViewController.m
//  JSServiceDemo
//
//  Created by bbc6bae9 on 2022/3/25.
//

#import "VBWebViewController.h"
#import "PerformanceDashboardVC.h"
#import "BDNavigationViewController.h"
#import "HWWebViewJavaScriptBridge.h"
#import "UIButton+Standard.h"

@interface VBWebViewController ()<WKUIDelegate, WKNavigationDelegate>
@property(nonatomic, strong)HWWebViewJavaScriptBridge *bridge;
@end

@implementation VBWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"webView环境运行bridge";
    [self.navView.rightItem setTitle:@"性能" forState:UIControlStateNormal];
    [self.navView.rightItem addTarget:self action:@selector(obtainPerformance) forControlEvents:UIControlEventTouchUpInside];
    
    self.webView.navigationDelegate = self;
    self.webView.UIDelegate = self;
    
    HWWebViewJavaScriptBridge *bridge = [[HWWebViewJavaScriptBridge alloc] initWithWebView:self.webView];
    self.bridge = bridge;
    [bridge registerHandler:@"invoke" handler:^(id  _Nonnull data, HWJBResponseCallback  _Nonnull responseCallback) {
        NSDictionary *clientData = @{
            @"code":@(0),
            @"msg":@"success",
            @"data":@{@"company":@"tencent"}
        };
        responseCallback(clientData);
    }];

    UIButton *btn = [UIButton standardButton];
    btn.x = 12;
    btn.y = SCREEN_HEIGHT - mcBottomSafeHeight - btn.height;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"Native call JS" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
}

// 客户端调用JS
- (void)btnClick{
    [self.bridge callHandler:@"dispatchEvent" data:@{@"func": @"preRender"} responseCallback:^(id  _Nonnull responseData) {
        NSLog(@"[preRender] callback =%@", responseData);
    }];
}

- (void)obtainPerformance{
    PerformanceDashboardVC *vc = [[PerformanceDashboardVC alloc] init];
    vc.perfData = [self performanceResult];
    BDNavigationViewController *nav = [[BDNavigationViewController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:nav animated:YES completion:nil];
    
}
- (void)rightItemClick:(UIButton *)sender{
}

- (void)setCache:(NSDictionary *)cache{
    _cache = cache;
}

@end
