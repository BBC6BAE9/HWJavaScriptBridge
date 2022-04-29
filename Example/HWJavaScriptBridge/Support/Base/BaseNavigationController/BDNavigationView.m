//
//  BDNavigationView.m
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/2/22.
//  Copyright © Howen Technology All rights reserved.
//

#import "BDNavigationView.h"
#import "UIStyle.h"
#import "Theme.h"

@interface BDNavigationView()



@end
@implementation BDNavigationView

- (instancetype)init{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

// 通用初始化
- (void)commonInit{
    self.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLb = [[UILabel alloc] init];
    titleLb.textAlignment = NSTextAlignmentCenter;
    titleLb.backgroundColor = [UIColor whiteColor];
    self.titleLb = titleLb;
    titleLb.font = [UIFont boldSystemFontOfSize:18];
    titleLb.text = @"";
    [self addSubview:titleLb];
    
    UIButton *leftItem = [[UIButton alloc] init];
    [leftItem setTitleColor:THEMECOLOR forState:UIControlStateNormal];
    leftItem.backgroundColor = [UIColor whiteColor];
    leftItem.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.leftItem = leftItem;
    [self addSubview:leftItem];

    UIButton *rightItem = [[UIButton alloc] init];
    [rightItem setTitleColor:THEMECOLOR forState:UIControlStateNormal];
    rightItem.backgroundColor = [UIColor redColor];
    rightItem.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    self.rightItem = rightItem;
    [self addSubview:rightItem];
    
}

- (void)layoutSubviews{
    CGFloat sideMargin = 12;
    CGFloat itemWH = 33;
    CGFloat titleH = 19;
    CGFloat titleW = SCREEN_WIDTH - 4 * sideMargin - 2 * itemWH;
    CGFloat titleX = sideMargin + itemWH + sideMargin;
    CGFloat titleY = StatusBarHeight + (44 - titleH)/2;
    self.titleLb.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat leftItemX = sideMargin;
    CGFloat leftItemY = StatusBarHeight + (44 - itemWH)/2;;
    self.leftItem.frame = CGRectMake(leftItemX, leftItemY, itemWH, itemWH);
    
    
    CGFloat rightItemX = SCREEN_WIDTH - sideMargin - itemWH;
    CGFloat rightItemY = leftItemY;
    self.rightItem.frame = CGRectMake(rightItemX, rightItemY, itemWH, itemWH);
}

#pragma mark - Setter
- (void)setTitle:(NSString *)title{
    _title = title;
    self.titleLb.text = title;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];
    [self.leftItem setBackgroundColor:backgroundColor];
    [self.rightItem setBackgroundColor:backgroundColor];
    [self.titleLb setBackgroundColor:backgroundColor];
}
@end
