//
//  UILabel+UIShorter.h
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define LABEL   [UILabel new]
@interface UILabel (UIShorter)

+ (UILabel*)labWithText:(NSString*)text textColor:(UIColor*)color font:(UIFont*)font;

@end

NS_ASSUME_NONNULL_END
