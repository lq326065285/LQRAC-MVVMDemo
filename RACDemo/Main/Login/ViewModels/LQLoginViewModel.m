//
//  LQLoginViewController.m
//  RACDemo
//
//  Created by 李强 on 2017/3/17.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQLoginViewModel.h"

NSString * const regular_password = @"^[0-9]{6,}";
NSString * const regular_username = @"^[a-zA-Z0-9]{6,}";

@implementation LQLoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self)
        self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
//            return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//                [subscriber sendNext:input];
//                [subscriber sendCompleted];
//                return nil;
//            }] flattenMap:^RACStream *(id value) /*这里是信号转信号*/{
                @strongify(self)
                return [self loadData:input];
//            }];
        }] ;
    }
    return self;
}

-(RACSignal *)loadData:(NSArray *)arr{
    @weakify(self)
    RACSignal * signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSString * userName = arr.firstObject;
        NSString * passwrod = arr.lastObject;
        @strongify(self)
        if ([self isValidWithContent:userName regular:regular_username] && [self isValidWithContent:passwrod regular:regular_password]) {
#warning 此处可以做一些网络请求
            [subscriber sendNext:@{@"code":@"0",@"msg":@"成功"}];
            [subscriber sendCompleted];
        }else{
            [subscriber sendNext:@{@"code":@"1",@"msg":@"用户名或者密码不正确"}];
            [subscriber sendError:nil];
        }
        return nil;
    }];
    
    return signal;
}

-(BOOL)isValidWithContent:(NSString *)content regular:(NSString *)regular{
    NSPredicate * p = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular];
    NSLog(@"%d",[p evaluateWithObject:content]);
    return [p evaluateWithObject:content];
}

@end
