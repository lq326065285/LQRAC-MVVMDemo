//
//  LQConfigModel.h
//  RACDemo
//
//  Created by 李强 on 2017/4/10.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQConfigModel : NSObject

/**
 cell的指
 */
@property (nonatomic,copy) NSString * className;

/**
 cell的高度
 */
@property (nonatomic,assign) CGFloat * cellHeight;

/**
 目标vc
 */
@property (nonatomic,assign) UIViewController * destinationVC;

/**
 cell是否已经注册过了
 */
@property (nonatomic,assign) BOOL classIsOK;

/**
 是不是用xib创建的
 */
@property (nonatomic,assign) BOOL isXib;

@end
