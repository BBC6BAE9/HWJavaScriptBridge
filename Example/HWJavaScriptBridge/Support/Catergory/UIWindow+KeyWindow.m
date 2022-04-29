//
//  UIWindow+KeyWindow.m
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/2/1.
//  Copyright © Howen Technology All rights reserved.
//

#import "UIWindow+KeyWindow.h"

@implementation UIWindow (KeyWindow)

+ (UIWindow*)keyWindow {
    UIWindow *foundWindow = nil;
    NSArray  *windows = [[UIApplication sharedApplication]windows];
    for (UIWindow  *window in windows) {
        if (window.isKeyWindow) {
            foundWindow = window;
            break;
        }
    }
    return foundWindow;
}

@end
