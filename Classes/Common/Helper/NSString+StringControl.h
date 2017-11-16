//
//  NSString+Helper.h
//  Sample
//
//  Created by LuckyStrike on 2017/11/15.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringControl)

- (BOOL)isMobilePhoneNum;

- (BOOL)isEmail;

- (BOOL)isPaperId;

- (NSString *)md5;

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

@end
