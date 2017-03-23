//
//  LQDeliveryAddressViewModel.h
//  RACDemo
//
//  Created by 李强 on 2017/3/20.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQDeliveryAddressViewModel : NSObject

@property (nonatomic,strong) NSMutableArray * arrData;

//@property (nonatomic,strong) NSIndexPath * currentIndexPath;
//
//@property (nonatomic,strong) NSIndexPath * oldIndexPath;

@property (nonatomic,copy) NSString * currentAddressId;

@property (nonatomic,copy) NSString * oldAddressId;

@property (nonatomic,strong) RACCommand * deleteCommand;

@property (nonatomic,strong) RACCommand * setDefaultCommand;

@property (nonatomic,strong) RACSignal * requestErrorSignal;

//@property (nonatomic,strong) RACCommand * getIndexPathCommand; 

-(NSArray<NSIndexPath *> *)getIndexPathWithAddressId;

@end
