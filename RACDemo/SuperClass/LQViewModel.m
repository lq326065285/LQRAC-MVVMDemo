//
//  LQViewModel.m
//  RACDemo
//
//  Created by 李强 on 2017/4/10.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQViewModel.h"

@implementation LQViewModel

-(NSMutableArray *)arrData{
    if (!_arrData) {
        _arrData = [[NSMutableArray alloc] init];
    }
    return _arrData;
}

@end
