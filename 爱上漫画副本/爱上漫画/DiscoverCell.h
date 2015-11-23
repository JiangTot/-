//
//  DiscoverCell.h
//  爱上漫画
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CollectionModel.h"

#import "PicModel.h"

typedef void(^CellBlock)(NSInteger index);

@protocol ClickImageViewDelegate <NSObject>

typedef void (^ReloadBlock)(NSArray *);

@end

@interface DiscoverCell : UITableViewCell

// 需要在视图上显示的内容
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UICollectionView *collection;

@property (nonatomic, copy)CellBlock  block;



// CollectionModel
@property (nonatomic, retain) CollectionModel *collectionModel;

@end
