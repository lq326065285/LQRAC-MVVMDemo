//
//  LQTableViewDelegate.h
//  RACDemo
//
//  Created by 李强 on 2017/4/10.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LQTableViewDelegate <NSObject>
-(CGFloat)lq_tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

-(CGFloat)lq_tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;

-(UIView *)lq_tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;

-(UIView *)lq_tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;

@end
