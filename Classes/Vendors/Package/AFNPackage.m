//
//  AFNHelper.m
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/21.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "AFNPackage.h"
#import <AFNetworking/AFNetworking.h>
#import "NSString+StringControl.h"

@implementation AFNPackage

+ (AFHTTPSessionManager*)createManager{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return manager;
}

+ (void)GetWithURL:(NSString*)url paraments:(id)para progress:(progressBlock)pBlock complate:(complateBlock)cBlock{

    [[AFNPackage createManager] GET:url parameters:para progress:pBlock success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        cBlock(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        cBlock(nil,error);
    }];
}

+ (void)PostWithURL:(NSString*)url paraments:(id)para progress:(progressBlock)pBlock complate:(complateBlock)cBlock{

    [[AFNPackage createManager] POST:url parameters:para progress:pBlock success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        cBlock(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        cBlock(nil,error);
    }];
}

+ (void)UploadWithURL:(NSString*)url paraments:(id)para data:(NSData*)data name:(NSString*)name mimeType:(NSString*)mimeType progress:(progressBlock)pBlock complate:(complateBlock)cBlock{
    
    [[AFNPackage createManager] POST:url parameters:para constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:name fileName:[NSString stringWithFormat:@"%@.jpeg",name] mimeType:mimeType];
    } progress:pBlock success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        cBlock(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        cBlock(nil,error);
    }];
}

#pragma mark --数据处理
+ (void)handleResponse:(id)responseObject completion:(complateBlock)completion;
{
    @try{
        if([responseObject isKindOfClass:[NSData class]]){
            NSString *originString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            if (originString && [NSJSONSerialization isValidJSONObject:originString]) {
                responseObject = [NSJSONSerialization JSONObjectWithData:[originString dataUsingEncoding:NSUTF8StringEncoding]
                                                                 options:NSJSONReadingMutableLeaves
                                                                   error:nil];
            }
            if (![originString isEmpty]) {
                responseObject = originString;
            }
        }
        completion(responseObject,nil);
       
    }@catch(NSException *excep){
        NSLog(@"%@",excep.reason);
    }
}
@end
