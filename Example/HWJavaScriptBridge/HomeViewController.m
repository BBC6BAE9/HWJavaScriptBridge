//
//  HomeViewController.m
//  JSServiceDemo
//
//  Created by ihenryhuang on 2022/3/28.
//

#import "HomeViewController.h"
#import "BDNavigationViewController.h"
#import "VBWebViewController.h"
#import "UIView+Toast.h"
#import "VBViewController.h"
#import "BridgeDemoViewController.h"

static NSString *tencentSportVip = @"https://www.baidu.com";

@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)NSArray *dataArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[
        @"普通打开URL",
        @"调试bridge",
    ];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_HEIGHT- TABBAR_HEIGHT)];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    self.title = @"Home";
    
}

#pragma datasource&delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"passagescell" ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier] ;
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] ;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = self.dataArray[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            NSURL *url = [NSURL URLWithString:tencentSportVip];
            VBWebViewController *vc = [[VBWebViewController alloc] init];
            vc.url = url;
            vc.title = [url host];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            BridgeDemoViewController *vc = [[BridgeDemoViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
