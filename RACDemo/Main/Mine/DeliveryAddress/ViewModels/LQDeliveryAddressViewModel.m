//
//  LQDeliveryAddressViewModel.m
//  RACDemo
//
//  Created by 李强 on 2017/3/20.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQDeliveryAddressViewModel.h"
#import "LQDeliveryAddressCellViewModel.h"

@interface LQDeliveryAddressViewModel ()


@end

@implementation LQDeliveryAddressViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupData];
    }
    return self;
}

-(void)setupData{
    for (int i = 0; i < 10; i++) {
        LQDeliveryAddressCellViewModel * vm = [[LQDeliveryAddressCellViewModel alloc] init];
        vm.title = @"张全蛋";
        vm.phone = [NSString stringWithFormat:@"1882007830%d",i];
        vm.content = @"广东省深圳市宝安区龙华开发区光谷二路特一号富士康科技集团104车间";
        vm.addressId = [NSString stringWithFormat:@"%d",i];
        [self.arrData addObject:vm];
    }
}

-(NSArray<NSIndexPath *> *)getIndexPathWithAddressId{
    
    NSMutableArray * arr = [NSMutableArray array];
    for (int i = 0; i < self.arrData.count; i++) {
        LQDeliveryAddressCellViewModel * vm = self.arrData[i];
        if ([vm.addressId isEqualToString:self.currentAddressId]) {
            [arr addObject:[NSIndexPath indexPathForRow:0 inSection:i]];
        }
        if ([vm.addressId isEqualToString:self.oldAddressId]) {
            [arr addObject:[NSIndexPath indexPathForRow:0 inSection:i]];
        }
    }
    return arr;
}

#pragma mark - getter setter

-(NSMutableArray *)arrData{
    if (!_arrData) {
        _arrData = [[NSMutableArray alloc] init];
    }
    return _arrData;
}

-(RACCommand *)setDefaultCommand{
    if (!_setDefaultCommand) {
        @weakify(self)
        _setDefaultCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSString * addressId) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                @strongify(self)
                if ([addressId isEqualToString:@""] || [addressId isKindOfClass:[NSNull class]] || addressId == nil) {
                    [subscriber sendError:nil];
                }else{
                    self.oldAddressId = self.currentAddressId;
                    self.currentAddressId = addressId;
                    [subscriber sendNext:@"呵呵哈哈哈"];
                    [subscriber sendCompleted];
                }
                return nil;
            }];
        }];
    }
    return _setDefaultCommand;
}

-(RACCommand *)deleteCommand{
    if (!_deleteCommand) {
        @weakify(self)
        _deleteCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSNumber * index) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                if (index.integerValue < self.arrData.count) {
                    @strongify(self)
                    [self.arrData removeObjectAtIndex:index.integerValue];
                    [subscriber sendNext:nil];
                    [subscriber sendCompleted];
                }else{
                    NSError * e = [[NSError alloc] initWithDomain:NSLocalizedDescriptionKey code:0 userInfo:@{@"msg":@"删除出错"}];
                    [subscriber sendError:e];
                }
                return nil;
            }];
        }];
    }
    return _deleteCommand;
}

-(RACSignal *)requestErrorSignal{
    if (!_requestErrorSignal) {
        _requestErrorSignal = [[RACSignal merge:@[self.deleteCommand.errors,self.setDefaultCommand.errors]] map:^id(NSError * value) {
            if (value != nil) {
                return value.userInfo[@"msg"];
            }
            return @"请求失败";
        }];
    }
    return _requestErrorSignal;
}
//
//-(RACCommand *)getIndexPathCommand{
//    if (!_getIndexPathCommand) {
//        @weakify(self)
//        _getIndexPathCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSArray * input) {
//            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//                @strongify(self)
//                __block NSInteger index = 0;
//                __block NSInteger currentIndex = 0;
//                [[self.arrData.rac_sequence.signal map:^id(LQDeliveryAddressCellViewModel * value) {
//                    index++;
//                    return value.addressId;
//                }] subscribeNext:^(id x) {
//                  
//                }];
//                [subscriber sendNext:[NSIndexPath indexPathForRow:0 inSection:index]];
//                [subscriber sendCompleted];
//                return nil;
//            }];
//        }];
//    }
//    return _getIndexPathCommand;
//}

@end
