//
//  NSDate+FastTransform.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/23.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FastTransform)

//字符串转换为日期 yyyy-MM-dd
+(NSDate*) convertDateFromString:(NSString*)uiDate;
//unix时间转换为yyyy-mm-dd字符串
+(NSString *)convertUnixDateToString:(double)millionsec;
//unix时间转换为yyyy-mm-dd HH:mm:ss字符串
+(NSString *)convertUnixDateTimeToString:(double)millionsec;

@end
