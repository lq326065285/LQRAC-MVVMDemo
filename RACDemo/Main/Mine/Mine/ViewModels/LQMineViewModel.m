//
//  LQMineViewModel.m
//  RACDemo
//
//  Created by 李强 on 2017/3/22.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQMineViewModel.h"

@implementation LQMineViewModel



#pragma mark - getter setter

-(NSMutableArray *)arrData{
    if (!_arrData) {
        _arrData = [[NSMutableArray alloc] initWithArray:@[@[@""],@[@"我的订单",@"我的金币",@"物流信息"],@[@"清理内存",@"关于我们"]]];
    }
    return _arrData;
}

-(LQUserInfoModel *)userInfoModel{
    if (!_userInfoModel) {
        _userInfoModel = [[LQUserInfoModel alloc] init];
        _userInfoModel.name = @"the name is null";
    }
    return _userInfoModel;
}

@end
