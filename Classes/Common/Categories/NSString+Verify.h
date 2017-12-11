//
//  NSString+Helper.h
//  Sample
//
//  Created by LuckyStrike on 2017/11/15.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Verify)

- (BOOL)isPureInt;
- (BOOL)isPureFloat;

/**
 验证手机号码
 */
- (BOOL)verifyMobilePhoneNum;
/**
 验证Email
 */
- (BOOL)verifyEmail;
/**
 验证身份证号码
 */
- (BOOL)verifyIdentityCardNum;
/**
 判断字符串是否为空
 */
/**判断字符串是否为空*/
- (BOOL)isEmptyOrNull;

/**验证该字符串是否是6-16位字母和数字组合*/
- (BOOL)verifyDigitalAndLetter;

/**去掉回车和空格*/
- (NSString *)removeBlankAndEnter;

@end
