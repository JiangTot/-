//
//  DataManager.m
//  爱上漫画
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import "DataManager.h"
#import "LookModel.h"
#import "Topic.h"
#import "Author.h"

@interface DataManager ()
// 作品信息
@property(nonatomic,strong)NSMutableArray *allDataArray;
// 主题
@property(nonatomic,strong)NSMutableArray *topicDataArray;
// 作者信息
@property(nonatomic,strong)NSMutableArray *authorDataArray;


@end
@implementation DataManager

+(instancetype)sharedManager{
    static DataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [DataManager new];
        [manager requestData:kMainUrl];

    });
    return manager;
}

-(void)requestData:(NSString *)urlStr{
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlStr]];
    
    NSURLSessionTask *test = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dic = dict[@"data"];
        NSArray *array = dic[@"comics"];
        for (NSDictionary *di in array) {
            // 解析作品信息
            LookModel *lookModel = [LookModel new];
            [lookModel setValuesForKeysWithDictionary:di];
            [self.allDataArray addObject:lookModel];
     //       NSLog(@"--------%@",self.allDataArray);
            
            // 解析主题
            NSDictionary *topicDict = lookModel.topic;
            Topic *topic = [Topic new];
            [topic setValuesForKeysWithDictionary:topicDict];
            [self.topicDataArray addObject:topic];
            
            // 解析作者信息
            NSDictionary *userDic = topic.user;
            Author * author = [Author new];
            [author setValuesForKeysWithDictionary:userDic];
            [self.authorDataArray addObject:author];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.reloadBlock();
        });
        
    }];
    [test resume];
    
    
    
    
    
}


- (NSArray *)dataArray{
    
    return [_allDataArray copy];
}
-(NSArray *)topicArray{
    return [_topicDataArray copy];
}
-(NSMutableArray *)authorArray{
    return [_authorDataArray copy];
}

// 懒加载

-(NSMutableArray *)allDataArray{
    if (!_allDataArray) {
        self.allDataArray = [NSMutableArray new];
    }
    return _allDataArray;
    
}

-(NSMutableArray *)topicDataArray{
    if (!_topicDataArray) {
        self.topicDataArray = [NSMutableArray new];
    }
    return _topicDataArray;
}
-(NSMutableArray *)authorDataArray{
    if (!_authorDataArray) {
        self.authorDataArray = [NSMutableArray new];
    }
    return _authorDataArray;
}


























@end
