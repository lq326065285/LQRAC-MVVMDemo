//
//  LQTableViewController.m
//  RACDemo
//
//  Created by 李强 on 2017/4/10.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQTableViewController.h"
#import "LQConfigModel.h"
#import "LQViewModel.h"
#import "LQTableViewCell.h"
@interface LQTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) LQViewModel * viewModel;

@end

@implementation LQTableViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - publick method

-(void)createTableViewWithStyle:(UITableViewStyle)style frame:(CGRect)frame{
    _tableView = [[UITableView alloc] initWithFrame:frame style:style];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(void)reloadData{
    for(LQTableViewCellViewModel * cellModel in self.viewModel.arrData){
        if (cellModel.configModel.classIsOK) {
            [self registerCellWithModel:cellModel];
        }
    }
    [self.tableView reloadData];
}

-(void)registerCellWithModel:(LQTableViewCellViewModel *)cellModel{
    if ([NSString isEmptyOrNull:cellModel.configModel.className]) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    if(cellModel.configModel.isXib){
        [self.tableView registerNib:[UINib nibWithNibName:cellModel.configModel.className bundle:nil] forCellReuseIdentifier:cellModel.configModel.className];
    }else{
        [self.tableView registerClass:[LQTableViewCell class] forCellReuseIdentifier:cellModel.configModel.className];
    }
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * arr = self.viewModel.arrData[section];
    return arr.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.viewModel.arrData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LQTableViewCellViewModel * model = self.viewModel.arrData[indexPath.section][indexPath.row];
    LQTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:model.configModel.className];
    [cell setModel:model];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lq_tableView:heightForFooterInSection:)]) {
        return [self.delegate lq_tableView:tableView heightForFooterInSection:section];
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lq_tableView:heightForFooterInSection:)]) {
        return [self.delegate lq_tableView:tableView heightForFooterInSection:section];
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (self.delegate && [self.delegate respondsToSelector:@selector(lq_tableView:viewForFooterInSection:)]) {
        return [self.delegate lq_tableView:tableView viewForFooterInSection:section];
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([self.delegate respondsToSelector:@selector(lq_tableView:viewForHeaderInSection:)]) {
        return [self.delegate lq_tableView:tableView viewForHeaderInSection:section];
    }
    return nil;
}

#pragma mark - getter setter



@end
