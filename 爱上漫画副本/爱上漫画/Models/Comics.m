//
//  Comics.m
//  Cartoon
//
//  Created by lanou3g on 15/10/28.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import "Comics.h"

@implementation Comics

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _comic_id = value;
    }
}

@end
