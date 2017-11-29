//
//  LSHelper.h
//  LSSampleInOC
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSHelper : NSObject

+(BOOL)isPureInt:(NSString*)string;
+(BOOL)isPureFloat:(NSString*)string;
//判断图片格式
+(NSString *)mimeTypeByGuessingFromData:(NSData *)data;

@end
