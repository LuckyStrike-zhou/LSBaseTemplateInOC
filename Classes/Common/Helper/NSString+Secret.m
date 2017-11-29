//
//  NSString+Secret.m
//  LSSampleInOC
//
//  Created by Apple on 2017/11/28.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "NSString+Secret.h"
#import <CommonCrypto/CommonDigest.h>
#import "AppMacro.h"
#import <UIKit/UIKit.h>

@implementation NSString (Secret)

- (NSString *)md5{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)URLEncodedString
{
    /*
     CFURLCreateStringByAddingPercentEscapes函数是Core Foundation框架提供的C函数，可以把内容转换成URL【资源定位符】编码，
     */
    if (IOS_9) {
        NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
        NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
        NSString *encodedUrl = [self stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
        return encodedUrl;
    }else{
        NSString *result = ( NSString *)
        CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                  (CFStringRef)self,
                                                                  NULL,//指定了将本身为非法的URL字符不进行编码的字符集合
                                                                  CFSTR("!*();+$,%#[] "),//将本身为合法的URL字符需要进行编码的字符集合
                                                                  kCFStringEncodingUTF8));
        return result;
    }
}

- (NSString*)URLDecodedString
{
    //    CFURLCreateStringByReplacingPercentEscapesUsingEncoding与CFURLCreateStringByAddingPercentEscapes相反，是进行URL解码
    if (IOS_9) {
        return [self stringByRemovingPercentEncoding];
    }else{
        NSString *result = ( NSString *)
        CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                  (CFStringRef)self,
                                                                                  CFSTR(""),//指定不进行解码的字符集
                                                                                  kCFStringEncodingUTF8));
        return result;
    }
}

@end
