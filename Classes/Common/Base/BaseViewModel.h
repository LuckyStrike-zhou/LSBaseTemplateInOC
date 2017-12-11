//
//  BaseViewModel.h
//  LSSampleInOC
//
//  Created by Apple on 2017/12/11.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

/** 原则:VM不允许引用UIKit库，避免与View代码耦合，并且私有Model(其他VM)
 用法:数据的下载，刷新，分发，转化,触发事件
 */

@protocol BaseViewModelProtocol<NSObject>

@optional

/** 初始化  */
- (instancetype)initWithData:(id)data;
#pragma mark -- 更新数据源的方法
/** 远端刷新数据  */
- (RACSignal*)_fetchRemoteDataWithPara:(id)para;
/** 本地拉取数据  */
- (RACSignal*)_fetchLocalData;
/** 本地存储数据  */
- (RACSignal*)_saveDataToLocal;

/** 信息传递  */
@property (nonatomic,strong) RACSubject *infoUpdate;

/** 统一多处触发的信号  */
@property (nonatomic,strong) RACSubject *clickSubject;

@end

@interface BaseViewModel : NSObject<BaseViewModelProtocol>
/** 工厂方法  */
+ (instancetype)viewModel;

#pragma mark -- 转化后给View直接使用的属性

#pragma mark -- 信号

@end

