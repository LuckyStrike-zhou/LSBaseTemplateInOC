//
//  LSBaseLoginViewModel.m
//  LSSampleInOC
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import "LSBaseLoginViewModel.h"

@interface LSBaseLoginViewModel ()

@end

@implementation LSBaseLoginViewModel

- (void)initialize {
    [super initialize];
    
    self.validLoginSignal = [[RACSignal combineLatest:@[RACObserve(self, accountNum),RACObserve(self, password)] reduce:^(NSString* accountNum,NSString*password){
        //CUSTOM:验证输入合法性
        return @(accountNum.length > 0 && password.length > 0);
    }] distinctUntilChanged];
    
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        //CUSTOM:
        
        return [RACSignal empty];
    }];
    
    
    
}

@end
