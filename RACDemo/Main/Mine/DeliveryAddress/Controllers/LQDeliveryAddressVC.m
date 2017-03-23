//
//  LQDeliveryAddressVC.m
//  RACDemo
//
//  Created by 李强 on 2017/3/20.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQDeliveryAddressVC.h"
#import "LQDeliveryAddressCell.h"
#import "LQDeliveryAddressViewModel.h"
#import "LQDeliveryAddressCellViewModel.h"

@interface LQDeliveryAddressVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) LQDeliveryAddressViewModel * viewModel;
@end

NSString * cellName = @"DeliveryAddressCell";

@implementation LQDeliveryAddressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

#pragma mark - response action

-(void)cellActionWithSender:(NSDictionary *)dict{
    NSInteger tag = [dict[@"tag"] integerValue];
    NSIndexPath * indexPath = dict[@"indexPath"];
    NSString *  addressId = dict[@"addressId"];
    @weakify(self)
  ;
    switch (tag) {
        case 101:
        {
            [[self.viewModel.setDefaultCommand execute:addressId] subscribeNext:^(id x) {
                @strongify(self)
                [self.tableView reloadRowsAtIndexPaths:[self.viewModel getIndexPathWithAddressId] withRowAnimation:UITableViewRowAnimationFade];
               
            }];
        }
            break;
        case 102:
        {
            
        }
            break;
            
        default:{
            
            [[self.viewModel.deleteCommand execute:@(indexPath.section)] subscribeNext:^(id x) {
                [self.tableView reloadData];
            }];
        }
            break;
    }
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.arrData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LQDeliveryAddressCellViewModel * vm = self.viewModel.arrData[indexPath.section];
    vm.indexPath = indexPath;
    vm.currentAddressId = self.viewModel.currentAddressId;
    @weakify(self)
    LQDeliveryAddressCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    [cell setModel:vm];
    [vm.cellSubject subscribeNext:^(NSDictionary * dict) {
        @strongify(self)
        [self cellActionWithSender:dict];
    }];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .0001;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LQDeliveryAddressCellViewModel * vm = self.viewModel.arrData[indexPath.section];
    if (vm.cellHeight != 0) {
        return vm.cellHeight;
    }
    LQDeliveryAddressCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    return [cell getCellHeightWithModel:vm];
}

#pragma mark - geter setter

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[LQDeliveryAddressCell class] forCellReuseIdentifier:cellName];
    }
    return _tableView;
}

-(LQDeliveryAddressViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[LQDeliveryAddressViewModel alloc] init];
        [_viewModel.requestErrorSignal subscribeNext:^(NSString * msg) {
            [LQGlobalService showAlertViewWithTitle:@"" msg:msg target:self arrBtn:nil delegate:nil];
        }];
    }
    return _viewModel;
}

@end
