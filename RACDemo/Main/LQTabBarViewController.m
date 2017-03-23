//
//  LQTabBarViewController.m
//  RACDemo
//
//  Created by 李强 on 2017/3/17.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQTabBarViewController.h"
#import "LQNavigationViewController.h"

@interface LQTabBarViewController ()

@end

@implementation LQTabBarViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViewContrls];
}
  
    
-(void)setViewContrls{
//    @{@@"image":@"discover"},
//    @{@"image":@"message"},
//    @{@"image":@"mine"}
    NSArray * configArr =@[
                           @{@"title":@"首页",@"image":@"home",@"viewController":@"LQHomeViewController"},
                           @{@"title":@"发现",@"image":@"discover",@"viewController":@"LQDiscoverViewController"},
                           @{@"title":@"消息",@"image":@"message",@"viewController":@"LQMessageViewController"},
                           @{@"title":@"我的",@"image":@"mine",@"viewController":@"LQMineViewController"}
                           ];
    NSMutableArray * arrViewController = [[NSMutableArray alloc] init];
    for(NSDictionary * dict  in configArr){
        [arrViewController addObject:[self setupNavWithDict:dict]];
    }
    
    self.viewControllers = arrViewController;
    
}
    
   
-(UINavigationController *)setupNavWithDict:(NSDictionary *)dict{
    NSString * title = dict[@"title"];
    NSString * image = dict[@"image"];
    Class cls = NSClassFromString(dict[@"viewController"]);
    UIViewController * vc = (UIViewController *)[[cls alloc] init];
    if (!vc) {
        return [[UINavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
    }
    
    vc.tabBarItem.title = title;
    vc.title = title;
    [vc.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@_highted",image]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    vc.tabBarItem.badgeColor = [UIColor grayColor];
    self.tabBar.tintColor = [UIColor orangeColor];
    LQNavigationViewController * n = [[LQNavigationViewController alloc] initWithRootViewController:vc];
    return n;
}




@end
