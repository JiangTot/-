//
//  topicMomic.h
//  Cartoon
//
//  Created by lanou3g on 15/10/27.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface topicMomic : NSObject

//"cover_image_url": "http://i.kuaikanmanhua.com/image/151026/wch5wk4ts.jpg-w640",
//"created_at": 1445896803,
//"id": 6355,
//"likes_count": 28050,
//"title": "第25话 穿我内裤吧~",
//"topic_id": 288,
//"updated_at": 1445246498,
//"url": "http://www.kuaikanmanhua.com/comics/6355"

@property (nonatomic, copy) NSString *cover_image_url;
@property (nonatomic, strong) NSNumber *created_at;
@property (nonatomic, strong) NSNumber *list_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *topic_id;
@property (nonatomic, strong) NSNumber *updated_at;
@property (nonatomic, copy) NSString *url;






@end
