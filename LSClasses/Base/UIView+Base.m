//
//  UIView+Base.m
//  LSSampleInOC
//
//  Created by Apple on 2017/12/11.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "UIView+Base.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation UIView (Base)

#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithViewModel:(id)viewModel {
    
    if (self = [super init]) {
        if ([self respondsToSelector:@selector(bindViewModel)]) {
            [self bindViewModel];
        }
    }
    return self;
}

- (void)bindViewModel {}

@end

