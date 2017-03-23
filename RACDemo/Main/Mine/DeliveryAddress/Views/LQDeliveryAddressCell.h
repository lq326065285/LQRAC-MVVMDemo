//
//  LQDeliveryAddressCell.h
//  RACDemo
//
//  Created by 李强 on 2017/3/20.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LQDeliveryAddressCell : UITableViewCell
-(void)setModel:(id)model;
-(CGFloat)getCellHeightWithModel:(id)model;
@property (nonatomic,strong) void(^clickBtnBlock)(NSInteger tag,NSIndexPath * mIndexPath);

@property (nonatomic, strong) RACSignal *signal;
@end
