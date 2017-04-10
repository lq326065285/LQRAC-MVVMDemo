//
//  LQTableViewController.h
//  RACDemo
//
//  Created by 李强 on 2017/4/10.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LQTableViewDelegate.h"
@interface LQTableViewController : UIViewController

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,weak)id <LQTableViewDelegate> delegate;

@end
