//
//  NSObject+LSBase.m
//  LSSampleInOC
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import "NSObject+LSBase.h"

@implementation NSObject (LSBase)

- (BOOL)isEmpty {
    
    if (self == nil || [self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([self isKindOfClass:[NSString class]]) {
        if ([[(NSString*)self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""]) {
            return YES;
        }
    }
    return NO;
}

@end
