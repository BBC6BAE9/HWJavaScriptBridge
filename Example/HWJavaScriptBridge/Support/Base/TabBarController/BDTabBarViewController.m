//
//  TableViewController.m
//  Baodianma
//
//  Created by ihenryhuang on 2022/1/12.
//  Copyright © 2022 Tencent Inc. All rights reserved.
//

#import "BDTabBarViewController.h"

#import "BDNavigationViewController.h"
#import "Theme.h"
#import "HomeViewController.h"

#define NORMAL_TITLE_COLOR [UIColor colorWithHexString:@"#dbdbdb"]
@interface BDTabBarViewController ()

@end

@implementation BDTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    HomeViewController *v2 = [[HomeViewController alloc] init];
    [self setTabBarItem:v2.tabBarItem
                  title:@"Home"
              titleSize:13.0
          titleFontName:@"HeiTi SC"
          selectedImage:@"tab_qrcode_selected"
     selectedTitleColor:THEMECOLOR
            normalImage:@"tab_qrcode_normal"
       normalTitleColor:NORMAL_TITLE_COLOR];

    BDNavigationViewController *n2 = [[BDNavigationViewController alloc] initWithRootViewController:v2];
    
    NSArray *array = @[n2];
    
    self.viewControllers = array;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if (@available(iOS 11.0, *))
    {
        UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [feedBackGenertor impactOccurred];
     }
}

- (void)setTabBarItem:(UITabBarItem *)tabbarItem
                title:(NSString *)title
            titleSize:(CGFloat)size
        titleFontName:(NSString *)fontName
        selectedImage:(NSString *)selectedImage
   selectedTitleColor:(UIColor *)selectColor
          normalImage:(NSString *)unselectedImage
     normalTitleColor:(UIColor *)unselectColor {
    
    //设置图片
    tabbarItem = [tabbarItem initWithTitle:title image:[[UIImage imageNamed:unselectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // S未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:unselectColor,NSFontAttributeName:[UIFont fontWithName:fontName size:size]} forState:UIControlStateNormal];
    
    // 选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:selectColor,NSFontAttributeName:[UIFont fontWithName:fontName size:size]} forState:UIControlStateSelected];
    
    self.tabBar.tintColor = THEMECOLOR;
    
}
@end
