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
    延迟
 */
#define delayRun(s) dispatch_time(DISPATCH_TIME_NOW, (int64_t)(s * NSEC_PER_SEC)), dispatch_get_main_queue()

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
#define VIEWWITHTAG(_OBJECT, _TAG)\
\
[_OBJECT viewWithTag : _TAG]

// 本地化字符串
/** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define LocalString(x, ...)     NSLocalizedString(x, nil)
/** NSLocalizedStringFromTable宏做的其实就是在当前bundle中查找资源文件名“xxx.strings”(参数:键＋文件名＋注释) */
#define AppLocalString(x, ...)  NSLocalizedStringFromTable(x, @"someName", nil)


#pragma mark - iPhone设备使用的编译
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#pragma mark - 模拟器使用的编译
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

#pragma mark - 检测是否是ARC
//ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif


#endif /* UtilsMacro_h */
