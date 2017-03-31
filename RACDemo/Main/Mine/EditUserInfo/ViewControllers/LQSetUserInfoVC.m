//
//  LQSetUserInfoVC.m
//  RACDemo
//
//  Created by 李强 on 2017/3/23.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQSetUserInfoVC.h"

//NSString * const regular_username = @"^[0-9a-zA-Z]{6,}$";
#define regular_username @"^[0-9a-zA-Z]{6,}$"

@interface LQSetUserInfoVC ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *btnSure;
@end

@implementation LQSetUserInfoVC
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    RAC(self.textField,text) = RACObserve(self, content);
    self.btnSure.rac_command = self.sureCommand;
    
    [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(150).priority(1000);
    }];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.testButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0).priority(500);
    }];
}

-(RACSignal *)loadData{
    @weakify(self)
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        if ([self adjustContentisValid]) {
            [subscriber sendNext:self.textField.text];
            [subscriber sendCompleted];
        }else{
            [LQGlobalService showAlertViewWithTitle:@"提示" msg:@"用户名格式不正确" target:self arrBtn:nil delegate:nil];
            [subscriber sendError:nil];
        }
        return nil;
    }] flattenMap:^RACStream *(NSString* value) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self)
            if ([value isEqualToString:@""] || value == nil) {
                [subscriber sendError:nil];
                [LQGlobalService showAlertViewWithTitle:@"提示" msg:@"提交失败" target:self arrBtn:nil delegate:nil];
            }else{
                [self.navigationController popViewControllerAnimated:YES];
                [subscriber sendNext:self.textField.text];
                [subscriber sendCompleted];
            }
            return nil;
        }];
    }];
}

-(BOOL)adjustContentisValid{
    NSPredicate * p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular_username];
    return [p evaluateWithObject:self.textField.text];
}

-(RACCommand *)sureCommand{
    if (!_sureCommand) {
        @weakify(self)
        _sureCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self)
            return [self loadData];
        }];
    }
    return _sureCommand;
}



@end
