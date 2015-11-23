//
//  LeftViewController.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "LeftViewController.h"
#import "AppDelegate.h"
#import "LookController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kMagin 10








@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *setArray;
@property(nonatomic,strong)UISwitch *mySwitch;
@property(nonatomic,assign)BOOL isNight;
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-100, kScreenHeight ) style:(UITableViewStylePlain)];
    // 设置代理和数据源
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.tableView addSubview:self.tableView];
    
    self.setArray = @[@"我的收藏",@"夜间模式",@"清除缓存",@"免责声明",@"关于我们"];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight*0.4)];
    view.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = view;
    self.isNight = NO;
    
    
    }

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
#pragma mark ======== 方法 ========
// 返回数组个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.setArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cell_id = @"setCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    cell.textLabel.text = self.self.setArray[indexPath.row];
    cell.textLabel.textColor  = [UIColor blackColor];
    // 此处需要一个图片
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"aaa"]];
    
    cell.accessoryType = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
 //   [[LookController shared] closeLeftDrawer:nil animated:YES];

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
