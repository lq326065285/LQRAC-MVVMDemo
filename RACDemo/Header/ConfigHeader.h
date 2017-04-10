//
//  ConfigHeader.h
//  RACDemo
//
//  Created by 李强 on 2017/4/10.
//  Copyright © 2017年 李强. All rights reserved.
//

#ifndef ConfigHeader_h
#define ConfigHeader_h

//2.屏幕宽高
//设备屏幕尺寸 屏幕Size
#define KSCREEN_SIZE      [[UIScreen mainScreen] bounds].size
#define KSCREEN_HEIGHT  ([UIScreen mainScreen].bounds.size.height)
#define KSCREEN_WIDTH   ([UIScreen mainScreen].bounds.size.width)
//适配缩放
#define KSCREEN_SCALING    ([UIScreen mainScreen].bounds.size.width) / 375.0
//获取 屏幕Frame
#define KSCREEN_FRAME   [UIScreen mainScreen].applicationFrame
#define KSCREEN_CENTER_X  kScreen_Width/2
#define KSCREEN_CENTER_Y  kScreen_Height/2

#define GET_VIEW_X(View) (View.frame.size.width + View.frame.origin.x)
#define GET_VIEW_Y(View) (View.frame.size.height + View.frame.origin.y)
#define GET_FRAME_X(Frame) (Frame.size.width + Frame.origin.x)
#define GET_FRAME_Y(Frame) (Frame.size.height + Frame.origin.y)

#define RGB1(r,g,b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1]


#endif /* ConfigHeader_h */
