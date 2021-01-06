//
//  AppDelegate+AppService.h
//  LSSampleInOC
//
//  Created by Apple on 2017/12/11.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "AppDelegate.h"

#pragma Mark -- 自定义代码在此实现,在AppDelegate调用

@interface AppDelegate (AppService)
/**
 *  注册引导页
 */
- (void)registerGuidePage;

/**
 *  监听网络状态
 */
- (void)registerNetworkStatusListener;

/**
 *  用户设备信息
 */
- (void)registerInfoAboutUserAndDevice;

/**
 *  注册分享SDK
 */
- (void)registerShare;

/**
 *  注册推送
 */
- (void)registerAPNS;

/**
 *  检查更新
 */
- (void)checkAppUpDataWithshowOption:(BOOL)showOption;
/**
 *  系统配置
 */
- (void)systemConfigration;

@end
