//
//  LSBaseLoginViewModel.h
//  LSSampleInOC
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import "LSBaseViewModel.h"

@interface LSBaseLoginViewModel : LSBaseViewModel

/** 电话号码或者用户名  */
@property (nonatomic,copy) NSString *accountNum;
/** 密码  */
@property (nonatomic,copy) NSString *password;
/** 验证码，用于注册或者敏感操作  */
@property (nonatomic,copy) NSString *verifyCode;

/** 按钮能否点击  */
@property (nonatomic, readonly, strong) RACSignal *validLoginSignal;
/** 登录按钮点击执行的命令  */
@property (nonatomic, readonly, strong) RACCommand *loginCommand;

@end
