//
//  VBViewController.m
//  HNPreRenderiOS
//
//  Created by ihenryhuang on 04/25/2022.
//  Copyright (c) 2022 Tencent. All rights reserved.
//

#import "VBViewController.h"
#import "HWJSContextJavaScriptBridge.h"
#import "UIStyle.h"

@interface VBViewController ()

@property (nonatomic, strong) HWJSContextJavaScriptBridge *bridge;
@property (nonatomic, strong) JSContext *ctx;

@end

@implementation VBViewController
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"JSContext环境运行bridge";
    
    [self createUI];
    
    JSVirtualMachine *vm = [[JSVirtualMachine alloc] init];
    JSContext *ctx = [[JSContext alloc] initWithVirtualMachine:vm];
    self.ctx  = ctx;
    HWJSContextJavaScriptBridge *bridge = [[HWJSContextJavaScriptBridge alloc] initWithJSContext:ctx];
    self.bridge = bridge;
    
    // 监听JS调用的postMessage方法
    [bridge registerHandler:@"invoke" handler:^(id  _Nonnull data, HWJBResponseCallback  _Nonnull responseCallback) {
        NSDictionary *clientData = @{
            @"code":@(0),
            @"msg":@"success",
            @"data":@{@"company":@"tencent"}
        };
        responseCallback(clientData);
    }];
    
    // 监听JS调用的postMessage方法
    [bridge registerHandler:@"log" handler:^(id  _Nonnull data, HWJBResponseCallback  _Nonnull responseCallback) {
        NSLog(@"%@", data);
    }];
    
}

-(void)createUI{
    CGFloat btnW = self.view.bounds.size.width;
    CGFloat btnH = (self.view.bounds.size.height - NAV_HEIGHT) / 4;
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, btnW, btnH)];
    [btn1 setTitle:@"JS Call Native" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    btn1.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    [btn1 setBackgroundColor:P200];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT + btnH, btnW, btnH)];
    [btn2 setTitle:@"Native Call JS" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    btn2.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    [btn2 setBackgroundColor:P500];
    [self.view addSubview:btn2];
}

- (void)btn1Click{
    NSString* javascriptCommand = [NSString stringWithFormat:@"demo();"];
    [self.bridge.ctx evaluateScript:javascriptCommand];
}

- (void)btn2Click{
    // 客户端主动调用JS，并得到JS的回应
    NSDictionary *data = @{
        @"func":@"preRender",
        @"params":@{
            @"url":@"https://m.film.qq.com"
        }
    };
    [self.bridge callHandler:@"dispatchEvent" data:data responseCallback:^(id responseData) {
        NSLog(@"[preRender] recieve callback data=%@", responseData);
    }];
}

@end

