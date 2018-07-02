//
//  AppMacro.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/16.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

#import <Foundation/Foundation.h>

/**
    测试开关
 */
#define DEBUG  1
#define APP_VERSION_FOR_CHECK @"1.1.1"

/**********************************************
                    DEBUG LOG
 ********************************************** */

#ifdef DEBUG
#define DLog( s, ... )  NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
//显眼注释
#define PLog( s, ...)   NSLog( @"***%@***:",[NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ... ) {}
#define PLog( s, ... ) {}
#endif

/**********************************************
                    Block
 ********************************************** */

typedef void (^VoidBlock)(void);
typedef BOOL (^BoolBlock)(void);
typedef int  (^IntBlock) (void);
typedef id   (^IDBlock)  (void);

typedef void (^VoidBlock_int)(int);
typedef BOOL (^BoolBlock_int)(int);
typedef int  (^IntBlock_int) (int);
typedef id   (^IDBlock_int)  (int);

typedef void (^VoidBlock_string)(NSString *);
typedef BOOL (^BoolBlock_string)(NSString *);
typedef int  (^IntBlock_string) (NSString *);
typedef id   (^IDBlock_string)  (NSString *);

typedef void (^VoidBlock_id)(id);
typedef BOOL (^BoolBlock_id)(id);
typedef int  (^IntBlock_id) (id);
typedef id   (^IDBlock_id)  (id);

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
//-------------------获取全局AppDelegates-------------------------
#define GetAppDelegates   (AppDelegate *)[[UIApplication sharedApplication]delegate];
/**********************************************
                    类别简写
 ********************************************** */

#define kUserDefaults   [NSUserDefaults standardUserDefaults]
#define kWindow         [[UIApplication sharedApplication] keyWindow]
#define kRootViewController [[UIApplication sharedApplication] keyWindow].rootViewController
#define kAppDelegate    [[UIApplication sharedApplication] delegate]


#define URL(url) [NSURL URLWithString:url]

#define S_Append(str1,str2) [NSString stringWithFormat:@"%@%@",str1,str2]
#define S_ParaStr(str1,str2) [NSString stringWithFormat:@"%@=%@&",str1,str2]
#define S_Int(i)            [NSString stringWithFormat:@"%d",i]
#define S_Float(f)          [NSString stringWithFormat:@"%f",f]
#define S_Integer(i)        [NSString stringWithFormat:@"%ld",(long)i]

/**********************************************
                    Bundle 读取
 ********************************************** */


// PNG JPG 图片路径
#define BUNDLE_PATH_PNG(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define BUNDLE_PATH_JPG(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]
#define BUNDLE_PATH(NAME, EXT)         [[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]
// 加载图片
#define IMAGE_PNG(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"png"]]
#define IMAGE_JPG(NAME)          [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:@"jpg"]]
#define IMAGE(NAME, EXT)        [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(NAME) ofType:(EXT)]]

#define IMAGE_NAMED(imgName) [UIImage imageNamed:imgName]
#define IMAGE_CONTENTS_FILE(imgName) [UIImage imageWithContentsOfFile:imgName]


#define LSBUNDLE_PATH(bundleName)   [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"]

#define LSBUNDLE(bundleName)        [NSBundle bundleWithPath:LSBUNDLE_PATH(bundleName)]

#define IMAGE_FROM_BUNDLE(bundleName,name)    [LSBUNDLE_PATH(bundleName) stringByAppendingPathComponent:name]

#define XIB_VIEW_FROM_BUNDLE(bundleName,xibName)  [[LSBUNDLE(bundleName) loadNibNamed:xibName owner:self options:nil] objectAtIndex:0]

#define STORYBOARD_FROM_BUNDLE(bundleName,storyName)    [UIStoryboard storyboardWithName:storyName bundle:LSBUNDLE(bundleName)]

/**********************************************
                    设备信息
 ********************************************** */

// 当前语言
#define DEVICE_LANGUAGE         ([[NSLocale preferredLanguages] objectAtIndex:0])
// 是否iPad
#define DEVICE_ISPad            (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//设备型号
#define iPhone5sOrSE ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
///获取版本号
#define APP_VERSION      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#define MRC_APP_NAME    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
#define MRC_APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define MRC_APP_BUILD   ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

/**********************************************
                    国际化
 ********************************************** */

#define APP_NAME CFBundleDisplayName
//本地化字符串
/** NSLocalizedString宏做的其实就是在当前bundle中查找资源文件名“Localizable.strings”(参数:键＋注释) */
#define LocalString(x, ...)     NSLocalizedString(x, nil)
/** NSLocalizedStringFromTable宏做的其实就是在当前bundle中查找资源文件名“xxx.strings”(参数:键＋文件名＋注释) */
#define CustomLocalString(x, ...)  NSLocalizedStringFromTable(x, @"someName", nil)

/**********************************************
                    时间
 ********************************************** */

/** 时间间隔 */
#define Duration_ONE            (1.f)


#endif /* AppMacro_h */
