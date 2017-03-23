//
//  LQMineHeaderCell.h
//  RACDemo
//
//  Created by 李强 on 2017/3/22.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQUserInfoModel.h"
@interface LQMineHeaderCell : UITableViewCell

@property (nonatomic,assign)BOOL isLogin;

@property (nonatomic,strong) RACCommand * loginCommand;

@property (nonatomic,strong) RACSignal * loginSignal;

@property (nonatomic,strong) RACSignal * gestureSignal;

-(void)setModel:(LQUserInfoModel *)model;
@end
