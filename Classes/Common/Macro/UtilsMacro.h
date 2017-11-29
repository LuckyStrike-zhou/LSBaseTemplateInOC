//
//  UtilsMacro.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/16.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h

/**********************************************
            类别简写
 ********************************************** */

#define USERDEFAULTS_Macro   [NSUserDefaults standardUserDefaults]
#define ROOTVIEWCONTROLL_Macro  [[[UIApplication sharedApplication] keyWindow] rootViewController]


#define INT_TO_STRING_Macro(int_str) [NSString stringWithFormat:@"%d",int_str];
#define Float_TO_STRING_Macro(float_str) [NSString stringWithFormat:@"%.2d",float_str];

#define STRING_Macro(str1,str2) [NSString stringWithFormat:@"%@%@",str1,str2]

#define URL_Macro(url) [NSURL URLWithString:url]
#define IMAGE_NAMED_Macro(imgName) [UIImage imageNamed:imgName]

//拨打电话
#define MAKE_CALL_Macro(phoneNumber) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];
/**
    延迟
 */
#define DELAY_Macro(s) dispatch_time(DISPATCH_TIME_NOW, (int64_t)(s * NSEC_PER_SEC)), dispatch_get_main_queue()

/**
    圆角和加边框
 */
#define ViewBorderRadius_Macro(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/**
    圆角
 */
#define ViewRadius_Macro(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

/**
    view Tag
 */
#define VIEWWITHTAG_Macro(_OBJECT, _TAG)\
\
[_OBJECT viewWithTag : _TAG]

/**********************************************
        单例
 ********************************************** */
#define SharedInstanceInterfaceBuilder(ClassName) \
+ (instancetype)sharedInstance;

#define SharedInstanceBuilder(ClassName) \
+ (instancetype)sharedInstance\
{\
static dispatch_once_t onceToken;\
static ClassName* instance;\
dispatch_once(&onceToken, ^{\
instance = [[ClassName alloc] init];\
});\
return instance;\
}

#endif /* UtilsMacro_h */
