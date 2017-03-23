//
//  UILabel+CreateFactory.m
//  KADOnlinePharmacies
//
//  Created by ~~浅笑 on 17/1/12.
//  Copyright © 2017年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "UILabel+CreateFactory.h"

@implementation UILabel (CreateFactory)

+(instancetype)lq_labelWithFrame:(CGRect)frame title:(NSString *)title font:(CGFloat)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment{
    UILabel * label = [[self alloc] initWithFrame:frame];
    label.text = title;
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    return label;
}

@end
