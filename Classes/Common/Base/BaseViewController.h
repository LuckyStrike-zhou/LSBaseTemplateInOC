//
//  BaseViewController.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/16.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseViewModelProtocol;

@protocol BaseViewControllerProtocol<NSObject>

@optional

- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel;
/** 绑定 */
- (void)_bindViewModel;
/** 添加控件 */
- (void)_addSubviews;
/** 设置导航栏 */
- (void)_setupNavigation;
/** 加载数据 */
- (void)_loadNewData;

@end

@interface BaseViewController : UIViewController <BaseViewControllerProtocol>

- (void)removeNavgationLine:(BOOL)hidden;

@end

