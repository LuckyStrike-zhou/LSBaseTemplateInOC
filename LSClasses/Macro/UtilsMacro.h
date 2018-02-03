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

#pragma mark - iPhone设备使用的编译
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#pragma mark - 模拟器使用的编译
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


#endif /* UtilsMacro_h */
