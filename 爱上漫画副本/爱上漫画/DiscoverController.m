//
//  DiscoverController.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "DiscoverController.h"
#import "loboModel.h"
#import "UIImageView+WebCache.h"
#define kBaseURL @"http://api.kuaikanmanhua.com/v1/banners"
//#import "ComicGenreGroup.h"
//#import "Comics.h"
#import "AFNetworking.h"
#import "DiscoverCell.h"
#import "CollectionModel.h"
#import "PicModel.h"
#import "CollectionViewDetaiController.h"
#define kWidth self.tableView.bounds.size.width

@interface DiscoverController() <UIScrollViewDelegate>

@property(strong,nonatomic)NSMutableArray *dataArray;
// 顶部轮播图
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIImageView *img1;
@property (strong, nonatomic) UIImageView *img2;
@property (strong, nonatomic) UIImageView *img3;
@property (strong, nonatomic) UIImageView *img4;
@property (strong, nonatomic) UIImageView *img5;

//collectionView
@property (strong,nonatomic) NSMutableArray * allDataArray;




@end

@interface DiscoverController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@end

@implementation DiscoverController
static NSString *indetifier = @"cell";

#pragma mark ======== 懒加载 ========

-(NSMutableArray *)dataArray{
    if (_dataArray  == nil) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView = [UIScrollView new];
        
    }
    return _scrollView;
}

// 集合视图的数组
-(NSMutableArray *)allDataArray{
    if (!_allDataArray) {
        self.allDataArray = [NSMutableArray array];
    }
    return _allDataArray;
}

// 头视图
-(UIView *)headerView{
    if (_headerView == nil) {
        
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 250)];
        
        // 创建轮播图
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 240)];
        _scrollView.pagingEnabled = YES;
        
        _scrollView.contentSize = CGSizeMake(kWidth*5, 240);
        
        _img1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 240)];
        [_scrollView addSubview:_img1];
        _img1.backgroundColor = [UIColor redColor];
    
        _img2 = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth, 0, kWidth, 240)];
        [_scrollView addSubview:_img2];
        _img2.backgroundColor = [UIColor yellowColor];
        
        _img3 = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth*2, 0, kWidth, 240)];
        [_scrollView addSubview:_img3];
        _img3.backgroundColor = [UIColor blueColor];

        _img4 = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth*3, 0, kWidth, 240)];
        [_scrollView addSubview:_img4];
        _img4.backgroundColor = [UIColor cyanColor];

        _img5 = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth*4, 0, kWidth, 240)];
        [_scrollView addSubview:_img5];
        _img5.backgroundColor = [UIColor yellowColor];
        
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        [_headerView addSubview:_scrollView];

        //创建pageControl
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(230, 220, 100, 30)];
        _pageControl.numberOfPages = 5;
        _pageControl.pageIndicatorTintColor = [UIColor greenColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        [_headerView addSubview:_pageControl];
        
        }
    return _headerView;
        
}

#pragma mark ======== 自定义方法 ========

// scrollview赋值
-(void)buildScrollView{
    [_img1 sd_setImageWithURL:[NSURL URLWithString:[_dataArray[0] pic]]];
    [_img2 sd_setImageWithURL:[NSURL URLWithString:[_dataArray[1] pic]]];
    [_img3 sd_setImageWithURL:[NSURL URLWithString:[_dataArray[2] pic]]];
    [_img4 sd_setImageWithURL:[NSURL URLWithString:[_dataArray[3] pic]]];
    [_img5 sd_setImageWithURL:[NSURL URLWithString:[_dataArray[4] pic]]];
}

#pragma mark ======== 数据解析 ========

// 轮播图数据解析
-(void)requestData{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:kBaseURL]];
    NSURLSessionTask *test = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dic= dict[@"data"];
        NSArray *array = dic[@"banner_group"];
        for (NSDictionary *di  in array) {
            loboModel *lunbo = [loboModel new];
            [lunbo setValuesForKeysWithDictionary:di];
            [self.dataArray addObject:lunbo];
            NSLog(@"+++++++++++++++++++++=%@",self.dataArray);
        }
        //给轮播图赋值
        [self buildScrollView];
    }];
    [test resume];
    
    
}

// 集合视图数据解析
-(void)result{
    
//     dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:kFindUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
        NSDictionary *dic2 = dic[@"data"];
        //topics对应的array
        NSArray *array = dic2[@"topics"];
        for (NSDictionary *obj in array) {
            
            //collectionModel的解析
            CollectionModel *collection = [CollectionModel new];
            collection.title = obj[@"title"];
            NSArray *picArray = obj[@"topics"];
            
            //定义一个可变数组，用来存放picModel
            NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:5];
            for (NSDictionary *dic in picArray) {
                PicModel *picModel = [PicModel new];
                [picModel setValuesForKeysWithDictionary:dic];
                [mArray addObject:picModel];
               
                
            }
            collection.topics = mArray.copy;
            
            
            [self.allDataArray addObject:collection];
            [self.tableView reloadData];
        }
    }failure:^(NSURLSessionDataTask *task, NSError *error) {

    }];
}
     
#pragma mark ======== 控制器的方法 ========

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headerView;
    [self requestData];
//    [self result];

    
    [self.tableView registerNib:[UINib nibWithNibName:@"DiscoverCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
};

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self result];
    //[self buildScrollView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ======== scroll view delegate ========
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint point = _scrollView.contentOffset;
    _pageControl.currentPage = point.x / kWidth;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // cell重用
    DiscoverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    
    // 获取需要显示的模型
    NSArray *array = self.allDataArray;
    CollectionModel *collection = array[indexPath.row];
        
    // model赋值
    cell.collectionModel = collection;
    
    // 实现block 完成跳转和传值
    cell.block = ^(NSInteger index){
        CollectionViewDetaiController *cooo = [[CollectionViewDetaiController alloc]init];
        PicModel *pic = collection.topics[indexPath.row];
        cooo.datailID = pic.ID;
        
        NSLog(@"777777777%@",pic.ID);

        
        [self.navigationController pushViewController:cooo animated:YES];
        
        NSLog(@"%ld",(long)index);
    };
    
    // 返回cell
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
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
