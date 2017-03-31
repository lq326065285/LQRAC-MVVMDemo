//
//  LQMineViewController.m
//  RACDemo
//
//  Created by 李强 on 2017/3/17.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQMineViewController.h"
#import "LQDeliveryAddressVC.h"
#import "LQMineViewModel.h"
#import "LQMineHeaderCell.h"
#import "LQMineCell.h"
#import "LQEditUserInfoVC.h"

NSString * const mine_cell_name = @"mine_cell_name";
NSString * const mine_header_cell_name = @"mine_header_cell_name";

@interface LQMineViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,strong) LQMineViewModel * viewModel;

@property (nonatomic,strong) RACSignal * tstSignal;

@end



@implementation LQMineViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavItem];
    [self.view addSubview:[[UIView alloc]init]];
    [self.view addSubview:self.tableView];
    
    __block int a = 0;
    self.tstSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        a++;
        [subscriber sendNext:@(a)];
        [subscriber sendCompleted];
        NSLog(@"dddd");
        return nil;
    }];

    
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.tableView setFrame:CGRectMake(0, 64, self.view.width, self.view.height)];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.arrData.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * a = self.viewModel.arrData[section];
    return a.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        LQMineHeaderCell * cell = [tableView dequeueReusableCellWithIdentifier:mine_header_cell_name];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.isLogin = YES;
        [cell setModel:self.viewModel.userInfoModel];
        [cell.loginSignal subscribeNext:^(id x) {
            NSLog(@"点击登录");
        }];
        
        @weakify(self)
        [cell.gestureSignal subscribeNext:^(id x) {
            NSLog(@"点击图片");
            @strongify(self)
            LQEditUserInfoVC * userInfoVC = [[LQEditUserInfoVC alloc] init];
            [userInfoVC setUserInfoModel:self.viewModel.userInfoModel];
            [self.navigationController pushViewController:userInfoVC animated:YES];
        }];
        return cell;
    }else{
        LQMineCell * cell = [tableView dequeueReusableCellWithIdentifier:mine_cell_name];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray * arr = self.viewModel.arrData[indexPath.section];
        cell.labName.text = arr[indexPath.row];
        return cell;
    }
    return nil;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return .0001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

#pragma mark - event response

-(void)tapRightItem{
//    LQDeliveryAddressVC * deliveryAddressVC = [[LQDeliveryAddressVC alloc] init];
//    [self.navigationController pushViewController:deliveryAddressVC animated:YES];
//    [self.tstSignal subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//    [self.tstSignal subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
}

#pragma mark - private methods

-(void)setupNavItem{
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithTitle:@"收货地址" style:UIBarButtonItemStylePlain target:self action:@selector(tapRightItem)];
    self.navigationItem.rightBarButtonItem = leftItem;
}

#pragma mark - getter setter

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        [_tableView registerClass:[LQMineCell class] forCellReuseIdentifier:mine_cell_name];
        [_tableView registerNib:[UINib nibWithNibName:@"LQMineCell" bundle:nil] forCellReuseIdentifier:mine_cell_name];
        [_tableView registerClass:[LQMineHeaderCell class] forCellReuseIdentifier:mine_header_cell_name];
    }
    return _tableView;
}

-(LQMineViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[LQMineViewModel alloc] init];
    }
    return _viewModel;
}

@end
