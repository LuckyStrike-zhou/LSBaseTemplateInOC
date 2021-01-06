//
//  UIButton+UIShorter.m
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import "UIButton+UIShorter.h"

@implementation UIButton (UIShorter)

- (void)setNormalTitle:(NSString*__nullable)title titleColor:(UIColor*__nullable)tColor img:(UIImage *__nullable)img{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:tColor forState:UIControlStateNormal];
    [self setImage:img forState:UIControlStateNormal];
}
- (void)setHignlightTitle:(NSString*__nullable)title titleColor:(UIColor*__nullable)tColor img:(UIImage*__nullable)img{
    [self setTitle:title forState:UIControlStateHighlighted];
    [self setTitleColor:tColor forState:UIControlStateHighlighted];
    [self setImage:img forState:UIControlStateHighlighted];
}

- (void)addTarget:(id)target action:(SEL)action{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}


+ (UIButton*)moreBtn{
    UIButton *btn = BUTTON;
    [btn setNormalTitle:@"更多 >" titleColor:[UIColor whiteColor] img:nil];
    btn.backgroundColor = UIColorFromRGB(0x949cdf);
    [btn setRadius:5.];
    btn.titleLabel.font = FONT2(12);
    return btn;
}

@end
