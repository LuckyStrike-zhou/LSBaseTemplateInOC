//
//  UIButton+UIShorter.h
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define BUTTON   [UIButton new]

@interface UIButton (UIShorter)

- (void)setNormalTitle:(NSString* __nullable)title titleColor:(UIColor*__nullable)tColor img:(UIImage*__nullable)img;
- (void)setHignlightTitle:(NSString*__nullable)title titleColor:(UIColor*__nullable)tColor img:(UIImage*__nullable)img;

- (void)addTarget:(id)target action:(SEL)action;


+ (UIButton*)moreBtn;

@end

NS_ASSUME_NONNULL_END
