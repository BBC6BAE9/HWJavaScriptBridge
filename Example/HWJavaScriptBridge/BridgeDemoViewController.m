//
//  BridgeViewController.m
//  HNPreRenderiOS_Example
//
//  Created by ihenryhuang on 2022/4/27.
//  Copyright © 2022 Tencent. All rights reserved.
//

#import "BridgeDemoViewController.h"
#import "VBWebViewController.h"
#import "VBViewController.h"
#import "UIButton+Standard.h"

@interface BridgeDemoViewController ()

@end

@implementation BridgeDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"JSBridge体验";
    
    UIButton *btn = [UIButton standardButton];
    btn.x = 12;
    btn.y = NAV_HEIGHT + 20;
    [btn setTitle:@"JSContextBridge" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = B500;
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton standardButton];
    btn1.x = 12;
    btn1.y = btn.y + btn.height + 20;
    [btn1 setTitle:@"JSWebviewBridge" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    btn1.backgroundColor = P500;
    [self.view addSubview:btn1];
}

- (void)btnClick{
    VBViewController *vc = [[VBViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)btn1Click{
    VBWebViewController *vc = [[VBWebViewController alloc] init];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"demoapp" withExtension:@"html"];
    vc.url = url;
    [self.navigationController pushViewController:vc animated:YES];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
