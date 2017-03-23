//
//  LQNavigationViewController.m
//  RACDemo
//
//  Created by 李强 on 2017/3/17.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQNavigationViewController.h"

@interface LQNavigationViewController ()

@end

@implementation LQNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
