//
//  UILabel+CreateFactory.h
//  KADOnlinePharmacies
//
//  Created by ~~浅笑 on 17/1/12.
//  Copyright © 2017年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CreateFactory)

/**
 创建一个label

 @param frame         frame
 @param title         label显示的内容
 @param font          font
 @param textColor     textColor
 @param textAlignment textAlignment

 @return label
 */
+(instancetype)lq_labelWithFrame:(CGRect)frame title:(NSString *)title font:(CGFloat)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment;

@end
