//
//  ComicGenreGroup.m
//  Cartoon
//
//  Created by lanou3g on 15/10/26.
//  Copyright © 2015年 Sir_乔巴. All rights reserved.
//

#import "ComicGenreGroup.h"
#import "Topics.h"

@implementation ComicGenreGroup

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"topics"]) {
        for (NSDictionary *dic in (NSArray *)value) {
            Topics *top = [[Topics alloc] init];
            [top setValuesForKeysWithDictionary:dic];
            [self.topicsArray addObject:top];
        }
    }
}

- (NSMutableArray *)topicsArray
{
    if (!_topicsArray) {
        
        self.topicsArray = [NSMutableArray array];
    }
    return _topicsArray;
}

@end
