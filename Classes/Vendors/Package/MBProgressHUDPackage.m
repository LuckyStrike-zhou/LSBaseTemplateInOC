//
//  MBProgressHUDPackage.m
//  LSSampleInOC
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "MBProgressHUDPackage.h"
#import "AppMacro.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,MBProgressTipType)
{
    MBProgressTipSuccess,
    MBProgressTipError
};

// HTTP返回码
typedef NS_ENUM(NSInteger,HttpStatusCode)
{
    DataParseErrorCode=-1,               //数据解析错误
    HttpStatusReturnNullCode=0,          //服务返回为空
    
    HttpStatusSuccessCode=200,           //请求成功
    HttpStatusNotModifyCode=304,         //资源未修改
    HttpStatusUnAuthoriztionCode=401,    //请求未授权
    HttpStatusForbiddenCode=403,         //禁止访问
    HttpStatusNotFoundCode=404,          //资源不存在
    HttpStatusReqMethodErrorCode=405,    //请求方法错误。例如要求用POST请求，用了GET
    HttpStatusServerErrorCode=500,       //服务器内部错误
    HttpStatusFalseCode=1000,            //服务器处理失败。用于有或无的状态
    HttpStatusTrueCode=1001,             //服务器处理成功
    HttpStatusMissingArgsCode=1002,      //请求缺少参数，或参数不符合要求
    HttpStatusVerCodeErrorCode=1003,     //验证码错误
    HttpStatusMissingSignCode=1004,      //缺少签名或签名字段错误
    HttpStatusSignErrorCode=1005,        //签名错误
    HttpStatusUploadErrorCode=1006,       //上传文件失败
};

@implementation MBProgressHUDPackage

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
        MBProgressHUD *hub = [[MBProgressHUD alloc] initWithView:window];
        hub.mode = MBProgressHUDModeIndeterminate;
        
        hub.bezelView.color = RGB(200, 200, 200);
        hub.detailsLabel.text = message;
        hub.detailsLabel.textColor = CC_BLACK;
        hub.removeFromSuperViewOnHide = YES;
        
        [window addSubview:hub];
        [hub showAnimated:YES];
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
            mbHud.bezelView.color = RGB(200, 200, 200);
            mbHud.label.textColor = CC_BLACK;
        }
        if (fractionCompleted == 1.0f) {
            [mbHud hideAnimated:YES];
        }else{
            mbHud.progress = fractionCompleted;
            mbHud.label.text = message;
        }
    });
}

// 提示后响应某个动作
+ (void)showMessage:(NSString *)message completion:(void (^)(void))completion
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hud.label.text = message;
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.color = RGB(200, 200, 200);
    hud.label.textColor = CC_BLACK;
    [UIView animateWithDuration:0.8 animations:^{
        hud.alpha = 0;
    } completion:^(BOOL finished) {
        [hud removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
}

+ (void)handleErrorWithCode:(NSInteger)code additional:(id)additional
{
    switch (code) {
        case HttpStatusReturnNullCode:
            [self showError:@"数据返回为空"];
            break;
        case DataParseErrorCode:
            [self showError:@"数据解析失败"];
            break;
        case HttpStatusNotModifyCode:
            [self showError:@"请求资源未更改"];
            break;
        case HttpStatusUnAuthoriztionCode:
            [self showError:@"请求未授权"];
            break;
        case HttpStatusForbiddenCode:
            [self showError:@"请求被禁止访问"];
            break;
        case HttpStatusNotFoundCode:
            [self showError:@"资源不存在"];
            break;
        case HttpStatusReqMethodErrorCode:
            [self showError:@"请求方法错误"];
            break;
        case HttpStatusServerErrorCode:
            [self showError:@"请求出错，请稍后尝试"];
            break;
        case HttpStatusMissingArgsCode:
            [self showError:@"缺少参数或参数不符合要求"];
            break;
        case HttpStatusMissingSignCode:
            [self showError:@"缺少签名或签名无效"];
            break;
        case HttpStatusSignErrorCode:
            [self showError:@"加密验证错误"];
            break;
        default:
        {
            if ([additional isKindOfClass:[NSString class]]) {
                [self showError:additional];
            }else if ([additional isKindOfClass:[NSHTTPURLResponse class]]) {
                NSHTTPURLResponse *resp = (NSHTTPURLResponse *)additional;
                NSString *description = [NSHTTPURLResponse localizedStringForStatusCode:resp.statusCode];
                [self handleErrorWithCode:resp.statusCode additional:description];
            }else{
                [self handleNetWorkConnectError];
            }
        }
            break;
    }
}


+ (void)hideHUDForView:(UIView *)view
{
    if (!view) view = [[[UIApplication sharedApplication].keyWindow subviews] lastObject];
    if (![self hideHUDForView:view animated:YES] && [view isKindOfClass:[MBProgressHUD class]]) {
        [NSThread sleepForTimeInterval:0.4];
        [view removeFromSuperview];
    }
}

+ (void)handleNetWorkConnectError
{
    [MBProgressHUD ];
    if ([GlobalCache sharedInstance].intenetReachable) {
        [[NSNotificationCenter defaultCenter] postNotificationName:ServerRequestFailure
                                                            object:@(RequestFailedError)];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:ServerRequestFailure
                                                            object:@(NoConnectionError)];
    }
}

#pragma mark 私有方法：显示信息，然后自动隐藏
+ (void)show:(NSString *)text  type:(MBProgressTipType)type
{
    if (![StringTools isEmpty:text]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:NO];
        hud.mode = MBProgressHUDModeCustomView;
        switch (type) {
            case MBProgressTipSuccess:
                hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageWithNamed:@"Checkmark-success"]];
                break;
            case MBProgressTipError:
                hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageWithNamed:@"Checkmark-error"]];
                break;
        }
        hud.color = GRAYCOLOR(200);
        hud.detailsLabelText = text;
        hud.detailsLabelColor = FSBlackColor;
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
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
