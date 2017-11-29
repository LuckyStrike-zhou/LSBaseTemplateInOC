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

/**********************************************
                    DEBUG LOG
 ********************************************** */

#ifdef DEBUG
#define DLog( s, ... )  NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
//显眼注释
#define PLog( s, ...)   NSLog( @"***%@***:",[NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else

#define DLog( s, ... )
#define PLog( s, ... )
#endif

/**********************************************
                    Frame
 ********************************************** */

#define Frame_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 获取屏幕 宽度、高度 bounds就是屏幕的全部区域
#define FrameSCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define FrameSCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)
// View 坐标(x,y)和宽高(width,height)
#define FrameX(v)                    (v).frame.origin.x
#define FrameY(v)                    (v).frame.origin.y
#define FrameWidth(v)                (v).frame.size.width
#define FrameHeight(v)               (v).frame.size.height

#define FrameMinX(v)                 CGRectGetMinX((v).frame)
#define FrameMinY(v)                 CGRectGetMinY((v).frame)

#define FrameMidX(v)                 CGRectGetMidX((v).frame)
#define FrameMidY(v)                 CGRectGetMidY((v).frame)

#define FrameMaxX(v)                 CGRectGetMaxX((v).frame)
#define FrameMaxY(v)                 CGRectGetMaxY((v).frame)

#define Frame_CHANGE_X(v,x)          CGRectMake(x, Y(v), WIDTH(v), HEIGHT(v))
#define Frame_CHANGE_Y(v,y)          CGRectMake(X(v), y, WIDTH(v), HEIGHT(v))
#define Frame_CHANGE_Point(v,x,y)    CGRectMake(x, y, WIDTH(v), HEIGHT(v))
#define Frame_CHANGE_Width(v,w)      CGRectMake(X(v), Y(v), w, HEIGHT(v))
#define Frame_CHANGE_Height(v,h)     CGRectMake(X(v), Y(v), WIDTH(v), h)
#define Frame_CHANGE_Size(v,w,h)     CGRectMake(X(v), Y(v), w, h)

/**********************************************
                    版本适配
 ********************************************** */

//IOS版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define IOS_8  ([[UIDevice currentDevice].systemVersion floatValue]) >= 8.0 ? YES : NO
#define IOS_9  ([[UIDevice currentDevice].systemVersion floatValue]) >= 9.0 ? YES : NO
#define IOS_10 @available(iOS 10.0, *)
#define IOS_11 @available(iOS 11.0, *)

/**********************************************
                    类别简写
 ********************************************** */

#define kUserDefaults   [NSUserDefaults standardUserDefaults]
#define kWindow         [[UIApplication sharedApplication] keyWindow]
#define kRootViewController [[UIApplication sharedApplication] keyWindow].rootViewController

#define URL(url) [NSURL URLWithString:url]

#define S_Append(str1,str2) [NSString stringWithFormat:@"%@%@",str1,str2]
#define S_ParaStr           [NSString stringWithFormat:@"%@=%@&",str1,str2]
#define S_Int(i)            [NSString stringWithFormat:@"%d",i]
#define S_Float(f)          [NSString stringWithFormat:@"%f",f]

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

/**********************************************
                        字体
 ********************************************** */

#define F_BOLD(FONTSIZE)     [UIFont boldSystemFontOfSize:FONTSIZE]
#define F_NORMAL(FONTSIZE)   [UIFont systemFontOfSize:FONTSIZE]
#define F_FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]
//正常字体
#define F_H(SIZE)     [UIFont systemFontOfSize:SIZE]
//粗体
#define F_HB(SIZE)    [UIFont boldSystemFontOfSize:SIZE]

/**********************************************
                    颜色
 ********************************************** */

#define RGB(r,g,b)      [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA(r,g,b,a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

///常用颜色
#define C_BLACK     [UIColor blackColor]
#define C_BLUE      [UIColor blueColor]
#define C_BROWN     [UIColor brownColor]
#define C_CLEAR     [UIColor clearColor]
#define C_DARKGRAY  [UIColor darkGrayColor]
#define C_WHITE     [UIColor whiteColor]
#define C_YELLOW    [UIColor yellowColor]
#define C_RED       [UIColor redColor]
#define C_ORANGE    [UIColor orangeColor]
#define C_PURPLE    [UIColor purpleColor]
#define C_LIGHTGRAY [UIColor lightGrayColor]
#define C_GREEN     [UIColor greenColor]
#define C_GRAY      [UIColor grayColor]
#define C_MAGENTA   [UIColor magentaColor]

//通用视觉规范
#define CC_BLUE RGB(0, 153, 255)             //蓝色
#define CC_ORANGE RGB(253, 106, 60)          //橙色
#define CC_YELLOW RGB(239, 166, 68)          //黄色
#define CC_BLACK RGB(68, 68, 68)             //浅黑色
#define CC_GRAY RGB(102, 102, 102)           //灰色
#define CC_LIGHTGRAY RGB(153, 153, 153)      //浅灰色
#define CC_COFFEE RGB(185,152,99)            //咖啡色
#define CC_COMMON_BG  RGB(248, 248, 248)      //灰白色
#define CC_SEPARATOR_LINE RGB(232, 232, 232)  //分割线颜色
#define CC_TRANSLUCENT RGBA(0,0,0,0.55)  //半透明颜色
#define CC_LGRAY RGB(238,238,238)

#define C_BGCOLOR RGBA(234, 234, 234, 1)

#define C_TEXT_COLOR RGBA(109, 109, 109, 1)

#define C_LINE_COLOR RGBA(135, 135, 135, 1)

#define C_LIGHT_LINE_COLOR RGBA(174, 174, 174, 1)

#define C_BLACK_TEXT_COLOR RGBA(38, 38, 38, 1)

/**********************************************
                    设备信息
 ********************************************** */

// 当前语言
#define DEVICE_LANGUAGE         ([[NSLocale preferredLanguages] objectAtIndex:0])
// 是否iPad
#define DEVICE_ISPad            (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//设备型号
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
///获取版本号
#define APP_VERSION      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

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

/**********************************************
                        固定参数
 ********************************************** */

#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)

#endif /* AppMacro_h */
