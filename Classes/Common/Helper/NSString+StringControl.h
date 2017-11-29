//
//  NSString+Helper.h
//  Sample
//
//  Created by LuckyStrike on 2017/11/15.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringControl)
/**
 判断电话号码
 */
- (BOOL)isMobilePhoneNum;
/**
 判断邮箱
 */
- (BOOL)isEmail;
/**
 判断身份证号
 */
- (BOOL)isIdentityCardNum;
/**
 判断字符串是否为空
 */
- (BOOL)isEmpty;
/**
 md5加密
 */
- (NSString *)md5;
/**
 加码解码
 */
- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

@end
