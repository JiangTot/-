//
//  PicModel.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "PicModel.h"

@implementation PicModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"cover_image_url"]) {
        _vertical_image_url = value;
        
    }
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
    
}
@end
