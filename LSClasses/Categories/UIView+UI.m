//
//  UIView+UI.m
//  YEXClient
//
//  Created by Apple on 2017/12/8.
//  Copyright © 2017年 LYKM. All rights reserved.
//

#import "UIView+UI.h"

@implementation UIView (UI)

- (UIView*)UI_Border:(CGFloat)width color:(UIColor*)color {
    [self.layer setBorderWidth:width];
    [self.layer setBorderColor:[color CGColor]];
    return self;
}

- (UIView*)UI_Radius:(CGFloat)radius {
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:YES];
    return self;
}

@end

