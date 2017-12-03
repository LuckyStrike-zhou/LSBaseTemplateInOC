//
//  LSHelper.m
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/22.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "LSHelper.h"

@implementation LSHelper

//判断是否为整形：
+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//判断是否为浮点形：
+ (BOOL)isPureFloat:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

+ (NSString *)paramentStringFromDic:(NSDictionary *)dic {
    NSMutableString *paramsString = [NSMutableString stringWithString:@"?"];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [paramsString appendFormat:@"%@=%@&",key,obj];
    }];
    [paramsString deleteCharactersInRange:NSMakeRange(paramsString.length-1, 1)];
    return paramsString;
}

+ (NSString *)mimeTypeByGuessingFromData:(NSData *)data {

    char bytes[12] = {0};
    [data getBytes:&bytes length:12];
    
    const char bmp[2] = {'B', 'M'};
    const char gif[3] = {'G', 'I', 'F'};
    // const char swf[3] = {'F', 'W', 'S'};
    // const char swc[3] = {'C', 'W', 'S'};
    const char jpg[3] = {0xff, 0xd8, 0xff};
    const char psd[4] = {'8', 'B', 'P', 'S'};
    const char iff[4] = {'F', 'O', 'R', 'M'};
    const char webp[4] = {'R', 'I', 'F', 'F'};
    const char ico[4] = {0x00, 0x00, 0x01, 0x00};
    const char tif_ii[4] = {'I','I', 0x2A, 0x00};
    const char tif_mm[4] = {'M','M', 0x00, 0x2A};
    const char png[8] = {0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a};
    const char jp2[12] = {0x00, 0x00, 0x00, 0x0c, 0x6a, 0x50, 0x20, 0x20, 0x0d, 0x0a, 0x87, 0x0a};
    
    
    if (!memcmp(bytes, bmp, 2)) {
        return @"bmp";
    } else if (!memcmp(bytes, gif, 3)) {
        return @"gif";
    } else if (!memcmp(bytes, jpg, 3)) {
        return @"jpeg";
    } else if (!memcmp(bytes, psd, 4)) {
        return @"psd";
    } else if (!memcmp(bytes, iff, 4)) {
        return @"iff";
    } else if (!memcmp(bytes, webp, 4)) {
        return @"webp";
    } else if (!memcmp(bytes, ico, 4)) {
        return @"icon";
    } else if (!memcmp(bytes, tif_ii, 4) || !memcmp(bytes, tif_mm, 4)) {
        return @"tiff";
    } else if (!memcmp(bytes, png, 8)) {
        return @"png";
    } else if (!memcmp(bytes, jp2, 12)) {
        return @"jp2";
    }
    
    return @"png"; // default type
    
}

@end
