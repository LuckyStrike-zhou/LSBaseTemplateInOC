//
//  AFNPackage.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/21.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^progressBlock)(NSProgress *progress);
typedef void(^complateBlock)(id response,NSError *error);

@interface AFNPackage : NSObject
/**
 GET
 */
+ (void)GetWithURL:(NSString*)url paraments:(id)para progress:(progressBlock)pBlock complate:(complateBlock)cBlock;
/**
 POST
 */
+ (void)PostWithURL:(NSString*)url paraments:(id)para progress:(progressBlock)pBlock complate:(complateBlock)cBlock;
/**
 UPLOAD
 */
+ (void)UploadWithURL:(NSString*)url paraments:(id)para data:(NSData*)data name:(NSString*)name mimeType:(NSString*)mimeType progress:(progressBlock)pBlock complate:(complateBlock)cBlock;
/**
 数据处理
 */
+ (void)handleResponse:(id)responseObject completion:(complateBlock)completion;

@end
