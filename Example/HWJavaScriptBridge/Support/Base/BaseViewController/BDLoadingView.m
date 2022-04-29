//
//  BDLoadingView.m
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/1/31.
//  Copyright © Howen Technology All rights reserved.
//

#import "BDLoadingView.h"
#import "UIStyle.h"
#import "Theme.h"



@interface BDLoadingView()

@property(nonatomic, strong)UIImageView *resultImageView; // 结果图片展示
@property(nonatomic, strong)UIActivityIndicatorView *activityIndicator; // indicator
@property(nonatomic, strong)UILabel *tipLabel; // 提示label

@end

@implementation BDLoadingView

- (instancetype)init{
    if (self = [super init]) {
        [self createUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.backgroundColor = BACKGROUNDCOLOR;
    UIImageView *resultImageView = [[UIImageView alloc] init];
    resultImageView.image = [UIImage imageNamed:@"load_fail"];
    self.resultImageView = resultImageView;
    [self addSubview:resultImageView];
    
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityIndicator = activityIndicator;
    [self addSubview:activityIndicator];
    activityIndicator.color = THEMECOLOR;
//    [activityIndicator startAnimating];
//    [activityIndicator stopAnimating];
    
    UILabel *tipLabel = [[UILabel alloc] init];
    self.tipLabel = tipLabel;
    tipLabel.font = [UIFont systemFontOfSize:SCALE(19)];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = [UIColor lightGrayColor];
    tipLabel.text = @"加载失败，请触重试～";
    [self addSubview:tipLabel];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    CGFloat resultImageViewH = SCALE(158);
    CGFloat resultImageViewW = SCALE(238);
    CGFloat resultImageViewX = (width - resultImageViewW) / 2;
    CGFloat resultImageViewY = (height - resultImageViewH) / 2;
    self.resultImageView.frame = CGRectMake(resultImageViewX, resultImageViewY, resultImageViewW, resultImageViewH);
    self.activityIndicator.center = self.center;
    
    CGFloat tipLabelX = 12;
    CGFloat tipLabelY = resultImageViewY + resultImageViewH + SCALE(40);
    CGFloat tipLabelW = width;
    CGFloat tipLabelH = SCALE(19);
    self.tipLabel.frame = CGRectMake(tipLabelX, tipLabelY, tipLabelW, tipLabelH);
    
}

- (void)showLoding{
    self.lodingStatus = LodingStatus_Loding;
    self.resultImageView.hidden = YES;
    self.tipLabel.hidden = YES;
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
}

- (void)showFail{
    self.lodingStatus = LodingStatus_Fail;
    self.resultImageView.hidden = NO;
    self.tipLabel.hidden = NO;
    self.activityIndicator.hidden = YES;
    [self.activityIndicator stopAnimating];
}
@end
