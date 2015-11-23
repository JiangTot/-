//
//  LookCell.h
//  爱上漫画
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 姜涛. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LookModel;

@protocol ActionDelegate <NSObject>

-(void)authorInfo:(UIButton *)button;
- (void)productionInfo:(UIButton *)button;
- (void)shareAction;
- (void)commentAction;


@end

@interface LookCell : UITableViewCell
@property (nonatomic, retain)LookModel * lookModel;

@property (nonatomic, retain)id<ActionDelegate>delagate;

@end
