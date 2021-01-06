//
//  UIView+UI.h
//  YEXClient
//
//  Created by Apple on 2017/12/8.
//  Copyright © 2017年 LYKM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UI)

/** 边框  */
- (UIView*)UI_Border:(CGFloat)width color:(UIColor*)color;
/** 圆角  */
- (UIView*)UI_Radius:(CGFloat)radius;

@end

