//
//  ChapterCell.m
//  爱动漫
//
//  Created by lanou3g on 15/11/22.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ChapterCell.h"
#import "UIImageView+WebCache.h"



@implementation ChapterCell




-(void)setCollectionModel:(collectionViewDetailModel *)collectionModel{
    [_chapter4Image sd_setImageWithURL:[NSURL URLWithString:collectionModel.cover_image_url]];
    _chapter4LB.text = collectionModel.title;
    _Time4LB.text =[NSString stringWithFormat:@"%ld",collectionModel.updated_at];
       }

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
