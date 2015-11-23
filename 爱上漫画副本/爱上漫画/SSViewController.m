//
//  SSViewController.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "SSViewController.h"
#define kAction @"http://api.kuaikanmanhua.com/v1/tag/suggestion"
#import "AFNetworking.h"
#import "SSModel.h"
#import "UIImageView+WebCache.h"

@interface SSViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property(nonatomic,strong)NSMutableArray *array;

@property (nonatomic, retain)UICollectionView *collection;
@end

@implementation SSViewController
static NSString *cellIdentifier = @"cellReuse";


- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 50;
    layout.minimumInteritemSpacing = 30;
    layout.itemSize = CGSizeMake(100, 100);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);

         
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 110, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:layout];
    self.collection = collectionView;
    
       collectionView.backgroundColor = [UIColor whiteColor];
    // 代理和数据源
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
   
    [self abcd];
    [self.view addSubview:collectionView];
 
    
}


#pragma mark ======== 数据解析 ========
-(void)abcd{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:kAction parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
        NSDictionary *dict = dic[@"data"];
       
        NSArray *array = dict[@"suggestion"];
        for (NSDictionary *obj in array) {
            SSModel *model = [SSModel new];
            [model setValuesForKeysWithDictionary:obj];
           [self.array addObject:model];
            NSLog(@"   dfsda%@",[_array lastObject]);
        }
        
        [self.collection reloadData];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
    }];
    

}

- (NSMutableArray *)array{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

#pragma mark ======== 分组个数 ========
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _array.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    for (UIView *view in cell.subviews) {
        [view removeFromSuperview];
    }
    cell.contentView.backgroundColor = [UIColor yellowColor];
    UIImageView *image = [[UIImageView alloc]init];
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius = 50;
    image.frame = CGRectMake(0, 0, 100, 100);
    [cell addSubview:image];
    SSModel *model = self.array[indexPath.row];
    NSLog(@"%@",model.icon);
    [image sd_setImageWithURL:[NSURL URLWithString: model.icon] placeholderImage:nil];
    
    return cell;
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"英雄联盟");
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return  UIEdgeInsetsMake(50, 20, 20, 20);
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
