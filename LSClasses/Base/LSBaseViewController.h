//
//  BaseViewController.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/16.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSBaseViewModel.h"

@protocol LSBaseViewModelProtocol;

@protocol LSBaseViewControllerProtocol<NSObject>

@optional

- (instancetype)initWithViewModel:(LSBaseViewModel*)viewModel;
/** 绑定 */
- (void)_bindViewModel;
/** 添加控件 */
- (void)_addSubviews;
/** 设置导航栏 */
- (void)_setupNavigation;
/** 加载数据 */
- (void)_loadNewData;
/** 管理键盘  */
- (void)_managerKeyBoard;
@end

@interface LSBaseViewController : UIViewController ///<LSBaseViewControllerProtocol>

#pragma makr -- 生命周期 预调用已写好，继承实现即可
/**
 *  绑定
 */
- (void)bindViewModel;
/**
 *  添加控件
 */
- (void)setupSubviews;
/**
 *  设置导航栏
 */
- (void)setupNavigation;
/**
 *  加载数据
 */
- (void)loadNewData:(id)para;
/**
 *  初始化
 */
- (instancetype)initWithViewModel:(id)viewModel;

#pragma mark -- 功能类
/**
 *  导航栏黑线
 */
- (void)removeNavgationLine:(BOOL)hidden;
- (void)blankNavBackButton;
/**
 *  吐司提示
 */
- (void)showToastMessage:(NSString*)message duration:(NSTimeInterval)duration;
/**
 *  一般等候指示器
 */
- (void)startLoading;
- (void)stopLoading;
/**
 *  自定义指示器,用于继承
 *  @para 参数
 */
- (void)startCustomLoading:(id)para;
- (void)stopCustomLoading;


@end

