//
//  BDNavigationViewController.m
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/1/12.
//

#import "BDNavigationViewController.h"

@interface BDNavigationViewController () <UINavigationControllerDelegate>

@end

@implementation BDNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
//    // 导航栏背景颜色
//    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
//
//    // 导航栏标题字体颜色
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor blueColor]}];
//
//    // 导航栏左右按钮字体颜色
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    // self.viewControllers[0]表示根控制器
    if ([viewController isEqual:self.viewControllers.firstObject]) {
        viewController.hidesBottomBarWhenPushed = NO;
    }
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0 && ![viewController isEqual:self.viewControllers.firstObject]) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
