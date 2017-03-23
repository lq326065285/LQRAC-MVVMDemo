//
//  UITextField+CreateFactory.m
//  KADOnlinePharmacies
//
//  Created by ~~浅笑 on 17/1/12.
//  Copyright © 2017年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "UITextField+CreateFactory.h"

@implementation UITextField (CreateFactory)

+(instancetype)lq_textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder borderStyle:(UITextBorderStyle)borderStyle delegate:(id)delegate font:(CGFloat)font keyboardType:(UIKeyboardType)type{
    UITextField * textField = [[self alloc] initWithFrame:frame];
    textField.delegate = delegate;
    textField.placeholder = placeholder;
    textField.borderStyle = borderStyle;
    textField.font = [UIFont systemFontOfSize:font];
    textField.textColor = [UIColor blackColor];
    textField.keyboardType = type;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    return textField;
}

@end
