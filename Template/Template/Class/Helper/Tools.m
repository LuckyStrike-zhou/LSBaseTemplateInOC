//
//  Tools.m
//  Template
//
//  Created by Liujia on 2020/12/30.
//  Copyright © 2020 7m. All rights reserved.
//

#import "Tools.h"

@implementation Tools

+ (BOOL)checkLogined{
    return NO;
}

+ (void)hudWithText:(NSString*)text on:(UIView*)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = text;
    hud.mode = MBProgressHUDModeText;
    [hud hideAnimated:YES afterDelay:2];
}

+ (void)hudWithProgressAndText:(NSString*)text on:(UIView*)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.1f];
    hud.mode = MBProgressHUDModeIndeterminate;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        hud.label.text = text;
        hud.mode = MBProgressHUDModeText;
    });
    [hud hideAnimated:YES afterDelay:3];
}

@end
