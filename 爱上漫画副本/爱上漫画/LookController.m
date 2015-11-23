//
//  LookController.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "LookController.h"
#import "LookCell.h"
#import "LookModel.h"
#import "DataManager.h"
#import "UIImageView+WebCache.h"
#import "DetailController.h"
#import "MJRefresh.h"
#import "datail.h"

//#import "JVFloatingDrawerViewController.h"
//#import "JVFloatingDrawerSpringAnimator.h"
//#import "LeftViewController.h"
//#import "AppDelegate.h"
//

@interface LookController ()
/*
{
    // 抽屉视图
    JVFloatingDrawerViewController *_drawerViewController;
}

*/

@end

@implementation LookController

static NSString *indent = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加下拉刷新方法
    [self.tableView addHeaderWithTarget:self action:@selector(refresh)];
    
    //自动下拉刷新
    [self.tableView headerBeginRefreshing];
    
    // 添加上拉加载
    [self.tableView addFooterWithTarget:self action:@selector(refresh)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LookCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:indent];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [DataManager sharedManager].reloadBlock = ^{
        [self.tableView reloadData];
    };
    // 移除下拉刷新方法
    [self.tableView removeHeader];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//实现刷新方法，调用解析数据方法
- (void) refresh{
    [[DataManager sharedManager] requestData:kMainUrl];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = [DataManager sharedManager].dataArray;
    
    return array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LookCell *cell = [tableView dequeueReusableCellWithIdentifier:indent forIndexPath:indexPath];
    NSArray *array = [DataManager sharedManager].dataArray;
    LookModel *model = array[indexPath.row];
    
    cell.lookModel = model;
    // 设置选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 300;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailController *detail1 = [[DetailController alloc]init];
    LookModel *look = [DataManager sharedManager].dataArray[indexPath.row];
    detail1.datailID = look.ID;
    NSLog(@"++++++++++++++Z+++++++++%@",detail1.datailID);
    [self.navigationController pushViewController:detail1 animated:YES];
    
    
}


/*
- (IBAction)弹窗:(id)sender {
    
    [self abc];
}


-(void)abc{
    LookController *lookVC = [[LookController alloc]init];
    
    _drawerViewController = [[JVFloatingDrawerViewController alloc]init];
    
    LeftViewController *leftVC = [[LeftViewController alloc]init];
    
    leftVC.leftPushVC = lookVC;

    _drawerViewController.leftViewController = leftVC;
    _drawerViewController.centerViewController = lookVC;
    
    _drawerViewController.animator = [[JVFloatingDrawerSpringAnimator alloc]init];
    
    _drawerViewController.leftDrawerWidth = 250;
    _drawerViewController.backgroundImage = [UIImage imageNamed:@"x.jpg"];

}

#pragma mark ======== Global Access Helper ========

+(LookController *)shared{
    return (LookController *)[UIApplication sharedApplication].delegate;
}

-(void)toggleLeftDrawer:(id)sender animated:(BOOL)animated{
    [_drawerViewController toggleDrawerWithSide:JVFloatingDrawerSideLeft animated:animated completion:nil];
    
}

-(void)closeLeftDrawer:(id)sender animated:(BOOL)animated{
    [_drawerViewController closeDrawerWithSide:JVFloatingDrawerSideLeft animated:animated completion:nil];
}

*/


@end
