//
//  topicMomic.m
//  Cartoon
//
//  Created by lanou3g on 15/10/27.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import "topicMomic.h"

@implementation topicMomic

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _list_id = value;
    }
}

@end
