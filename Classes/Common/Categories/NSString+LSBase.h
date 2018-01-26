//
//  NSString+LSBase.h
//  LSSampleInOC
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LSBase)

/// Judging the string is not nil or empty.
///
/// Returns YES or NO.
- (BOOL)isExist;
- (BOOL)isImage;
- (BOOL)isMarkdown;

- (NSString *)firstLetter;

@end
