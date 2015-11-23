//
//  DetailManager.h
//  爱上漫画
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^comeBack)();

typedef void (^ReloadBlock)();
@interface DetailManager : NSObject

+(instancetype)sharedManager;
-(void)requestData:(NSString *)urlStr;

@property (nonatomic, retain) NSArray * dataArray;

@property (nonatomic, copy) ReloadBlock reloadBlock;

-(void)loadSearcResulthWithID:(NSString *)ID completion:(comeBack)completion;

@end
