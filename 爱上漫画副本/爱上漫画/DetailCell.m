//
//  DetailCell.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "DetailCell.h"
#import "datail.h"
#import "UIImageView+WebCache.h"
@interface DetailCell ()

@property (strong, nonatomic) IBOutlet UIImageView *datailImage;

@end

@implementation DetailCell

-(void)setUrl:(NSString *)url{
    [_datailImage sd_setImageWithURL:[NSURL URLWithString:url]];
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
