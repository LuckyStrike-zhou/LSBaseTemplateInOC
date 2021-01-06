//
//  UILabel+UIShorter.m
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import "UILabel+UIShorter.h"

@implementation UILabel (UIShorter)
+ (UILabel*)labWithText:(NSString*)text textColor:(UIColor*)color font:(UIFont*)font{
    UILabel *lab = LABEL;
    lab.font = font;
    lab.textColor = color;
    lab.numberOfLines = 0;
    return lab;
}

@end
