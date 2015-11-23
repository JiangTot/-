//
//  DetailController.h
//  爱上漫画
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "datail.h"

@interface DetailController : UITableViewController

@property (nonatomic, strong) NSString *datailID;
@property(nonatomic,retain )datail *datail;



@end
