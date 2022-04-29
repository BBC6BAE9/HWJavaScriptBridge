//
//  BDNavigationView.h
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/2/22.
//  Copyright © Howen Technology All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BDNavigationView : UIView

@property(nonatomic, strong)UILabel *titleLb;

/// 导航栏标题
@property(nonatomic, copy)NSString *title;

@property(nonatomic, strong) UIButton *leftItem;

@property(nonatomic, strong) UIButton *rightItem;

@end

NS_ASSUME_NONNULL_END
