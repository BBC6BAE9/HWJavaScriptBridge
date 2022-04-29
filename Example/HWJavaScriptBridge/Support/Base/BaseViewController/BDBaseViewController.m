//
//  BDBaseViewController.m
//  JSServiceDemo
//
//  Created by bbc6bae9 on 2022/1/12.
//

#import "BDBaseViewController.h"
#import "NavigationBarView.h"
#import "UIView+Toast.h"
#import "Theme.h"
#import "BDLoadingView.h"

@interface BDBaseViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic, strong)BDLoadingView *loadingView;

@end

@implementation BDBaseViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self enablePopGesture];
    
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    BDLoadingView *loadingView = [[BDLoadingView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_HEIGHT)];
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(event:)];
    [tapGesture setNumberOfTapsRequired:1];
    [loadingView addGestureRecognizer:tapGesture];
    self.loadingView = loadingView;
    [self.view addSubview:loadingView];
    
    [self hideLoadingPage];
    
    BDNavigationView *navView = [[BDNavigationView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAV_HEIGHT)];
    self.navView = navView;
    navView.title = self.title;
    [navView.leftItem addTarget:self action:@selector(leftItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [navView.rightItem addTarget:self action:@selector(rightItemClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navView];
    navView.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    
    if (self.navigationController.viewControllers.count > 1){
        [self.navView.leftItem setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    }else{
        if (self.presentingViewController){
            [self.navView.leftItem setImage:[UIImage imageNamed:@"nav_dismiss"] forState:UIControlStateNormal];
        }
    }
    
}

-(void)event:(UITapGestureRecognizer *)gesture{
    if (LodingStatus_Fail == self.loadingView.lodingStatus) {
        [self tapToRefresh];
    }
}

- (void)tapToRefresh{
    
}

// override present出来的VC都全屏展示
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)showMsg:(NSString *)msg{
    [self.navigationController.view makeToast:msg duration:3 position:CSToastPositionCenter];
}

- (void)showLoadingPage{
    self.loadingView.hidden = NO;
    [self.view bringSubviewToFront:self.loadingView];
    [self.loadingView showLoding];
}

- (void)hideLoadingPage{
    self.loadingView.hidden = YES;
}

- (void)showLoadingFailPage{
    self.loadingView.hidden = NO;
    [self.view bringSubviewToFront:self.loadingView];
    [self.loadingView showFail];
}

- (void)showLoding{
    [self.navigationController.view makeToastActivity:CSToastPositionCenter];
}

- (void)stopLoding{
    [self.navigationController.view hideToastActivity];
}

- (void)feedBack{
    if (@available(iOS 11.0, *))
    {
        UIImpactFeedbackGenerator *feedBackGenertor = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [feedBackGenertor impactOccurred];
    }
}

- (void)leftItemClick:(UIButton*)sender{
    if (self.navigationController.viewControllers.count > 1){
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        if (self.presentingViewController){
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

- (void)rightItemClick:(UIButton*)sender{
    
}

- (void)setTitle:(NSString *)title{
    [super setTitle:title];
    self.navView.title = title;
}

@end
