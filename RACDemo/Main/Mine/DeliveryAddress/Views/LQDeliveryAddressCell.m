//
//  LQDeliveryAddressCell.m
//  RACDemo
//
//  Created by 李强 on 2017/3/20.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQDeliveryAddressCell.h"

#import "LQDeliveryAddressCellViewModel.h"

@interface LQDeliveryAddressCell ()

@property (nonatomic,strong) UIView * backView;

@property (nonatomic,strong) UILabel * labTitle;

@property (nonatomic,strong) UILabel * labPhoneNum;

@property (nonatomic,strong) UILabel * labAddress;

@property (nonatomic,strong) LQDeliveryAddressCellViewModel * viewModel;

@end

@implementation LQDeliveryAddressCell

-(void)setupUI{
    _backView = [[UIView alloc] init];
    [self addSubview:_backView];
    
    _labTitle = [self createLabelWithText:@"张全蛋" textColor:[UIColor blackColor] font:16 superView:_backView];
    [_backView addSubview:_labTitle];
    
    _labPhoneNum = [self createLabelWithText:@"18820078304" textColor:[UIColor blackColor] font:16 superView:_backView];
    _labPhoneNum.textAlignment = NSTextAlignmentRight;
    [_backView addSubview:_labPhoneNum];
    
    _labAddress = [self createLabelWithText:@"广东省深圳市宝安区龙华开发区光谷二路特一号富士康科技集团104车间" textColor:[UIColor blackColor] font:14 superView:_backView];
    _labAddress.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    
    [_backView addSubview:_labAddress];
    
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = [UIColor blackColor];
    [_backView addSubview:line];
    [line mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.top.equalTo(_labAddress.mas_bottom).offset(10);
        make.height.mas_equalTo(.5);
    }];
    
    //默认
    [self createBtnWithImage:[UIImage imageNamed:@"address_cell_Default"] title:@"设为默认" superView:_backView tag:101 btnWidth:120];
    
    //编辑
    [self createBtnWithImage:[UIImage imageNamed:@"address_cell_edit"] title:@"编辑" superView:_backView tag:102 btnWidth:120];
    
    //删除
    [self createBtnWithImage:[UIImage imageNamed:@"address_cell_delete"] title:@"删除" superView:_backView tag:103 btnWidth:120];
    
}


-(void)setButtonWithTag:(UIButton *)sender{
    switch (sender.tag) {
        case 101:
        {
            if (!sender.selected) {
                [sender setImage:[UIImage imageNamed:@"address_cell_select"] forState:UIControlStateNormal];
            }else{
                [sender setImage:[UIImage imageNamed:@"address_cell_Default"] forState:UIControlStateNormal];
            }
            sender.selected = !sender.selected;
        }
            break;
        default:
            break;
    }
    
    [self.viewModel.cellSubject sendNext:@{@"tag":@(sender.tag),@"indexPath":self.viewModel.indexPath,@"addressId":self.viewModel.addressId ?: @""}];
}

-(UIButton *)createBtnWithImage:(UIImage *)image title:(NSString *)title superView:(UIView *)superView tag:(NSInteger)tag btnWidth:(CGFloat)btnWidth{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [superView addSubview:button];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    if(tag != 101){
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    }else{
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    }
    
    button.tag = tag;
    @weakify(self)
   [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
       @strongify(self)
       [self setButtonWithTag:x];
   }];
    return button;
}

-(UILabel *)createLabelWithText:(NSString *)text textColor:(UIColor *)color font:(CGFloat)font superView:(UIView *)superView{
    UILabel * label = [[UILabel alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    label.numberOfLines = 0;
    return label;
}

-(void)setModel:(id)model{
    self.viewModel = model;
    if (!_backView) {
        [self setupUI];
    }
    
    _labTitle.text = self.viewModel.title;
    _labPhoneNum.text = self.viewModel.phone;
    _labAddress.text = self.viewModel.content;
    
    __weak typeof(&*self)me = self;
    [_labTitle mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(10);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(120);
    }];
    
    [_labPhoneNum mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(120);
    }];
    
    [_labAddress mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.equalTo(me.labTitle.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
    }];
    
    UIButton * button1 = [_backView viewWithTag:101];
    UIButton * button2 = [_backView viewWithTag:102];
    UIButton * button3 = [_backView viewWithTag:103];
    
    if ([self.viewModel.addressId isEqualToString:self.viewModel.currentAddressId]) {
        //每次点击才会生效  这里直接调用click方法为了先取反为了保证button的状态是对的
        [button1 setImage:[UIImage imageNamed:@"address_cell_select"] forState:UIControlStateNormal];
        [button1 setTitle:@"默认" forState:UIControlStateNormal];
    }else{
        button1.selected = YES;
        [button1 setTitle:@"设为默认" forState:UIControlStateNormal];
        [button1 setImage:[UIImage imageNamed:@"address_cell_Default"] forState:UIControlStateNormal];
    }
    
    [button1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.equalTo(_labAddress.mas_bottom).offset(15);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(30);
    }];
    
    [button2 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(button3.mas_left).offset(-5);
        make.top.equalTo(_labAddress.mas_bottom).offset(15);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    [button3 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.top.equalTo(_labAddress.mas_bottom).offset(15);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
        make.bottom.equalTo(_backView.mas_bottom).offset(-5);
    }];
    
    [_backView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width);
    }];
    
    [_backView layoutIfNeeded];
    [self layoutIfNeeded];
}

-(CGFloat)getCellHeightWithModel:(id)model{
    [self setModel:model];
    self.viewModel.cellHeight = self.backView.frame.size.height;
    return self.backView.frame.size.height;
}

@end
