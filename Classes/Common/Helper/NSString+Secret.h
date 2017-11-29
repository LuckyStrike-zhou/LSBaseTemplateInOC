//
//  NSString+Secret.h
//  LSSampleInOC
//
//  Created by Apple on 2017/11/28.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Secret)

/**
    AES Base64 DES
 */

- (NSString *)md5;

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

@end
