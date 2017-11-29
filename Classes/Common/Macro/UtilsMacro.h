//
//  UtilsMacro.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/16.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h


/**
    圆角和加边框
 */
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/**
    圆角
 */
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

/**
    view Tag
 */
#define ViewTag(View, Tag)\
\
[View viewWithTag : Tag]

#pragma mark - iPhone设备使用的编译
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#pragma mark - 模拟器使用的编译
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

#endif /* UtilsMacro_h */
