//
//  Macro.h
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

typedef void(^EmptyBlock)();

#define WS  __weak typeof(self) weakSelf = self

#define UIImageNamed(name)   [UIImage imageNamed:name]
//系统字体
#define FONT(fontSize)       [UIFont systemFontOfSize:fontSize]
//粗体
#define FONTBOLD(fontSize)       [UIFont boldSystemFontOfSize:fontSize]
//方正剪纸
#define FONT1(fontSize)      [UIFont fontWithName:@"FZJZJW--GB1-0" size:fontSize]
//方正剪纸
#define FONT2(fontSize)      [UIFont fontWithName:@"FZFENSTXJW--GB1-0" size:fontSize]
//UIColorFromRGB(0x16c79a)
#define MAIN_COLOR  UIColorFromRGB(0x00C78C)


//字符串拼接
#define StringFormat(fmt, ...) [NSString stringWithFormat:fmt, __VA_ARGS__]

// RGB颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


#endif /* Macro_h */
