//
//  Author.m
//  Cartoon
//
//  Created by lanou3g on 15/10/23.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import "Author.h"

@implementation Author



- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _author_id = value;
    }
}



@end
