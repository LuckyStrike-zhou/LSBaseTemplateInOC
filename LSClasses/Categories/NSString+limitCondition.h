//
//  NSString+limitCondition.h
//  testsome
//
//  Created by sgp on 14-9-11.
//  Copyright (c) 2014年 zmzc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (limitCondition)
- (BOOL)isUserName;
-(BOOL)isNickname;
- (BOOL)isPassword;
- (BOOL)isEmail;
- (BOOL)isUrl;
-(BOOL)isMobile;
-(BOOL)isPaperId;

//13位时间戳
+(NSString*)changeTimeStamp:(NSString*)timeString;
+(NSString*)changeTimeStamp:(NSString*)timeString format:(NSString *) formatStr;

//url 中带有中文的转换成合法的url
+(NSString*)changeChineseUrl:(NSString*)query;

//字符串替换
+(NSString*)stringByReplacingWithTheString:(NSString*)string_ withWhichStringReplaceIt:(NSString*)replaceString_ withFromWhichLocation:(NSUInteger)location_ withReplaceLength:(NSUInteger)length_;

@end
