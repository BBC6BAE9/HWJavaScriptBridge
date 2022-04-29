//
//  NavigationBarView.h
//  JSServiceDemo
//
//  Created by bbc6bae9 on 2022/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NavigationBarView : UIView

@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)UIButton *leftItem;
@property(nonatomic, strong)UIButton *rightItem;

@end

NS_ASSUME_NONNULL_END
