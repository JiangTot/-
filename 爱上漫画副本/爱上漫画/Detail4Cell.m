//
//  Detail4Cell.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "Detail4Cell.h"
#import "UIImageView+WebCache.h"



@interface Detail4Cell () <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
@implementation Detail4Cell





// 用传过来的参数给属性赋值
- (void)setString:(NSString *)string{
    
    _string = string;
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.webView.delegate = self;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_string]];
    [self.webView loadRequest:request];
    [self addSubview:_webView];
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
