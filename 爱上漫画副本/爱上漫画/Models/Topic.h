//
//  Topic.h
//  Cartoon
//
//  Created by lanou3g on 15/10/23.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Topic : NSObject

#pragma mark --------  Topic
@property (nonatomic, strong) NSNumber *comics_count;//已发表漫画数
@property (nonatomic, copy) NSString *cover_image_url;//专题封面列表
@property (nonatomic, strong) NSNumber *created_at;//作品发表时间
@property (nonatomic, copy) NSString *subject_description;//描述
@property (nonatomic, strong) NSNumber *subject_id;//专题id(需要处理)
@property (nonatomic, strong) NSDictionary *user;//作者信息
@property (nonatomic, strong) NSNumber *order;//...
@property (nonatomic, copy) NSString *title;//专题作品名
@property (nonatomic, strong) NSNumber *updated_at;//专题刷新时间(需要处理)
@property (nonatomic, copy) NSString *vertical_image_url;//竖型图片

@end
