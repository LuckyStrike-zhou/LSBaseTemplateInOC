//
//  LSBaseTableViewModel.h
//  LSSampleInOC
//
//  Created by Apple on 2018/1/26.
//  Copyright © 2018年 LuckyStrike. All rights reserved.
//

#import "LSBaseViewModel.h"

@interface LSBaseTableViewModel : LSBaseViewModel

@property (nonatomic, strong) RACCommand *didSelectCommand;

@end
