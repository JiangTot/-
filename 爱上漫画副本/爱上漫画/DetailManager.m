//
//  DetailManager.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "DetailManager.h"
#import "AFNetworking.h"
@interface DetailManager()
@property(nonatomic,retain)NSMutableArray *allDataArray;
@end

@implementation DetailManager

+(instancetype)sharedManager{
    static DetailManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [DetailManager new];
            
    });
    return manager;
}

-(void)loadSearcResulthWithID:(NSString *)ID completion:(comeBack)completion{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *set = [NSString stringWithFormat:@"http://api.kuaikanmanhua.com/v1/comics/%@",ID];
    [manager GET:set parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:responseObject];
        NSDictionary *dic1 = dic[@"data"];
        self.allDataArray = dic1[@"images"];
        
        NSLog(@"------------------%@",self.allDataArray);
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.reloadBlock();
        });

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
    }];

  
    
    
}
-(NSArray *)dataArray{
    return [self.allDataArray copy];
}

-(NSMutableArray *)allDataArray{
    if (!_allDataArray) {
        self.allDataArray = [NSMutableArray new];
    }
    return _allDataArray;
}




@end
