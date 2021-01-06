//
//  UIView+UIShorter.m
//  Template
//
//  Created by Liujia on 2020/12/30.
//  Copyright © 2020 7m. All rights reserved.
//

#import "UIView+UIShorter.h"

@implementation UIView (UIShorter)

- (void)setRadius:(CGFloat)radius{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = radius;
}

@end
