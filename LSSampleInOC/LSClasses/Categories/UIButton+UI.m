//
//  UIButton+UI.m
//  YEXClient
//
//  Created by Apple on 2017/12/8.
//  Copyright © 2017年 LYKM. All rights reserved.
//

#import "UIButton+UI.h"

@implementation UIButton (UI)

- (UIButton*)UI_CountDown:(int)timeOut {
    
    self.enabled = NO;
    
    __block int timeOutInSecond = timeOut;
    
    dispatch_source_t countDownTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,dispatch_get_main_queue());
    dispatch_source_set_timer(countDownTimer,dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(countDownTimer, ^{
        if(timeOutInSecond == 1){ //倒计时结束，关闭
            dispatch_source_cancel(countDownTimer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:@"重新发送" forState:UIControlStateNormal];
                self.enabled = YES;
            });
        }else{
            NSString *remainTime = [NSString stringWithFormat:@"%.2d秒重新获取",timeOutInSecond];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"%@",remainTime);
                [self setTitle:remainTime forState:UIControlStateNormal];
            });
            timeOutInSecond--;
        }
    });
    dispatch_resume(countDownTimer);
    return self;
}

@end
