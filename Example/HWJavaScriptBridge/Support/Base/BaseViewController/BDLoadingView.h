//
//  BDLoadingView.h
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/1/31.
//  Copyright © Howen Technology All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    LodingStatus_Fail,
    LodingStatus_Loding,
}LodingStatus;

@interface BDLoadingView : UIView

@property(nonatomic, assign)LodingStatus lodingStatus;

- (void)showLoding;

- (void)showFail;

@end

NS_ASSUME_NONNULL_END
