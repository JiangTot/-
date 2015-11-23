//
//  imageCell.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "imageCell.h"

@implementation imageCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 创建并初始化
        self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
    }
    return self;
}


@end
