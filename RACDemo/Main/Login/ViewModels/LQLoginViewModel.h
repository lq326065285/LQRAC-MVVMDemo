//
//  LQLoginViewController.h
//  RACDemo
//
//  Created by 李强 on 2017/3/17.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQLoginViewModel : NSObject

@property (nonatomic,strong) RACCommand * loginCommand;
    
@property (nonatomic,strong) RACSubject * subject;

@end
