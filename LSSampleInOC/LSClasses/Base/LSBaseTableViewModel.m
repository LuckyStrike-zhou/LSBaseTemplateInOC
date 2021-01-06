//
//  LSBaseTableViewModel.m
//  LSSampleInOC
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import "LSBaseTableViewModel.h"

@implementation LSBaseTableViewModel

- (void)initialize {
    [super initialize];
    
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            return [RACDisposable disposableWithBlock:^{
                
            }];
        }];
    }];
}

@end
