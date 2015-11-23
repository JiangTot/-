//
//  collectionViewDetailModel.h
//  爱上漫画
//
//  Created by lanou3g on 15/11/23.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface collectionViewDetailModel : NSObject
@property(nonatomic,strong )NSString *title;
@property(nonatomic,assign )NSInteger updated_at;
@property(nonatomic,strong )NSString *cover_image_url;
@property (nonatomic, retain)NSString * url;


@end
