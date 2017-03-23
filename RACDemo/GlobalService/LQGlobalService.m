//
//  LQGlobalService.m
//  RACDemo
//
//  Created by 李强 on 2017/3/20.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQGlobalService.h"

@implementation LQGlobalService

+(void)showAlertViewWithTitle:(NSString *)title msg:(NSString *)msg target:(UIViewController *)viewController arrBtn:(NSArray *)btn delegate:(id)delegate{
    if (SYSTEM_VERSION_EQUAL_TO(9.0)) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:delegate cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alert show];
    }else{
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction * sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancel];
        [alertController addAction:sure];
        NSAssert([viewController isKindOfClass:[UIViewController class]], @"UIAlertController的target必须为UIViewController");
        [viewController presentViewController:alertController animated:YES completion:nil];
    }
}

@end
