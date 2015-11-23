//
//  DiscoverCell.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "DiscoverCell.h"
//#import "ComicGenreGroup.h"
//#import "Topics.h"
//#import "Comics.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"
#import "loboModel.h"
#import "imageCell.h"
#import "PicModel.h"
#import "DiscoverController.h"
#import "CollectionViewDetaiController.h"

@interface DiscoverCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property(nonatomic,assign)NSInteger type;

@property(strong,nonatomic)NSMutableArray * allDataArray;


@end

@implementation DiscoverCell


#pragma mark ======== 懒加载 ========
-(NSMutableArray *)allDataArray{
    if (_allDataArray == nil) {
        _allDataArray = [NSMutableArray new];
        
    }
    return _allDataArray;
}
#pragma mark ======== setter方法 ========

- (void)setCollectionModel:(CollectionModel *)collectionModel{
    _collectionModel = collectionModel;
    self.titleLabel.text = collectionModel.title;
}


- (void)awakeFromNib {
    
    // 在定义集合视图设置数据源和代理
    _collection.dataSource = self;
    _collection.delegate = self;
    
    // cell 上面的集合视图的注册
    [self.collection registerClass:[imageCell class] forCellWithReuseIdentifier:@"simpleCell"];
    // 初始化flowLayout
    self.flowLayout =[[UICollectionViewFlowLayout alloc]init];
    
    [_flowLayout setItemSize:CGSizeMake(120, self.collection.bounds.size.height) ];
    // 设置横向滑动
    [_flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    _flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 0);
    [_collection setCollectionViewLayout:_flowLayout];
    
    // 隐藏下面的滚动条
    _collection.showsHorizontalScrollIndicator = NO;
    
     }

#pragma mark ======== collection view delegate ========

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _collectionModel.topics.count;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.block(indexPath.row);
    
    NSLog(@"我爱漫画");
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 重用(和cell 一样)
    imageCell *cell = [self.collection dequeueReusableCellWithReuseIdentifier:@"simpleCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor cyanColor];
    
    // 获取对应的cell
    PicModel *picModel = _collectionModel.topics[indexPath.row];
    
    // model赋值
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:picModel.vertical_image_url]];
    
    // 返回cell
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}











@end
