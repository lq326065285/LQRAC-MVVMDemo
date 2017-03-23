//
//  UIButton+createFactory.m
//  KADOnlinePharmacies
//
//  Created by ~~浅笑 on 17/1/12.
//  Copyright © 2017年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "UIButton+createFactory.h"

@implementation UIButton (createFactory)

+(instancetype)lq_buttonWithFrame:(CGRect)frame buttonType:(UIButtonType)buttonType title:(NSString *)title image:(UIImage *)image target:(id)target selector:(SEL)selector backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor font:(CGFloat)font isClipsToBounds:(BOOL)isClipsToBounds{
    UIButton * button = [self buttonWithType:buttonType];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
//    [button setBackgroundImage:[LQGlobalService getImageWithColor:backgroundColor ?: [UIColor clearColor]]forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    if (isClipsToBounds) {
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
    }
    return button;
}

+(instancetype)lq_buttonWithFrame:(CGRect)frame buttonType:(UIButtonType)buttonType title:(NSString *)title target:(id)target selector:(SEL)selector textColor:(UIColor *)textColor font:(CGFloat)font{
    UIButton * button = [self buttonWithType:buttonType];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
     return button;
}

@end
