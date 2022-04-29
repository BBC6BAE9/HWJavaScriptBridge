//
//  NavigationBarView.m
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/1/22.
//

#import "NavigationBarView.h"
#import "UIStyle.h"

@interface NavigationBarView()

@end

@implementation NavigationBarView

- (instancetype)init{
    if (self = [super init]) {
        [self createUI];
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, NAV_HEIGHT);
    }
    return self;
}

- (void)createUI{
    CGFloat sideMargin = 16;
    self.backgroundColor = [UIColor whiteColor];
    CGFloat itemH = 34;
    CGFloat itemY = NAV_HEIGHT - 5 - itemH;
    UIButton *leftItem = [[UIButton alloc] initWithFrame:CGRectMake(sideMargin, itemY, itemH, itemH)];
    [leftItem setBackgroundImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    leftItem.titleLabel.font = [UIFont systemFontOfSize:17];
    leftItem.backgroundColor = [UIColor whiteColor];
    [self addSubview:leftItem];
    
    UIButton *rightItem = [[UIButton alloc] initWithFrame:CGRectMake(0, itemY, itemH, itemH)];
    rightItem.titleLabel.font = [UIFont systemFontOfSize:17];
    [self addSubview:rightItem];
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

@end
