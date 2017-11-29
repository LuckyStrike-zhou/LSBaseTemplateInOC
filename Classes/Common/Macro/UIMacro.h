//
//  UIMacro.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/23.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h

/**********************************************
                Frame
 ********************************************** */

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
            固定参数
 ********************************************** */

#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)

/**********************************************
            字体
 ********************************************** */

#define FONT_BOLD_Macro(FONTSIZE)   [UIFont boldSystemFontOfSize:FONTSIZE]
#define FONT_NORMAL_Macro(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT_Macro(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

///正常字体
#define H30_Macro [UIFont systemFontOfSize:30]
#define H29_Macro [UIFont systemFontOfSize:29]
#define H28_Macro [UIFont systemFontOfSize:28]
#define H27_Macro [UIFont systemFontOfSize:27]
#define H26_Macro [UIFont systemFontOfSize:26]
#define H25_Macro [UIFont systemFontOfSize:25]
#define H24_Macro [UIFont systemFontOfSize:24]
#define H23_Macro [UIFont systemFontOfSize:23]
#define H22_Macro [UIFont systemFontOfSize:22]
#define H20_Macro [UIFont systemFontOfSize:20]
#define H19_Macro [UIFont systemFontOfSize:19]
#define H18_Macro [UIFont systemFontOfSize:18]
#define H17_Macro [UIFont systemFontOfSize:17]
#define H16_Macro [UIFont systemFontOfSize:16]
#define H15_Macro [UIFont systemFontOfSize:15]
#define H14_Macro [UIFont systemFontOfSize:14]
#define H13_Macro [UIFont systemFontOfSize:13]
#define H12_Macro [UIFont systemFontOfSize:12]
#define H11_Macro [UIFont systemFontOfSize:11]
#define H10_Macro [UIFont systemFontOfSize:10]
#define H8_Macro  [UIFont systemFontOfSize:8]
///粗体
#define HB20_Macro [UIFont boldSystemFontOfSize:20]
#define HB18_Macro [UIFont boldSystemFontOfSize:18]
#define HB16_Macro [UIFont boldSystemFontOfSize:16]
#define HB14_Macro [UIFont boldSystemFontOfSize:14]
#define HB13_Macro [UIFont boldSystemFontOfSize:13]
#define HB12_Macro [UIFont boldSystemFontOfSize:12]
#define HB11_Macro [UIFont boldSystemFontOfSize:11]
#define HB10_Macro [UIFont boldSystemFontOfSize:10]
#define HB8_Macro  [UIFont boldSystemFontOfSize:8]

/**********************************************
                    颜色
 ********************************************** */

#define RGB_Macro(r,g,b)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBA_Macro(r,g,b,a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

///常用颜色
#define BLACK_COLOR_Macro     [UIColor blackColor]
#define BLUE_COLOR_Macro      [UIColor blueColor]
#define BROWN_COLOR_Macro     [UIColor brownColor]
#define CLEAR_COLOR_Macro     [UIColor clearColor]
#define DARKGRAY_COLOR_Macro  [UIColor darkGrayColor]
#define DARKTEXT_COLOR_Macro  [UIColor darkTextColor]
#define WHITE_COLOR_Macro     [UIColor whiteColor]
#define YELLOW_COLOR_Macro    [UIColor yellowColor]
#define RED_COLOR_Macro       [UIColor redColor]
#define ORANGE_COLOR_Macro    [UIColor orangeColor]
#define PURPLE_COLOR_Macro    [UIColor purpleColor]
#define LIGHTTEXT_COLOR_Macro [UIColor lightTextColor]
#define LIGHTGRAY_COLOR_Macro [UIColor lightGrayColor]
#define GREEN_COLOR_Macro     [UIColor greenColor]
#define GRAY_COLOR_Macro      [UIColor grayColor]
#define MAGENTA_COLOR_Macro   [UIColor magentaColor]

//通用视觉规范
#define FSWhiteColor COLOR(255, 255, 255)          //纯白
#define FSBlueColor COLOR(0, 153, 255)             //蓝色
#define FSOrangeColor COLOR(253, 106, 60)          //橙色
#define FSYellowColor COLOR(239, 166, 68)          //黄色
#define FSBlackColor COLOR(68, 68, 68)             //浅黑色
#define FSGrayColor COLOR(102, 102, 102)           //灰色
#define FSlightGrayColor COLOR(153, 153, 153)      //浅灰色
#define FSCoffeeColor COLOR(185,152,99)            //咖啡色
#define FSCommonBgColor  COLOR(248, 248, 248)      //灰白色
#define FSSeparatorLineColor COLOR(232, 232, 232)  //分割线颜色
#define FSTranslucentColor ColorWithAlpha(0,0,0,0.55)  //半透明颜色
#define FSLGrayColor COLOR(238,238,238)

#define GX_BGCOLOR RGBA(234, 234, 234, 1)

#define MAIN_TEXT_COLOR RGBA(109, 109, 109, 1)

#define MAIN_LINE_COLOR RGBA(135, 135, 135, 1)

#define MAIN_LIGHT_LINE_COLOR RGBA(174, 174, 174, 1)

#define MAIN_BLACK_TEXT_COLOR RGBA(38, 38, 38, 1)


#endif /* UIMacro_h */
