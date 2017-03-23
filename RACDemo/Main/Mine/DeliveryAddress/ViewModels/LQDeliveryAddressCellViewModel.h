//
//  LQDeliveryAddressCellViewModel.h
//  RACDemo
//
//  Created by 李强 on 2017/3/20.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQDeliveryAddressCellViewModel : NSObject

@property (nonatomic,assign)CGFloat cellHeight;

@property (nonatomic,copy) NSString * title;

@property (nonatomic,copy) NSString * content;

@property (nonatomic,copy) NSString * phone;

@property (nonatomic,copy) NSString * addressId;

@property (nonatomic,strong) NSIndexPath * indexPath;

@property (nonatomic,copy) NSString * currentAddressId;

@property (nonatomic,strong) RACCommand * cellCommand;

@property (nonatomic,strong) RACSubject * cellSubject;

@property (nonatomic, strong) RACSignal *signal;
@end
