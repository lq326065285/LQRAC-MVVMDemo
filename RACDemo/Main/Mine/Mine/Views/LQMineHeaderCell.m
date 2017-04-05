//
//  LQMineHeaderCell.m
//  RACDemo
//
//  Created by 李强 on 2017/3/22.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQMineHeaderCell.h"

@interface LQMineHeaderCell ()

@property (nonatomic,strong) UIImageView * imgView;

@property (nonatomic,strong) UILabel * labNickName;

@property (nonatomic,strong) UIButton * btnLogin;

@end


@implementation LQMineHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - response event 

-(void)clickLogin:(UIButton *)sender{
    [self.loginCommand execute:sender];
}


#pragma mark - publick Method

-(void)setModel:(LQUserInfoModel *)model{
    RAC(self.labNickName,text) = RACObserve(model, name);
    __weak typeof(&*self)weakSelf = self;
    if (_isLogin) {
        [self addSubview:self.labNickName];
        [self addSubview:self.imgView];
        
        [self.labNickName mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.imgView.mas_bottom).offset(10);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(21);
            make.centerX.equalTo(weakSelf.mas_centerX);
        }];
        
        [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(50);
            make.width.height.mas_equalTo(100);
            make.centerX.equalTo(weakSelf.mas_centerX);
        }];
    }else{
        [self addSubview:self.btnLogin];
        [self.btnLogin mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.mas_centerX);
            make.centerY.equalTo(weakSelf.mas_centerY);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(40);
        }];
    }
}

#pragma mark - getter setter

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.layer.cornerRadius = 50;
        _imgView.layer.masksToBounds = YES;
        _imgView.layer.borderColor = [UIColor grayColor].CGColor;
        _imgView.layer.borderWidth = 2;
        _imgView.userInteractionEnabled = YES;
        _imgView.restorationIdentifier = @"theImage";
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] init];
        self.gestureSignal = [tap rac_gestureSignal];
        [_imgView addGestureRecognizer:tap];
    }
    return _imgView;
}

-(UILabel *)labNickName{
    if (!_labNickName) {
        _labNickName = [UILabel lq_labelWithFrame:CGRectZero title:@"the name is null" font:16 textColor:[UIColor  blackColor] textAlignment:NSTextAlignmentCenter];
    }
    return _labNickName;
}

-(UIButton *)btnLogin{
    if (!_btnLogin) {
//        _btnLogin = [UIButton lq_buttonWithFrame:CGRectZero buttonType:UIButtonTypeCustom title:@"登 录" target:self selector:@selector(clickLogin:) textColor:[UIColor whiteColor] font:16];
        _btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnLogin setTitle:@"登 录" forState:UIControlStateNormal];
        _btnLogin.titleLabel.font = [UIFont systemFontOfSize:16];
        self.loginSignal = [_btnLogin rac_signalForControlEvents:UIControlEventTouchUpInside];
        _btnLogin.backgroundColor = [UIColor blueColor];
    }
    return _btnLogin;
}

-(RACCommand *)loginCommand{
    if (!_loginCommand) {
        _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
           return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
               [subscriber sendNext:input];
               [subscriber sendCompleted];
               return nil;
           }];
        }];
    }
    return _loginCommand;
}

@end
