//
//  GuanzhuTopic.h
//  Cartoon
//
//  Created by lanou3g on 15/10/28.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuanzhuTopic : NSObject

@property (nonatomic, strong) NSNumber *topic_id;
@property (nonatomic, copy) NSString *cover_image_url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *comics;

@end
