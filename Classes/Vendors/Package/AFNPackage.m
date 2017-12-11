//
//  AFNPackage.m
//  YEXClient
//
//  Created by Apple on 2017/12/7.
//  Copyright © 2017年 LYKM. All rights reserved.
//

#import "AFNPackage.h"
#import <AFNetworking/AFNetworking.h>

@implementation AFNPackage

+ (void)requestWithMethod:(RequestMethod)requestMethod andUrlString:(NSString *)urlString andParameters:(id) parameters andFinished:(void(^)(id response, NSError *error))responseBlock
{
    // 定义成功的block
    void (^sucBlock)(NSURLSessionDataTask *dataTask, id responseObject) = ^(NSURLSessionDataTask *dataTask,id responseObject)
    {
        responseBlock(responseObject, nil);
    };
    // 定义失败的block
    void (^failBlock)(NSURLSessionDataTask *dataTask,NSError *error) = ^(NSURLSessionDataTask *dataTask,NSError *error)
    {
        responseBlock(nil, error);
    };
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/xml", @"text/plain; charset=utf-8", nil];
    
    if (requestMethod == RequestMethodGet) {
        [manager GET:urlString parameters:parameters progress:nil success:sucBlock failure:failBlock];
    } else {
        [manager POST:urlString parameters:parameters progress:nil success:sucBlock failure:failBlock];
    }
}

+ (void)updateWithUrlString:(NSString *)urlString andParameters:(id)parameters andData:(NSData*)data andName:(NSString *)name andFinished:(void(^)(id response, NSError *error))responseBlock
{
    void (^sucBlock)(NSURLSessionDataTask *dataTask, id responseObject) = ^(NSURLSessionDataTask *dataTask,id responseObject)
    {
        NSError *err = nil;
        id resp = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&err];
        responseBlock(resp, err);
    };
    void (^failBlock)(NSURLSessionDataTask *dataTask,NSError *error) = ^(NSURLSessionDataTask *dataTask,NSError *error)
    {
        responseBlock(nil, error);
    };
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //fileName添加时间
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@_%@.png",name,str];
        
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:@"image/png"];//@"application/octet-stream"
        
    } progress:nil success:sucBlock failure:failBlock];
}

@end
