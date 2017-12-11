//
//  UIView+Base.m
//  LSSampleInOC
//
//  Created by Apple on 2017/12/11.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "UIView+Base.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AppDelegate.h"

@implementation UIView (Base)

#pragma clang diagnostic ignored "-Wobjc-designated-initializers"
- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    
    if (self = [super init]) {
        if ([self respondsToSelector:@selector(_bindViewModel)]) {
            [self _bindViewModel];
        }
        if ([self respondsToSelector:@selector(_setupViews)]) {
            [self _bindViewModel];
        }
        
    }
    return self;
}

#pragma mark -- Protocol
- (void)_bindViewModel {}
- (void)_setupViews {}
- (void)_loadNewData {}
- (void)_addReturnKeyBoard {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [tap.rac_gestureSignal subscribeNext:^(id x) {
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate.window endEditing:YES];
    }];
    [self addGestureRecognizer:tap];
}

@end

