//
//  Topic.m
//  Cartoon
//
//  Created by lanou3g on 15/10/23.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import "Topic.h"

@implementation Topic

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _subject_id = value;
    }
    if ([key isEqualToString:@"description"]) {
        _subject_description = value;
    }
    
}

@end
