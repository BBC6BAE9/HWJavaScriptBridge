//
//  BDDefine.h
//  Baodianma
//
//  Created by ihenryhuang on 2022/1/13.
//  Copyright © 2022 Tencent. All rights reserved.
//

#ifndef UIDefine_h
#define UIDefine_h

#import "UIColor+Hex.h"
#import "UIView+Frame.h"
#import "UIWindow+KeyWindow.h"
#import "ColorStyle.h"

// 屏幕大小
#define  ScreenBounds           [UIScreen mainScreen].bounds
#define  SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height
#define  TABBAR_HEIGHT           83

// 屏幕宽度比例
#define  ScaleWidth             (ScreenWidth / 375.0f)
#define  ScaleHeight            (ScreenHeight / 667.0f)
#define  ScaleSize              ScaleWidth

// 导航栏高度
#define mc_Is_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define mc_Is_iphoneX SCREEN_WIDTH >=375.0f && SCREEN_HEIGHT >=812.0f&& mc_Is_iphone
    
/*状态栏高度*/
#define StatusBarHeight (CGFloat)(mc_Is_iphoneX?(44.0):(20.0))
/*导航栏高度*/
#define mcNavBarHeight (44)
/*状态栏和导航栏总高度*/
#define NAV_HEIGHT (CGFloat)(mc_Is_iphoneX?(88.0):(64.0))
/*TabBar高度*/
#define mcTabBarHeight (CGFloat)(mc_Is_iphoneX?(49.0 + 34.0):(49.0))
/*顶部安全区域远离高度*/
#define mcTopBarSafeHeight (CGFloat)(mc_Is_iphoneX?(44.0):(0))
 /*底部安全区域远离高度*/
#define mcBottomSafeHeight (CGFloat)(mc_Is_iphoneX?(34.0):(0))
/*iPhoneX的状态栏高度差值*/
#define mcTopBarDifHeight (CGFloat)(mc_Is_iphoneX?(24.0):(0))
/*导航条和Tabbar总高度*/
#define mcNavAndTabHeight (mcNavBarAndStatusBarHeight + mcTabBarHeight)

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define HexColor(str) [UIColor colorWithHexString:str]

//比例系数
#define pxRatio              (SCREEN_WIDTH / 375.0)
//比例函数
#define SCALE(x)             ((x) * pxRatio)
//比例RectMake（按照iPhone6的设计尺寸适配）
#define BDRectMake(x,y,w,h)  CGRectMake(SCALE(x), SCALE(y), SCALE(w), SCALE(h))

#endif /* BDDefine_h */
