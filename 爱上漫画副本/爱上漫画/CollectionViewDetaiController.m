//
//  CollectionViewDetaiController.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "CollectionViewDetaiController.h"
#import "ChapterCell.h"
#import "collectionViewDetailModel.h"
#import "Detail4Controller.h"

@interface CollectionViewDetaiController()
@property(nonatomic,strong)NSMutableArray *dataArray;
@end
@interface CollectionViewDetaiController ()

@end

@implementation CollectionViewDetaiController
static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ChapterCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
    [self result];
}
#pragma mark ======== 懒加载 ========
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray new];
        
    }
    return _dataArray;
}

#pragma mark ======== 数据解析 ========
-(void)result{
    NSString *urlStr = [NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/topics/%@?sort=0",self.datailID];
    NSLog(@"%@", urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
    
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //解析数据
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
     //   self.dataArray = [NSMutableArray arrayWithCapacity:20];
        NSDictionary *dic = rootDic[@"data"];
        NSArray *array = dic[@"comics"];
        for (NSDictionary *dic in array) {
            collectionViewDetailModel *model = [collectionViewDetailModel new];
            [model setValuesForKeysWithDictionary:dic];
          //  NSLog(@"5555555555%@",model.title);
            [self.dataArray addObject:model];
          //  NSLog(@"666666%ld",self.dataArray.count);
         
        }
        [self.tableView reloadData];
    }];
    [dataTask resume];
    
    
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
   
        return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ChapterCell *cell  = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.collectionModel = self.dataArray[indexPath.row];
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
//跳转到详情页面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Detail4Controller *cool = [[Detail4Controller alloc]init];
    collectionViewDetailModel *mood = self.dataArray[indexPath.row];
    
    cool.str = mood.url;
    NSLog(@"%@",mood.url);
    [self.navigationController pushViewController:cool animated:YES];
    
}


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
