//
//  LQTableViewCell.h
//  RACDemo
//
//  Created by 李强 on 2017/4/10.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQTableViewCellViewModel.h"
#import "LQTableViewController.h"
@interface LQTableViewCell : UITableViewCell

@property (nonatomic,strong) LQTableViewCellViewModel * model;

@property (nonatomic,weak) LQTableViewController * viewController;

@end
