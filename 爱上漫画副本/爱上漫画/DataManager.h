//
//  DataManager.h
//  爱上漫画
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import <Foundation/Foundation.h>



typedef void (^ReloadBlock)();
@interface DataManager : NSObject

+(instancetype)sharedManager;

-(void)requestData:(NSString *)urlStr;

// 提供一个外界可以调用数据的数组
@property (nonatomic, retain)NSArray * dataArray;
@property (nonatomic, retain)NSArray * topicArray;
@property (nonatomic, retain)NSArray * authorArray;


@property (nonatomic, copy)ReloadBlock reloadBlock;


@end
