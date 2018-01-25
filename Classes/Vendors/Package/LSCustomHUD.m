//
//  LSCustomHUD.m
//  LSSampleInOC
//
//  Created by Apple on 2018/1/24.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import "LSCustomHUD.h"
#import <MBProgressHUD/MBProgressHUD.h>

typedef NS_ENUM(NSInteger,MBProgressTipType)
{
    MBProgressTipSuccess,
    MBProgressTipError
};

@implementation LSCustomHUD
//错误提示
+ (void)showError:(NSString *)error {
    [self show:error type:MBProgressTipError];
}
//正确提示
+ (void)showSuccess:(NSString *)success {
    [self show:success type:MBProgressTipSuccess];
}

//加载提示。默认菊花方式
+ (void)startLoadding {
    [self loaddingWithMessage:@""];
}

+ (void)stopLoadding {
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
}

+ (void)loaddingWithMessage:(NSString *)message {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD HUDForView:[UIApplication sharedApplication].keyWindow];
        if (!hud) {
            hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        }

        hud.mode = MBProgressHUDModeIndeterminate;
        hud.detailsLabel.text = message;
        hud.removeFromSuperViewOnHide = YES;
        
        [hud showAnimated:YES];
    });
}

//进度条显示。默认圆圈
+ (void)showProgress:(float)fractionCompleted {
    [self showProgress:fractionCompleted message:nil];
}

+ (void)showProgress:(float)fractionCompleted message:(NSString *)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *mbHud = [MBProgressHUD HUDForView:[UIApplication sharedApplication].keyWindow];
        if (!mbHud) {
            mbHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
            mbHud.mode = MBProgressHUDModeAnnularDeterminate;
            //            mbHud.color = GRAYCOLOR(200);
            //            mbHud.labelColor = FSBlackColor;
        }
        if (fractionCompleted == 1.0f) {
            [mbHud hideAnimated:YES];
        }else{
            mbHud.progress = fractionCompleted;
            mbHud.label.text = message;
        }
    });
}

#pragma mark 私有方法：显示信息，然后自动隐藏
+ (void)show:(NSString *)text  type:(MBProgressTipType)type
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:NO];
    hud.mode = MBProgressHUDModeCustomView;
    switch (type) {
        case MBProgressTipSuccess:
            
            UIImage *image = BUNDLE_PATH(<#NAME#>, <#EXT#>);
            
            hud.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"Checkmark-success"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            break;
        case MBProgressTipError:
            hud.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"Checkmark-error"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            break;
    }
    //        hud.color = GRAYCOLOR(200);
    hud.detailsLabel.text = text;
    //        hud.detailsLabelColor = FSBlackColor;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2.0];
}

@end
