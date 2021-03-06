//
//  LQLoginViewController.m
//  RACDemo
//
//  Created by 李强 on 2017/3/17.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQLoginViewController.h"
#import "LQLoginViewModel.h"
#import "AppDelegate.h"
@interface LQLoginViewController ()
    
@property (weak, nonatomic) IBOutlet UITextField *textFName;
@property (weak, nonatomic) IBOutlet UITextField *textFPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnSure;
@property (nonatomic,strong) LQLoginViewModel * viewModel;
@property (weak, nonatomic) IBOutlet UILabel *labAlert;
@end

@implementation LQLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @weakify(self)
     RACSignal * userNameSignal = [[self.textFName.rac_textSignal map:^id(NSString * value) {
        return @(value.length >= 6);
    }] replayLazily];
    
    RACSignal * passwordSignal = [[self.textFPassword.rac_textSignal map:^id(NSString * value) {
        return  @(value.length >= 6);
    }] replayLazily];
    
    [userNameSignal subscribeNext:^(NSNumber * isSuccess) {
        @strongify(self)
        self.textFName.backgroundColor = isSuccess.boolValue ? [UIColor orangeColor] : [UIColor clearColor];
    }];
    
    [passwordSignal subscribeNext:^(NSNumber * isSuccess) {
        @strongify(self)
        self.textFPassword.backgroundColor = isSuccess.boolValue ? [UIColor orangeColor] : [UIColor clearColor];
    }];
    
    
    
    RACSignal * enabledSinal = [RACSignal combineLatest:@[userNameSignal,passwordSignal] reduce:^(NSNumber * um,NSNumber * pw){
        return @(um.integerValue && pw.integerValue);
    }];
    RAC(self.btnSure,enabled) = enabledSinal;
    
    RAC(self.labAlert,text) = [enabledSinal map:^id(NSNumber * isEnabled) {
        return isEnabled.boolValue ? @"按钮可以点击" : @"按钮不可点击";
    }];
}
- (IBAction)clickLogin:(id)sender {
    [[self.viewModel.loginCommand execute:@[self.textFName.text, self.textFPassword.text]] subscribeNext:^(NSDictionary * data) {
        if ([data[@"code"] integerValue] == 0) {
            AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [delegate setupHomeVC];
        }else{
            [LQGlobalService showAlertViewWithTitle:nil msg:data[@"msg"] target:self arrBtn:nil delegate:nil];
        }
    }];
    
   /*
     //方法1
    RACMulticastConnection *con = [signal multicast:[RACSubject subject]];
    [con connect];
    [con.signal subscribeNext:^(NSNumber * isSuccess) {
        NSLog(@"%@", [NSString stringWithFormat:@"用户名 密码 %@",isSuccess.boolValue ? @"正确" : @"错误"]);
    }];
    */

}

#pragma mark - getter setter

-(LQLoginViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[LQLoginViewModel alloc] init];
        [_viewModel.loginCommand.executing subscribeNext:^(NSNumber * start) {
            if (start.boolValue) {
                NSLog(@"开始登录");
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            }else{
                NSLog(@"登录完成");
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }
        }];
    }
    return _viewModel;
}


@end
