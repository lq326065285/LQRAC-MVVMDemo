//
//  LQSetUserInfoVC.h
//  RACDemo
//
//  Created by 李强 on 2017/3/23.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LQSetUserInfoVC : UIViewController

@property (nonatomic,strong) RACSignal * signal;

@property (nonatomic,copy) NSString * content;

@property (nonatomic,strong) RACCommand * sureCommand;
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end
