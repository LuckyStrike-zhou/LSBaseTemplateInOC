//
//  ZTTabBar.h
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZTTabBar;

@protocol CustomTabBarDelegate <UITabBarDelegate>

@optional
// 当点击自定义tabbar的时候
- (void)tabBarDidClickPlusButton:(ZTTabBar *)tabBar;

@end

typedef void(^CustomTabBarBlock)(NSMutableDictionary* dict);

@interface ZTTabBar : UITabBar

@property (nonatomic, strong) UIButton *plusButton;

@property (nonatomic, weak) id<CustomTabBarDelegate> myDelegate;

@end

NS_ASSUME_NONNULL_END
