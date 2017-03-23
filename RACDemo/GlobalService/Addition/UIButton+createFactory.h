//
//  UIButton+createFactory.h
//  KADOnlinePharmacies
//
//  Created by ~~浅笑 on 17/1/12.
//  Copyright © 2017年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (createFactory)


/**
 带图片 背景颜色的button

 @param frame           frame
 @param buttonType      buttonType
 @param title           title
 @param image           image
 @param target          image
 @param selector        selector
 @param backgroundColor backgroundColor
 @param textColor       textColor
 @param font            font
 @param isClipsToBounds isClipsToBounds是否倒角

 @return <#return value description#>
 */
+(instancetype)lq_buttonWithFrame:(CGRect)frame buttonType:(UIButtonType)buttonType title:(NSString *)title image:(UIImage *)image target:(id)target selector:(SEL)selector backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor font:(CGFloat)font isClipsToBounds:(BOOL)isClipsToBounds;


/**
 一般的button 只有字 没有背景颜色的

 @param frame      frame
 @param buttonType buttonType
 @param title      title
 @param target     target
 @param selector   selector
 @param textColor  textColor
 @param font       font

 @return button
 */
+(instancetype)lq_buttonWithFrame:(CGRect)frame buttonType:(UIButtonType)buttonType title:(NSString *)title target:(id)target selector:(SEL)selector textColor:(UIColor *)textColor font:(CGFloat)font;

@end
