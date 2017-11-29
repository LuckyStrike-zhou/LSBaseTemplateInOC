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
 *  定义构造单例的宏
 */
#define shareInstanceInterfaceBuilder \
+ (instancetype)sharedInstance;

#define shareInstanceBuilder(ClassName) \
+ (instancetype)sharedInstance\
{\
    static dispatch_once_t onceToken;\
    static ClassName* instance;\
    dispatch_once(&onceToken, ^{\
        instance = [[ClassName alloc] init];\
    });\
    return instance;\
}
/**
 
 */
#define setTableViewSeparatorZeroMargin(TABLEVIEW_OR_CELL) \
if ([TABLEVIEW_OR_CELL respondsToSelector:@selector(setSeparatorInset:)]){\
    [TABLEVIEW_OR_CELL setSeparatorInset:UIEdgeInsetsZero];\
}\
if ([TABLEVIEW_OR_CELL respondsToSelector:@selector(setLayoutMargins:)]){\
    [TABLEVIEW_OR_CELL setLayoutMargins:UIEdgeInsetsZero];\
}

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
