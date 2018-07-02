//
//  LSBaseViewModel.m
//  LSSampleInOC
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import "LSBaseViewModel.h"

@interface LSBaseViewModel ()


/// 整个应用的服务层 The `services` parameter in `-initWithServices:params` method.
@property (nonatomic, strong, readwrite) id<LSBaseViewModelServices> services;
/// The `params` parameter in `-initWithServices:params` method.
@property (nonatomic, readwrite, copy) NSDictionary *params;

/// The `View` willDisappearSignal
@property (nonatomic, readwrite, strong) RACSubject *willDisappearSignal;
/** 错误集合  */
@property (nonatomic, strong, readwrite) RACSubject *fetchDataErrors;
/** 远端请求数据命令  */
@property (nonatomic, strong, readwrite) RACCommand *requestRemoteDataCommand;
/** 远端上传数据命令  */
@property (nonatomic, strong, readwrite) RACCommand *uploadRemoteDataCommand;
/** 本地拉取数据命令  */
@property (nonatomic, strong, readwrite) RACCommand *fetchLocalDataCommand;
/** 本地保存数据命令  */
@property (nonatomic, strong, readwrite) RACCommand *saveLocalDataCommand;


@end

@implementation LSBaseViewModel

/// when `BaseViewModel` created and call `initWithParams` method , so we can ` initialize `
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    LSBaseViewModel *viewModel = [super allocWithZone:zone];
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(initWithServices:params:)]
     subscribeNext:^(id x) {
         @strongify(viewModel)
         [viewModel initialize];
     }];
    
    [[viewModel
      rac_signalForSelector:@selector(initWithOriginalData:)]
     subscribeNext:^(id x) {
         @strongify(viewModel)
         [viewModel initialize];
     }];
    
    return viewModel;
    
    
}
/// create `viewModel` instance
- (instancetype)initWithServices:(id<LSBaseViewModelServices>)services params:(NSDictionary *)params {
    self = [super init];
    if (self) {
        /// 默认在viewDidLoad里面加载本地和服务器的数据
        self.shouldFetchLocalDataOnViewModelInitialize = YES;
        self.shouldRequestRemoteDataOnViewDidLoad = YES;
        /// 允许IQKeyboardMananger接管键盘弹出事件
        self.keyboardEnable = YES;
        self.shouldResignOnTouchOutside = YES;
//        self.keyboardDistanceFromTextField = 10.0f;
        
//        self.title = params[MHViewModelTitleKey];
        /// 赋值
        self.services = services;
        self.params   = params;
    }
    return self;
}

- (instancetype)initWithOriginalData:(id)originalData {
    if ([super init]) {
        
    }
    return self;
}

/// sub class can override
- (void)initialize {}
/** 工厂方法  */
+ (LSBaseViewModel*)viewModel {
    return [[LSBaseViewModel alloc] init];
}


- (RACSubject *)fetchDataErrors {
    if (!_fetchDataErrors) _fetchDataErrors = [RACSubject subject];
    return _fetchDataErrors;
}

- (RACSubject *)willDisappearSignal {
    if (!_willDisappearSignal) _willDisappearSignal = [RACSubject subject];
    return _willDisappearSignal;
}

- (NSError*)errorHandleResponse:(id)response error:(id)error {
    
    NSString *errMsg = ![XYString isBlankString:response[@"resultMsg"]] ? response[@"resultMsg"] : ((NSError*)error).domain;
    if (!errMsg) {
        return nil;
    }
    NSInteger errCode = ![XYString isBlankString:response[@"errCode"]] ?  [response[@"errCode"] integerValue] : 0;
    
    return [NSError errorWithDomain:errMsg code:errCode userInfo:nil];
}

@end
