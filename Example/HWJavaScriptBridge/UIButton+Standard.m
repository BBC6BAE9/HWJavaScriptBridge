//
//  UIButton+Standard.m
//  HNPreRenderiOS_Example
//
//  Created by ihenryhuang on 2022/4/27.
//  Copyright © 2022 Tencent. All rights reserved.
//

#import "UIButton+Standard.h"
#import "UIStyle.h"

@implementation UIButton (Standard)

+ (UIButton*)standardButton{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(12, NAV_HEIGHT + 12, SCREEN_WIDTH - 12 * 2, 70)];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"JSContextBridge" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:19];
    btn.backgroundColor = P500;
    return btn;
}

@end
