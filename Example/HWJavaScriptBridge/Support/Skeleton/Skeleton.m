//
//  Skeleton.m
//  Baodianma
//
//  Created by ihenryhuang on 2022/1/13.
//

#import "Skeleton.h"

@implementation Skeleton

+ (UIViewController *)currentVC{
    UIWindow *window =  [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    UIViewController* vc = window.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}


@end
