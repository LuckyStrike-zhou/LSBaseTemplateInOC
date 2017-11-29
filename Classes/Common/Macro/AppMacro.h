//
//  AppMacro.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/16.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

/**
    测试开关
 */
#define DEBUG  1

/**********************************************
                    版本
 ********************************************** */

#define ProjectVersion [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"]
#define ProjectBuildVersion [[[NSBundle mainBundle] infoDictionary] valueForKey:(NSString *)kCFBundleVersionKey]

/**********************************************
                    DEBUG LOG
 ********************************************** */

#ifdef DEBUG
#define DLog( s, ... )  NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ... )
#endif
//显眼注释
#define PLog( s, ...)   NSLog( @"***%@***:",[NSString stringWithFormat:(s), ##__VA_ARGS__] )

// 断点Assert
#define ALog(condition, ...)\
\
do {\
if (!(condition))\
{\
[[NSAssertionHandler currentHandler]\
handleFailureInFunction:[NSString stringWithFormat:@"< %s >", __PRETTY_FUNCTION__]\
file:[[NSString stringWithUTF8String:__FILE__] lastPathComponent]\
lineNumber:__LINE__\
description:__VA_ARGS__];\
}\
} while(0)

/**********************************************
                    版本适配
 ********************************************** */

//IOS版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define IOS_8  ([[UIDevice currentDevice].systemVersion floatValue]) >= 8.0 ? YES : NO
#define IOS_9  ([[UIDevice currentDevice].systemVersion floatValue]) >= 9.0 ? YES : NO
#define IOS_10 @available(iOS 10.0, *)
#define IOS_11 @available(iOS 11.0, *)

#define IOS10 __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0


//判断系统版本高于或者低于某一个版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/**********************************************
            设备信息
 ********************************************** */

// 当前语言
#define CURRENT_LANGUAGE         ([[NSLocale preferredLanguages] objectAtIndex:0])
// 是否iPad
#define isPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//设备型号
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
///获取Xcode的版本号
#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/**********************************************
                    Bundle 读取
 ********************************************** */

// PNG JPG 图片路径
#define BUNDLE_PATH_PNG(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define BUNDLE_PATH_JPG(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define BUNDLE_PATH(NAME, EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]
// 加载图片
#define IMAGE_PNG(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define IMAGE_JPGk(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME, EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

// 本地化字符串
/** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define LocalString(x, ...)     NSLocalizedString(x, nil)
/** NSLocalizedStringFromTable宏做的其实就是在当前bundle中查找资源文件名“xxx.strings”(参数:键＋文件名＋注释) */
#define AppLocalString(x, ...)  NSLocalizedStringFromTable(x, @"someName", nil)



/**********************************************
 iPhone设备使用的编译
 ********************************************** */

#if TARGET_OS_IPHONE
//iPhone Device
#endif

#pragma mark - 模拟器使用的编译
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

#endif /* AppMacro_h */
