//
//  RecommendCartoon.h
//  Cartoon
//
//  Created by lanou3g on 15/10/23.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendCartoon : NSObject

#pragma mark --------- Comics
@property (nonatomic, strong) NSNumber *comments_count;//评论数
@property (nonatomic, copy) NSString *cover_image_url;//列表封面图片
@property (nonatomic, strong) NSNumber *created_at;//最新作品发表时间
@property (nonatomic, strong) NSNumber *list_id;//作品列表id(需要处理)
@property (nonatomic, assign) BOOL is_liked;//取消关注
@property (nonatomic, strong) NSNumber *likes_count;//关注数
@property (nonatomic, strong) NSNumber *shared_count;//分享数
@property (nonatomic, copy) NSString *title;//小标题名
@property (nonatomic, strong) NSDictionary *topic;//主题
@property (nonatomic, strong) NSNumber *updated_at;//刷新时间
@property (nonatomic, copy) NSString *url;//漫画网址



















@end
