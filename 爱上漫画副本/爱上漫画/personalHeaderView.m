//
//  personalHeaderView.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "personalHeaderView.h"
#import "LandController.h"

@implementation personalHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.View = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, frame.size.height)];
        _View.backgroundColor = [UIColor grayColor];
        
        [self addSubview:_View];
        
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(150, 70, 100, 100)];
        _imgView.image = [UIImage imageNamed:@"登陆头像.png"];
        
        _imgView.center =_View.center;
        
        // 设置圆角
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.cornerRadius = 50;
        
        
        
        [self.View addSubview:_imgView];
        
        self.btn = [[UIButton alloc]initWithFrame:CGRectMake(120, 160,180, 30)];
        _btn.backgroundColor = [UIColor grayColor];
        [_btn setTitle:@"登陆以享受更多功能" forState:(UIControlStateNormal)];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
        
        [self.View addSubview:_btn];
    
    }
    return self;
}


@end
