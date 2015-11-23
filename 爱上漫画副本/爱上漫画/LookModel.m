//
//  LookModel.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "LookModel.h"

@implementation LookModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}







@end
