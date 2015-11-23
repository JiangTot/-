//
//  personalController.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "personalController.h"
#import "personalCell.h"
#import "personalHeaderView.h"
#import "LandController.h"

@interface personalController ()

@end

@implementation personalController
static NSString *identifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    personalHeaderView *head = [[personalHeaderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    
    self.tableView.tableHeaderView = head;

    
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"personalCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    personalCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    NSArray *array = @[@"我的消息",@"我的关注",@"我的收藏",@"设置"];
    cell.textLabel.text = array[indexPath.row];
    
    NSArray *ar = @[@"1.png",@"2.png",@"3.png",@"4.png"];
    cell.imageView.image = [UIImage imageNamed:ar[indexPath.row]];
    // 设置选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    return cell;
}

//- (IBAction)land:(id)sender {
//    LandController *land = [[LandController alloc]init];
//    [self.navigationController pushViewController:land animated:YES];
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
