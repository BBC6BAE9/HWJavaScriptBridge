//
//  BDBaseWebViewController.h
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/2/7.
//  Copyright © Howen Technology All rights reserved.
//

#import "BDBaseViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BDBaseWebViewController : BDBaseViewController

@property (nonatomic,strong)WKWebView * webView;

@property(nonatomic, strong)NSURL *url;

-(NSDictionary *)performanceResult;

@end

NS_ASSUME_NONNULL_END
