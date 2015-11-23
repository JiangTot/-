//
//  Comics.h
//  Cartoon
//
//  Created by lanou3g on 15/10/28.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comics : NSObject

//"cover_image_url": "http://i.kuaikanmanhua.com/image/151016/ezwbquflx.jpg-w640",
//"created_at": 1444990104,
//"id": 6275,
//"title": "9月作品排行榜",
//"topic": {},
//"updated_at": 1444990034,
//"url": "http://www.kuaikanmanhua.com/comics/6275"

@property (nonatomic, copy) NSString *cover_image_url;//封面图
@property (nonatomic, strong) NSNumber *created_at;//创作时间
@property (nonatomic, strong) NSNumber *comic_id;
@property (nonatomic, copy) NSString *title;//标题
@property (nonatomic, strong) NSNumber *updated_at;//刷新时间
@property (nonatomic, copy) NSString *url;//网址







@end
