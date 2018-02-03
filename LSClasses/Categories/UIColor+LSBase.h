//
//  UIColor+LSBase.h
//  LSSampleInOC
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LSBase)

/// Generating a new image by the color.
///
/// Returns a new image.
- (UIImage *)color2Image;
- (UIImage *)color2ImageSized:(CGSize)size;

@end
