//
//  Tools.h
//  Template
//
//  Created by Liujia on 2020/12/30.
//  Copyright © 2020 7m. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tools : NSObject

+ (BOOL)checkLogined;

+ (void)hudWithText:(NSString*)text on:(UIView*)view;
+ (void)hudWithProgressAndText:(NSString*)text on:(UIView*)view;

@end

NS_ASSUME_NONNULL_END
