//
//  UIView+createFactory.m
//  KADOnlinePharmacies
//
//  Created by ~~浅笑 on 17/1/12.
//  Copyright © 2017年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "UIView+createFactory.h"

@implementation UIView (createFactory)

+(instancetype)lq_LineViewWithFrame:(CGRect)frame lineColor:(UIColor *)lineColor{
    UIView * line = [[self alloc] initWithFrame:frame];
    line.backgroundColor = lineColor;
    return line;
}

@end
