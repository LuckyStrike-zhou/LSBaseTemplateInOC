//
//  ZTNetwork.h
//  Template
//
//  Created by Liujia on 2020/12/30.
//  Copyright © 2020 7m. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

#define PREFIX_URL  @"http://www.wjwangjian.com/ZTStock2/"
#define NEWSURL     @"news"
#define HOTSTOCK_URL @"HotStocks"

typedef void(^ReturnResponse)(BOOL isSuc,id __nullable response,NSError * __nullable error);
@interface ZTNetwork : AFHTTPSessionManager

+ (instancetype)sharedInstance;

- (void)requestURL:(NSString*)url WithComplateBlock:(ReturnResponse)cBlock;

@end

NS_ASSUME_NONNULL_END
