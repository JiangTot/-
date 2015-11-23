//
//  CollectionModel.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "CollectionModel.h"

@implementation CollectionModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"topics"]) {
        _topics = value;
    }
    
}
@end
