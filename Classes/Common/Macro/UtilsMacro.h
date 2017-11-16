//
//  UtilsMacro.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/16.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

// ios7之上的系统
#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO)

// 获取屏幕 宽度、高度 bounds就是屏幕的全部区域
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define IS_IPHONE4 [UIScreen mainScreen].bounds.size.height == 480

// 获取当前屏幕的高度 applicationFrame就是app显示的区域，不包含状态栏
#define kMainScreenHeight ([UIScreen mainScreen].applicationFrame.size.height)
#define kMainScreenWidth  ([UIScreen mainScreen].applicationFrame.size.width)

// 判断字段时候为空的情况
#define IF_NULL_TO_STRING(x) ([(x) isEqual:[NSNull null]]||(x)==nil)? @"":TEXT_STRING(x)
// 转换为字符串
#define TEXT_STRING(x) [NSString stringWithFormat:@"%@",x]

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 设置颜色RGB
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
#define ImageNamed(name) [UIImage imageNamed:name]

// 每次请求列表 数据量
#define LS_REQUEST_LIST_COUNT @"10"
#define LS_REQUEST_LIST_NUM_COUNT 10

// 个人信息
#define IS_LOGIN (((NSString *)SEEKPLISTTHING(USER_ID)).length > 0)

#define YC_USER_ID IF_NULL_TO_STRING(((NSString *)SEEKPLISTTHING(USER_ID)))
#define YC_USER_PHONE IF_NULL_TO_STRING(((NSString *)SEEKPLISTTHING(USER_PHONE)))
#define YC_USER_EASEMOB_NAME IF_NULL_TO_STRING(((NSString *)SEEKPLISTTHING(USER_EASEMOB_NAME)))

#define MAINCOLOR UIColorFromRGB(0x21C1F7)

#define SUBCOLOR UIColorFromRGB(0xFF4C4C)

#define GX_BGCOLOR COLOR(234, 234, 234, 1)

#define MAIN_TEXT_COLOR COLOR(109, 109, 109, 1)

#define MAIN_LINE_COLOR COLOR(135, 135, 135, 1)

#define MAIN_LIGHT_LINE_COLOR COLOR(174, 174, 174, 1)

#define MAIN_BLACK_TEXT_COLOR COLOR(38, 38, 38, 1)

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//宏定义
//全大写加下划线
//k开头驼峰

#define SEEKPLISTTHING(KEY)     [[NSUserDefaults standardUserDefaults]objectForKey:KEY]
#define DEPOSITLISTTHING(VALUE,KEY)  [[NSUserDefaults standardUserDefaults] setObject:VALUE forKey:KEY]

#define GA_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define GA_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

#pragma mark - 方正黑体简体字体定义
#define FONT(F)                [UIFont fontWithName:@"FZHTJW--GB1-0" size:F]
#define FONT_SDGothicNeo(F)    [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:F]
#define FONTMic(F)                 [UIFont fontWithName:@"MicrosoftYaHei" size:F]
#pragma mark - 字体加粗
#define FontBig(F) [UIFont fontWithName:@"Helvetica-Bold" size:F]
#pragma mark - 导航栏高度
#define NavigationBar_HEIGHT   44

#pragma mark - 屏幕尺寸相关
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define UIScreenHeight  [[UIScreen mainScreen]bounds].size.height

#pragma mark alertView
#define GA_ALERT(msg) [[[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show]

#pragma mark - 安全释放资源
#define SAFE_RELEASE(x) [x release];x=nil

#pragma mark - IOS版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#pragma mark - 当前系统版本
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])

#pragma mark - 当前系统语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

#pragma mark - 检测是否是Retina屏幕,是否是iPhone5,是否是iPad
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#pragma mark - 本地持久化宏
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

#pragma mark - degrees/radian functions
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)

#pragma mark - 颜色相关宏函数
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#pragma mark - 设备型号识别
#define is_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#pragma mark - 打印当前方法的名字
#define ITTDPRINTMETHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)

#pragma mark - rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#pragma mark - 判断系统版本高于或者低于某一个版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


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

#ifdef DEBUG
#    define DLog(...) NSLog(__VA_ARGS__)
#else
#    define DLog(...) /* */
#endif
#define ALog(...) NSLog(__VA_ARGS__)
#endif


#endif /* UtilsMacro_h */
