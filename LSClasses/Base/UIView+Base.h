//
//  UIView+Base.h
//  LSSampleInOC
//
//  Created by Apple on 2017/12/11.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseViewModelProtocol;

@protocol BaseViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel;
/** 绑定 */
- (void)_bindViewModel;
/** 添加控件 */
- (void)_setupViews;
/** 加载数据 */
- (void)_loadNewData;
/** 取消键盘  */
- (void)_addReturnKeyBoard;

@end

@interface UIView (Base)/** <BaseViewProtocol>  */

/**
*  VM初始化
*/
- (instancetype)initWithViewModel:(id)viewModel;
/**
 *  绑定
 */
- (void)bindViewModel;


@end
