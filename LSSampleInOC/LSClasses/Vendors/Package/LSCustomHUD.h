//
//  LSCustomHUD.h
//  LSSampleInOC
//
//  Created by Apple on 2018/1/24.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSCustomHUD : NSObject

//操作提示
+ (void)showError:(NSString *)error;
+ (void)showSuccess:(NSString *)success;

//菊花加载
+ (void)startLoadding;
+ (void)stopLoadding;
+ (void)loaddingWithMessage:(NSString *)message;

//进度条显示。默认圆圈
+ (void)showProgress:(float)fractionCompleted;
+ (void)showProgress:(float)fractionCompleted message:(NSString *)message;

@end
