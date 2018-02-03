//
//  LSBaseViewModel.h
//  LSSampleInOC
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

/** 原则:VM不允许引用UIKit库，避免与View代码耦合，并且私有Model(其他VM)
 用法:数据的下载，刷新，分发，转化,触发事件
 */

@protocol LSBaseViewModelProtocol<NSObject>
@optional
@end

@protocol LSBaseViewModelServices;

@interface LSBaseViewModel : NSObject

#pragma mark -- 生命周期
/** Returns a new view model  */
- (instancetype)initWithServices:(id<LSBaseViewModelServices>)services params:(NSDictionary *)params;
/** 初始化  */
- (instancetype)initWithOriginalData:(id)originalData;

/// An additional method, in which you can initialize data, RACCommand etc.
///
/// This method will be execute after the execution of `-initWithParams:` method. But
/// the premise is that you need to inherit `BaseViewModel`.
- (void)initialize;
/** 工厂方法  */
+ (LSBaseViewModel*)viewModel;


/** The `services` parameter in `-initWithServices:params:` method.  */
@property (nonatomic, readonly, strong) id<LSBaseViewModelServices> services;

@property (nonatomic, readonly, copy) NSDictionary *params;

#pragma mark -- RAC集合

/** 错误集合  */
@property (nonatomic, strong, readonly) RACSubject *fetchDataErrors;
/** 远端请求数据命令  */
@property (nonatomic, strong, readonly) RACCommand *requestRemoteDataCommand;
/** 远端上传数据命令  */
@property (nonatomic, strong, readonly) RACCommand *uploadRemoteDataCommand;
/** 本地拉取数据命令  */
@property (nonatomic, strong, readonly) RACCommand *fetchLocalDataCommand;
/** 本地保存数据命令  */
@property (nonatomic, strong, readonly) RACCommand *saveLocalDataCommand;
/// will disappear signal
@property (nonatomic, strong, readonly) RACSubject *willDisappearSignal;
/** 信息传递  */
//@property (nonatomic,strong) RACSubject *infoUpdate;
/** 统一多处触发的信号  */
//@property (nonatomic,strong) RACSubject *clickSubject;


#pragma mark -- 设置

/// navItem.title
@property (nonatomic, readwrite, copy) NSString *title;
/// 返回按钮的title，default is nil 。
/// 如果设置了该值，那么当Push到一个新的控制器,则导航栏左侧返回按钮的title为backTitle
@property (nonatomic, readwrite, copy) NSString *backTitle;

/// The callback block. 当Push/Present时，通过block反向传值
@property (nonatomic, readwrite, copy) VoidBlock_id callback;

/** should fetch local data when viewModel init  . default is YES */
@property (nonatomic, readwrite, assign) BOOL shouldFetchLocalDataOnViewModelInitialize;
/** should request data when viewController videwDidLoad . default is YES*/
/** 是否需要在控制器viewDidLoad */
@property (nonatomic, readwrite, assign) BOOL shouldRequestRemoteDataOnViewDidLoad;

/// FDFullscreenPopGesture
/// Whether the interactive pop gesture is disabled when contained in a navigation
/// stack. (是否取消掉左滑pop到上一层的功能（栈底控制器无效），默认为NO，不取消)
@property (nonatomic, readwrite, assign) BOOL interactivePopDisabled;
/// Indicate this view controller prefers its navigation bar hidden or not,
/// checked when view controller based navigation bar's appearance is enabled.
/// Default to NO, bars are more likely to show.
/// 是否隐藏该控制器的导航栏 默认是不隐藏 (NO)
@property (nonatomic, readwrite, assign) BOOL prefersNavigationBarHidden;

/// 是否隐藏该控制器的导航栏底部的分割线 默认不隐藏 （NO）
@property (nonatomic, readwrite, assign) BOOL prefersNavigationBarBottomLineHidden;

/// IQKeyboardManager
/// 是否让IQKeyboardManager的管理键盘的事件 默认是YES（键盘管理）
@property (nonatomic, readwrite, assign) BOOL keyboardEnable;
/// 是否键盘弹起的时候，点击其他局域键盘弹起 默认是 YES
@property (nonatomic, readwrite, assign) BOOL shouldResignOnTouchOutside;

#pragma mark -- For TableView
@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger perPage;


@end
