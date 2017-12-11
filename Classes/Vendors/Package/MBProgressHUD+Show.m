//
//  MBProgressHUD+Show.m
//  FastApp
//
//  Created by wxb on 16/3/7.
//  Copyright © 2016年 wannengxiaoge. All rights reserved.
//

#import "MBProgressHUD+Show.h"


typedef NS_ENUM(NSInteger,MBProgressTipType)
{
    MBProgressTipSuccess,
    MBProgressTipError
};



@implementation MBProgressHUD (Show)

//错误提示
+ (void)showError:(NSString *)error
{
    [self show:error type:MBProgressTipError];
}
//正确提示
+ (void)showSuccess:(NSString *)success
{
    [self show:success type:MBProgressTipSuccess];
}

//加载提示。默认菊花方式
+ (void)startLoadding
{
    [self loaddingWithMessage:@""];
}
+ (void)stopLoadding
{
    [self hideHUDForView:nil];
}
+ (void)loaddingWithMessage:(NSString *)message
{
    UIView *loadingView = [[[UIApplication sharedApplication].keyWindow subviews] lastObject];
    if (![loadingView isKindOfClass:[MBProgressHUD class]]) {
        UIWindow * window = [UIApplication sharedApplication].keyWindow;
        MBProgressHUD *mbHud = [[MBProgressHUD alloc] initWithWindow:window];
        mbHud.mode = MBProgressHUDModeIndeterminate;
//        mbHud.activityIndicatorColor = FSBlackColor;
        
//        mbHud.color = GRAYCOLOR(200);
        mbHud.detailsLabelText = message;
//        mbHud.detailsLabelColor = FSBlackColor;
        mbHud.removeFromSuperViewOnHide = YES;
        
        [window addSubview:mbHud];
        [mbHud show:YES];
    }
}

//进度条显示。默认圆圈
+ (void)showProgress:(float)fractionCompleted
{
    [self showProgress:fractionCompleted message:nil];
}

+ (void)showProgress:(float)fractionCompleted message:(NSString *)message
{
    [self showProgress:fractionCompleted message:message mode:MBProgressHUDModeAnnularDeterminate];
}

+ (void)showProgress:(float)fractionCompleted message:(NSString *)message mode:(MBProgressHUDMode)mode
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *mbHud = [MBProgressHUD HUDForView:[UIApplication sharedApplication].keyWindow];
        if (!mbHud) {
            mbHud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
            mbHud.mode = mode;
//            mbHud.color = GRAYCOLOR(200);
//            mbHud.labelColor = FSBlackColor;
        }
        if (fractionCompleted == 1.0f) {
            [mbHud hide:YES];
        }else{
            mbHud.progress = fractionCompleted;
            mbHud.labelText = message;
        }
    });
}

// 提示后响应某个动作
+ (void)showMessage:(NSString *)message completion:(void (^)(void))completion
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.labelText = message;
    hud.mode = MBProgressHUDModeText;
//    hud.color = GRAYCOLOR(200);
//    hud.labelColor = FSBlackColor;
    [UIView animateWithDuration:0.8 animations:^{
        hud.alpha = 0;
    } completion:^(BOOL finished) {
        [hud removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
}




+ (void)hideHUDForView:(UIView *)view
{
    if (!view) view = [[[UIApplication sharedApplication].keyWindow subviews] lastObject];
    if (![self hideHUDForView:view animated:YES] && [view isKindOfClass:[MBProgressHUD class]]) {
        [NSThread sleepForTimeInterval:0.4];
        [view removeFromSuperview];
    }
}

#pragma mark 私有方法：显示信息，然后自动隐藏
+ (void)show:(NSString *)text  type:(MBProgressTipType)type
{
//    if (![StringTools isEmpty:text]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:NO];
        hud.mode = MBProgressHUDModeCustomView;
        switch (type) {
            case MBProgressTipSuccess:
                
                hud.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"Checkmark-success"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                break;
            case MBProgressTipError:
                hud.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"Checkmark-error"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
                break;
        }
//        hud.color = GRAYCOLOR(200);
        hud.detailsLabelText = text;
//        hud.detailsLabelColor = FSBlackColor;
        hud.removeFromSuperViewOnHide = YES;
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            sleep(1.0);
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.3 animations:^{
                    hud.transform = CGAffineTransformMakeScale(0.8, 0.8);
                } completion:^(BOOL finished) {
                    hud.minShowTime = 1.7;
                    [hud hide:YES];
                }];
            });
        });
//    }
}

@end

