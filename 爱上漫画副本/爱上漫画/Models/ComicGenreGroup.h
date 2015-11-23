//
//  ComicGenreGroup.h
//  Cartoon
//
//  Created by lanou3g on 15/10/26.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComicGenreGroup : NSObject

@property (nonatomic, copy) NSString *action;//
@property (nonatomic, copy) NSString *title;//分组名
//@property (nonatomic, strong) NSMutableArray *topics;//主题
@property (nonatomic, strong) NSMutableArray *comics;
@property (nonatomic, copy) NSNumber *type;//类型
@property (nonatomic, strong) NSMutableArray *topicsArray;

@end
