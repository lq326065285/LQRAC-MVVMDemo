//
//  LQEditUserInfoViewModel.m
//  RACDemo
//
//  Created by 李强 on 2017/3/22.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQEditUserInfoViewModel.h"

@implementation LQEditUserInfoViewModel


#pragma mark - getter setter

-(NSMutableArray *)arrData{
    if (!_arrData) {
        _arrData = [[NSMutableArray alloc] init];
    }
    return _arrData;
}

-(void)setUserInfoModel:(LQUserInfoModel *)userInfoModel{
    [self.arrData addObject:userInfoModel.name];
}

@end
