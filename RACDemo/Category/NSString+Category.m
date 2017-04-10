//
//  NSString+Category.m
//  RACDemo
//
//  Created by 李强 on 2017/4/10.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

+(BOOL)isEmptyOrNull:(NSString *)str{
    if (str == nil) {
        return YES;
    }
    
    if ([str isEqualToString:@""]) {
        return YES;
    }
    
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}

@end
