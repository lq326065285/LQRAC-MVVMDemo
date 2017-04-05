//
//  LQEditUserInfoVC.m
//  RACDemo
//
//  Created by 李强 on 2017/3/22.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQEditUserInfoVC.h"
#import "LQEditUserInfoViewModel.h"
#import "LQMineCell.h"
#import "LQSetUserInfoVC.h"
@interface LQEditUserInfoVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) LQEditUserInfoViewModel * viewModel;
@end

@implementation LQEditUserInfoVC

#pragma mark - life cycle

NSString * const Edit_UserInfo_Cell = @"Edit_UserInfo_Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:[[UIView alloc]init]];
    [self.view addSubview:self.tableView];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.tableView setFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
}

#pragma mark - publick methods

-(void)setUserInfoModel:(LQUserInfoModel *)model{
    self.viewModel.userInfoModel = model;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.arrData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LQMineCell * cell = [tableView dequeueReusableCellWithIdentifier:Edit_UserInfo_Cell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labName.text = [NSString stringWithFormat:@"name:%@",self.viewModel.arrData[indexPath.row]];
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .0001;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LQSetUserInfoVC * setUserInfoVC = [[LQSetUserInfoVC alloc] init];
    [setUserInfoVC setContent:self.viewModel.arrData[indexPath.row]];
    
//    //flatten (合并)
//    [setUserInfoVC.sureCommand.executionSignals.flatten subscribeNext:^(NSString * content) {
//        NSLog(@"%@",content);
//    }];
    
    [[setUserInfoVC.sureCommand.executionSignals flattenMap:^RACStream *(RACSignal *subscribeSignal) {
        //[subscribeSignal materialize] 将返回值的类型转换为RACEvent
        //takeUntilBlock直到return YES才停止操作，并向下传递x(RACEvent)的值
        return [[[subscribeSignal materialize] takeUntilBlock:^BOOL(RACEvent * x) {
            //判断条件
            return x.eventType == RACEventTypeCompleted;
        }] map:^id(RACEvent * event) {
            return event.value;
        }];
    }] subscribeNext:^(NSString * content) {
        NSLog(@"%@",content);
        [self.viewModel.arrData replaceObjectAtIndex:0 withObject:content];
        [self.tableView reloadData];
    }];
    
    [self.navigationController pushViewController:setUserInfoVC animated:YES];
}

#pragma mark - event response



#pragma mark - private methods


#pragma mark - getter setter

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //        [_tableView registerClass:[LQMineCell class] forCellReuseIdentifier:mine_cell_name];
        [_tableView registerNib:[UINib nibWithNibName:@"LQMineCell" bundle:nil] forCellReuseIdentifier:Edit_UserInfo_Cell];
    }
    return _tableView;
}

-(LQEditUserInfoViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[LQEditUserInfoViewModel alloc] init];
    }
    return _viewModel;
}


@end
