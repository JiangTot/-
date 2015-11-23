//
//  LookCell.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "LookCell.h"
#import "LookModel.h"
#import "UIImageView+WebCache.h"



@interface LookCell ()

@property (strong, nonatomic) IBOutlet UIImageView *authorImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *authorLabel;

@property (strong, nonatomic) IBOutlet UILabel *likeLabel;

@property (strong, nonatomic) IBOutlet UILabel *commentLabel;

@property (strong, nonatomic) IBOutlet UIImageView *carttionImageView;



@end

@implementation LookCell


-(void)setLookModel:(LookModel *)lookModel{
    _titleLabel.text  = [NSString stringWithFormat:@"%@",lookModel.title];
    _authorLabel.text = [NSString stringWithFormat:@"%@",lookModel.comments_count];
    _likeLabel.text = [NSString stringWithFormat:@"%@",lookModel.likes_count];
    _commentLabel.text = [NSString stringWithFormat:@"%@",lookModel.shared_count];
    
    NSLog(@"%@",lookModel.shared_count);
    [_carttionImageView sd_setImageWithURL:[NSURL URLWithString:lookModel.cover_image_url]];
    
}


- (void)awakeFromNib {
    // 设置圆角
    self.authorImageView.layer.masksToBounds = YES;
    self.authorImageView.layer.cornerRadius = 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
