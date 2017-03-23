//
//  LQDeliveryAddressCellViewModel.m
//  RACDemo
//
//  Created by 李强 on 2017/3/20.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQDeliveryAddressCellViewModel.h"

@implementation LQDeliveryAddressCellViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.cellCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
//            
//            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//                [subscriber sendNext:input];
//                [subscriber sendCompleted];
//                return nil;
//            }];
//        }];
//        
//        RACSignal *signal = [self.cellCommand.executionSignals flattenMap:^RACStream *(RACSignal *value) {
//            return [[value materialize] filter:^BOOL(RACEvent *even) {
//                return even.eventType == RACEventTypeCompleted;
//            }];
//        }];
//        
//        self.signal = [RACSignal merge:@[signal]];
//        
//        [self.signal subscribeNext:^(id x) {
//            NSLog(@"VM : %@",x);
//        }];
       
        
        self.cellSubject = [RACSubject subject];
    }
    return self;
}

@end
