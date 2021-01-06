//
//  MBProgressHUD+Show.h
//  FastApp
//
//  Created by wxb on 16/3/7.
//  Copyright © 2016年 wannengxiaoge. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (Show)

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
+ (void)showProgress:(float)fractionCompleted message:(NSString *)message mode:(MBProgressHUDMode)mode;

// 提示后响应某个动作
+ (void)showMessage:(NSString *)message completion:(void (^)(void))completion;


@end
