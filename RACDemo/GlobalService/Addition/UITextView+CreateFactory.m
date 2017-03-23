//
//  UITextView+CreateFactory.m
//  KADOnlinePharmacies
//
//  Created by ~~浅笑 on 17/1/12.
//  Copyright © 2017年 广东康爱多连锁药店有限公司. All rights reserved.
//

#import "UITextView+CreateFactory.h"

@implementation UITextView (CreateFactory)

+(instancetype)lq_textViewWithFrame:(CGRect)frame delegate:(id)delegate{
    UITextView * textView = [[UITextView alloc] initWithFrame:frame];
    textView.delegate = delegate;
    textView.textColor = [UIColor blackColor];
    textView.font = [UIFont systemFontOfSize:16];
    textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    return textView;
}

@end
