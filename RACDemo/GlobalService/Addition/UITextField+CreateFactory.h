//
//  UITextField+CreateFactory.h
//  KADOnlinePharmacies
//
//  Created by ~~浅笑 on 17/1/12.
//  Copyright © 2017年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CreateFactory)

+(instancetype)lq_textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder borderStyle:(UITextBorderStyle)borderStyle delegate:(id)delegate font:(CGFloat)font keyboardType:(UIKeyboardType)type;

@end
