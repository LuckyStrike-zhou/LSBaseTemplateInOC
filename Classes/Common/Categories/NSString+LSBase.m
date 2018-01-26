//
//  NSString+LSBase.m
//  LSSampleInOC
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import "NSString+LSBase.h"

@implementation NSString (LSBase)




- (BOOL)isExist {
    return self && ![self isEqualToString:@""];
}

- (BOOL)isImage {
    if (!self.isExist) return NO;
    
    NSArray *imageExtensions = @[ @".png", @".gif", @".jpg", @".jpeg" ];
    for (NSString *extension in imageExtensions) {
        if ([self.lowercaseString hasSuffix:extension]) return YES;
    }
    
    return NO;
}

- (BOOL)isMarkdown {
    if (!self.isExist) return NO;
    
    NSArray *markdownExtensions = @[ @".md", @".mkdn", @".mdwn", @".mdown", @".markdown", @".mkd", @".mkdown", @".ron" ];
    for (NSString *extension in markdownExtensions) {
        if ([self.lowercaseString hasSuffix:extension]) return YES;
    }
    
    return NO;
}

- (NSString *)firstLetter {
    return [[self substringToIndex:1] uppercaseString];
}


@end
