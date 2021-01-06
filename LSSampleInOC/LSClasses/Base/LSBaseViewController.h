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

@interface LSBaseViewController : UIViewController <LSBaseViewControllerProtocol>

- (void)removeNavgationLine:(BOOL)hidden;

@end

