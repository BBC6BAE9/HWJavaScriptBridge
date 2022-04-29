//
//  UIViewController+PopGesture.h
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (PopGesture)

/// 启用返回手势
- (void)enablePopGesture;

/// 禁用返回手势
- (void)disablePopGesture;

@end

NS_ASSUME_NONNULL_END
