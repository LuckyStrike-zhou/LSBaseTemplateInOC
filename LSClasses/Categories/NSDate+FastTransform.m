//
//  NSDate+FastTransform.m
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/23.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "NSDate+FastTransform.h"

@implementation NSDate (FastTransform)

//yyyy-MM-dd
+(NSDate*) convertDateFromString:(NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}

+(NSString *)convertUnixDateTimeToString:(double)millionsec{
    NSDate *datenow = [NSDate dateWithTimeIntervalSince1970:millionsec/1000.0];
    //    NSLog(@"%@", localeDate);
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeSp=[dateformatter stringFromDate:datenow];
    
    return timeSp;
}
+(NSString *)convertUnixDateToString:(double)millionsec{
    NSDate *datenow = [NSDate dateWithTimeIntervalSince1970:millionsec/1000.0];
    //    NSLog(@"%@", localeDate);
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    NSString *timeSp=[dateformatter stringFromDate:datenow];
    
    return timeSp;
}

@end
