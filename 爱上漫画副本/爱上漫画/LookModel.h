//
//  LookModel.h
//  爱上漫画
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LookModel : NSObject

@property (nonatomic, retain)NSNumber * comments_count;// 评论数
@property (nonatomic, copy)NSString * cover_image_url; // 列表封面图片
@property (nonatomic, retain)NSNumber * created_at; // 最新作品发表时间
@property (nonatomic, retain)NSNumber * list_id; // 作品列表id
@property(nonatomic,strong )NSString *ID;//作品列表id(需要处理)
@property (nonatomic, assign)BOOL is_likes; //取消关注
@property (nonatomic, strong) NSNumber *likes_count;//关注数
@property (nonatomic, strong) NSNumber *shared_count;//分享数
@property (nonatomic, copy) NSString *title;//小标题名
@property (nonatomic, strong) NSDictionary *topic;//主题
@property (nonatomic, strong) NSNumber *updated_at;//刷新时间
@property (nonatomic, copy) NSString *url;//漫画网址








@end
