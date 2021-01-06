//
//  ZTNetwork.m
//  Template
//
//  Created by Liujia on 2020/12/30.
//  Copyright © 2020 7m. All rights reserved.
//

#import "ZTNetwork.h"

@implementation ZTNetwork

static ZTNetwork *ztNetwork = nil;
+ (instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ztNetwork = [[ZTNetwork alloc] init];
    });
    return ztNetwork;
}

- (void)requestURL:(NSString*)url WithComplateBlock:(ReturnResponse)cBlock{
//    http://www.kjygtl.com
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@.json",PREFIX_URL,url];
    [self GET:urlString parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        cBlock(YES,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        cBlock(NO,nil,error);
    }];
    
}

@end
