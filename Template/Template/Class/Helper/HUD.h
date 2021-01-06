//
//  HUD.h
//  StockApp
//
//  Created by Liujia on 2020/12/24.
//  Copyright © 2020 7m. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HUD : NSObject

+ (void)hudWithText:(NSString*)text on:(UIView*)view;
+ (void)hudWithProgressAndText:(NSString*)text on:(UIView*)view;
@end

NS_ASSUME_NONNULL_END
