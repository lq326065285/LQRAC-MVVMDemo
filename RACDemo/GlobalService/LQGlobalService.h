//
//  LQGlobalService.h
//  RACDemo
//
//  Created by 李强 on 2017/3/20.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQGlobalService : NSObject

+(void)showAlertViewWithTitle:(NSString *)title msg:(NSString *)msg target:(UIViewController *)viewController arrBtn:(NSArray *)btn delegate:(id)delegate;
@end
