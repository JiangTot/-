//
//  Author.h
//  Cartoon
//
//  Created by lanou3g on 15/10/23.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Author : NSObject


#pragma mark ---------  User
@property (nonatomic, copy) NSString *avatar_url;//作者头像
@property (nonatomic, strong) NSNumber *author_id;//作者信息id(需要处理)
@property (nonatomic, copy) NSString *nickname;//笔名
@property (nonatomic, copy) NSString *reg_type;//作者类型



@end
