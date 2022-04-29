//
//  BDBaseViewController.h
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/1/12.
//

#import <UIKit/UIKit.h>
#import "UIViewController+PopGesture.h"
#import "BDNavigationView.h"
#import "Theme.h"
#import "UIStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface BDBaseViewController : UIViewController

@property(nonatomic, strong)BDNavigationView *navView;

/// 展示toast信息
- (void)showMsg:(NSString *)msg;

/// 震动反馈
- (void)feedBack;

#pragma mark - 页面loading
/// 开始加载动画
- (void)showLoadingPage;

/// 停止加载动画
- (void)hideLoadingPage;

/// 显示加载失败
- (void)showLoadingFailPage;

/// 点击了loading界面取刷新
- (void)tapToRefresh;

- (void)showLoding;

- (void)stopLoding;

@end

NS_ASSUME_NONNULL_END
