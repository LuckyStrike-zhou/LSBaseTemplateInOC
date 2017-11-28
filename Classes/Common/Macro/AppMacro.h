//
//  AppMacro.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/16.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

#define DEBUG  1

// 首次启动判断
#define LS_FIRST_LAUNCHED @"firstLaunch"

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
#define Assert_Log(condition, ...)\
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
                    Frame
 ********************************************** */

#define Device_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 获取屏幕 宽度、高度 bounds就是屏幕的全部区域
#define FrameSCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define FrameSCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)
// View 坐标(x,y)和宽高(width,height)
#define FrameX(v)                    (v).frame.origin.x
#define FrameY(v)                    (v).frame.origin.y
#define FrameWIDTH(v)                (v).frame.size.width
#define FrameHEIGHT(v)               (v).frame.size.height

#define FrameMinX(v)                 CGRectGetMinX((v).frame)
#define FrameMinY(v)                 CGRectGetMinY((v).frame)

#define FrameMidX(v)                 CGRectGetMidX((v).frame)
#define FrameMidY(v)                 CGRectGetMidY((v).frame)

#define FrameMaxX(v)                 CGRectGetMaxX((v).frame)
#define FrameMaxY(v)                 CGRectGetMaxY((v).frame)

#define Frame_CHANGE_x(v,x)          CGRectMake(x, Y(v), WIDTH(v), HEIGHT(v))
#define Frame_CHANGE_y(v,y)          CGRectMake(X(v), y, WIDTH(v), HEIGHT(v))
#define Frame_CHANGE_point(v,x,y)    CGRectMake(x, y, WIDTH(v), HEIGHT(v))
#define Frame_CHANGE_width(v,w)      CGRectMake(X(v), Y(v), w, HEIGHT(v))
#define Frame_CHANGE_height(v,h)     CGRectMake(X(v), Y(v), WIDTH(v), h)
#define Frame_CHANGE_size(v,w,h)     CGRectMake(X(v), Y(v), w, h)

/**********************************************
                    版本适配
 ********************************************** */

//IOS版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define IOS_8  ([[UIDevice currentDevice].systemVersion floatValue]) >= 8.0 ? YES : NO
#define IOS_9  ([[UIDevice currentDevice].systemVersion floatValue]) >= 9.0 ? YES : NO
#define IOS_10 ([[UIDevice currentDevice].systemVersion floatValue]) >= 10.0 ? YES : NO
#define IOS_11 @available(iOS 11.0, *)

//判断系统版本高于或者低于某一个版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

/**********************************************
                    类别简写
 ********************************************** */

#define kUserDefaults   [NSUserDefaults standardUserDefaults]
#define kWindow         [[UIApplication sharedApplication] keyWindow]

//number转String
#define IntTranslateStr(int_str) [NSString stringWithFormat:@"%d",int_str];
#define FloatTranslateStr(float_str) [NSString stringWithFormat:@"%.2d",float_str];


#define URL(url) [NSURL URLWithString:url]
#define string(str1,str2) [NSString stringWithFormat:@"%@%@",str1,str2]
#define s_str(str1) [NSString stringWithFormat:@"%@",str1]
#define s_Num(num1) [NSString stringWithFormat:@"%d",num1]
#define s_Integer(num1) [NSString stringWithFormat:@"%ld",num1]


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

#define IMAGE_NAMED(imgName) [UIImage imageNamed:imgName]

/**********************************************
                        字体
 ********************************************** */

#define BOLD_FONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define NORMAL_FONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

///正常字体
#define H30 [UIFont systemFontOfSize:30]
#define H29 [UIFont systemFontOfSize:29]
#define H28 [UIFont systemFontOfSize:28]
#define H27 [UIFont systemFontOfSize:27]
#define H26 [UIFont systemFontOfSize:26]
#define H25 [UIFont systemFontOfSize:25]
#define H24 [UIFont systemFontOfSize:24]
#define H23 [UIFont systemFontOfSize:23]
#define H22 [UIFont systemFontOfSize:22]
#define H20 [UIFont systemFontOfSize:20]
#define H19 [UIFont systemFontOfSize:19]
#define H18 [UIFont systemFontOfSize:18]
#define H17 [UIFont systemFontOfSize:17]
#define H16 [UIFont systemFontOfSize:16]
#define H15 [UIFont systemFontOfSize:15]
#define H14 [UIFont systemFontOfSize:14]
#define H13 [UIFont systemFontOfSize:13]
#define H12 [UIFont systemFontOfSize:12]
#define H11 [UIFont systemFontOfSize:11]
#define H10 [UIFont systemFontOfSize:10]
#define H8 [UIFont systemFontOfSize:8]
///粗体
#define HB20 [UIFont boldSystemFontOfSize:20]
#define HB18 [UIFont boldSystemFontOfSize:18]
#define HB16 [UIFont boldSystemFontOfSize:16]
#define HB14 [UIFont boldSystemFontOfSize:14]
#define HB13 [UIFont boldSystemFontOfSize:13]
#define HB12 [UIFont boldSystemFontOfSize:12]
#define HB11 [UIFont boldSystemFontOfSize:11]
#define HB10 [UIFont boldSystemFontOfSize:10]
#define HB8 [UIFont boldSystemFontOfSize:8]

/**********************************************
                    颜色
 ********************************************** */

#define RGB(r,g,b)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA(r,g,b,a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

///常用颜色
#define black_color     [UIColor blackColor]
#define blue_color      [UIColor blueColor]
#define brown_color     [UIColor brownColor]
#define clear_color     [UIColor clearColor]
#define darkGray_color  [UIColor darkGrayColor]
#define darkText_color  [UIColor darkTextColor]
#define white_color     [UIColor whiteColor]
#define yellow_color    [UIColor yellowColor]
#define red_color       [UIColor redColor]
#define orange_color    [UIColor orangeColor]
#define purple_color    [UIColor purpleColor]
#define lightText_color [UIColor lightTextColor]
#define lightGray_color [UIColor lightGrayColor]
#define green_color     [UIColor greenColor]
#define gray_color      [UIColor grayColor]
#define magenta_color   [UIColor magentaColor]


#define GX_BGCOLOR RGBA(234, 234, 234, 1)

#define MAIN_TEXT_COLOR RGBA(109, 109, 109, 1)

#define MAIN_LINE_COLOR RGBA(135, 135, 135, 1)

#define MAIN_LIGHT_LINE_COLOR RGBA(174, 174, 174, 1)

#define MAIN_BLACK_TEXT_COLOR RGBA(38, 38, 38, 1)

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
                        时间
 ********************************************** */

/** 时间间隔 */
#define Duration_ONE            (1.f)
/** 一天的秒数 */
#define SecondsOfDay            (24.f * 60.f * 60.f)
/** 秒数 */
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days))

/**********************************************
                        固定参数
 ********************************************** */

#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)

#endif /* AppMacro_h */
