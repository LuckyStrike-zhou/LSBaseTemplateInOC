//
//  LSHelper.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/22.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LSHelper : NSObject



+ (NSString *)paramentStringFromDic:(NSDictionary *)dic;

//判断图片格式
+(NSString *)mimeTypeByGuessingFromData:(NSData *)data;
/**颜色转图片*/
+ (UIImage *)createImageWithColor:(UIColor *)color;
/**判断是否是第一次启动*/
+ (BOOL)isFirstLaunching;



+(NSString *)getErrorMessagewWthCode:(NSError *)error;

+(NSError *)getErrorWthCode:(int)code;

+(NSString *)encodedString:(NSString *)string;

+(NSString *)dateFormatterToStr:(double)msec;

+(NSString *)dateFormatterToYRStr:(double)msec;

+(CGRect)labelSize:(UILabel *)label andRectWithSize:(CGSize)size;

+(BOOL)isPureInt:(NSString*)string;
+(BOOL)isPureFloat:(NSString*)string;
+(NSString *)stringTrim:(NSString *)string;

//字符串转换为日期
+(NSDate*) convertDateFromString:(NSString*)uiDate;
//unix时间转换为yyyy-mm-dd字符串
+(NSString *)convertUnixDateToString:(double)millionsec;
//unix时间转换为yyyy-mm-dd HH:mm:ss字符串
+(NSString *)convertUnixDateTimeToString:(double)millionsec;

+ (NSString *)uuid;
+ (NSString *)urlEncodeWithUTF8:(NSString *)sourceString;
+ (NSString *)urlDecodeWithUTF8:(NSString *)sourceString;


+ (BOOL)isValidateEmail:(NSString *)email;

+ (NSString *)filtHtmlTag:(NSString *)string;
+ (NSString *)filterString:(NSString *)string;

+ (NSString *)currentDateOfToday;
+ (NSString *)getDateTimeString:(NSDate *)dateTime;
+ (NSString *)getTimeTextFromInterval:(NSTimeInterval)interval;

+ (NSString *)filterFullWidthSpace:(NSString *)text;

+ (BOOL)isEmpty:(id)object;
+ (NSString *)trimString:(NSString *)string;

+ (NSString *)jsonStringFromObject:(id)object;

+ (NSString *)dictToCommonString:(NSDictionary *)dict;

+ (NSString *)md5Strings:(NSArray *)strArray;

+ (NSString *)paramStringFromDict:(NSDictionary *)dict;
+(NSString*)changeTimeStamp:(NSString*)timeString;

+(NSArray *)getIpAddresses;

+ (NSString*)deviceString;


@end
