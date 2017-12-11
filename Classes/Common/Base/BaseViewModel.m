//
//  BaseViewModel.m
//  LSSampleInOC
//
//  Created by Apple on 2017/12/11.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "BaseViewModel.h"

@interface BaseViewModel ()

#pragma mark -- 引用的Model和ViewModel

@end

@implementation BaseViewModel

/** 工厂方法  */
+ (instancetype)viewModel{
    return [[self alloc] init];
}

#pragma mark -- Protocol
/** 初始化  */
- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark -- 引用的Model和ViewModel的setter方法，转化后赋值给属性

#pragma mark -- 更新数据源的方法

#pragma mark -- 信号懒加载

@end
