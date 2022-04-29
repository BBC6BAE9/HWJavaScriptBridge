//
//  PerformanceDashboardVC.m
//  JSServiceDemo
//
//  Created by bbc6bae9 on 2022/3/30.
//

#import "PerformanceDashboardVC.h"

@interface PerformanceDashboardVC()
@property(nonatomic, strong)UITextView *tf;
@end

@implementation PerformanceDashboardVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Dashboard·性能";
    
    UITextView *tf = [[UITextView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_HEIGHT)];
    tf.backgroundColor = [UIColor blackColor];
    tf.textColor = [UIColor whiteColor];
    tf.font = [UIFont systemFontOfSize:16];
    self.tf = tf;
    if (_perfData) {
        self.tf.text = [NSString stringWithFormat:@"%@", _perfData];
    }else{
        self.tf.text = @"暂时没有数据";
    }
    
    [self.view addSubview:tf];
}

-(void)setPerfData:(NSDictionary *)perfData{
    _perfData = perfData;
    
}
@end
