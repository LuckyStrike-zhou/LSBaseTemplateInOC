//
//  AFNPackage.h
//  YEXClient
//
//  Created by Apple on 2017/12/7.
//  Copyright © 2017年 LYKM. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    RequestMethodGet,
    RequestMethodPost
} RequestMethod;


@interface AFNPackage : NSObject

/**
 * requestMethod:请求方式
 * urlString:请求地址
 * parameters:请求参数
 * responseBlock:请求成功或失败的回调
 */

+ (void)requestWithMethod:(RequestMethod)requestMethod andUrlString:(NSString *)urlString andParameters:(id) parameters andFinished:(void(^)(id response, NSError *error))responseBlock;

/**
 * urlString:请求地址
 * parameters:请求参数
 * data:上传资料
 * name:上传资料的名字
 * responseBlock:请求成功或失败的回调
 */

+ (void)updateWithUrlString:(NSString *)urlString andParameters:(id)parameters andData:(NSData*)data andName:(NSString *)name andFinished:(void(^)(id response, NSError *error))responseBlock;

@end
