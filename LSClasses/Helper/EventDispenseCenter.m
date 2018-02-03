//
//  EventDispenseCenter.m
//  YEXMaster
//
//  Created by Apple on 2017/12/8.
//  Copyright © 2017年 LYKM. All rights reserved.
//

#import "EventDispenseCenter.h"
#import "MBProgressHUD+Show.h"

@implementation EventDispenseCenter


+ (void)handleNetworkStatusWithCode:(NSInteger)code additional:(id)additional {
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
                [self handleNetworkStatusWithCode:resp.statusCode additional:description];
            }else{
                [self handleNetWorkConnectError];
            }
        }
            break;
    }
}

+ (void)showError:(NSString*)errInfo {
    
    
}

+ (void)handleNetWorkConnectError
{
    
}


@end
