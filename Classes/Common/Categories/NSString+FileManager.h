//
//  NSString+FileManager.h
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/20.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (FileManager)
/**
    快速获取Document目录
 */
+ (NSString*)FastDocument;
/**
 快速获取Library目录
 */
+ (NSString*)FastLibrary;
/**
 快速获取Library/Caches目录
 */
+ (NSString*)FastCaches;
/**
 快速获取tmp目录
 */
+ (NSString*)FastTmp;
/**
    创建文件夹目录
 */
- (NSString*)folderFC:(NSString*)name;
/**
    创建文件目录
 */
- (NSString*)fileFC:(NSString*)name;
/**
    读取数据
 */
- (NSData*)readToDataFC;
- (NSData*)readToDicFC;
- (NSData*)readToArrFC;
/**
    存入数据
 */
- (BOOL)saveFC:(id)data;
/**
    获取文件大小（B）
 */
- (float)sizeFC;
/**
    获取文件夹下文件名称集合
 */
- (NSArray*)contentsFC;
/**
    清除文件
 */
- (void)clearFC;
/**
    获取文件上次修改到现在的秒数
 */
- (NSTimeInterval)lastedFC;
/**
    检测目录有效性
 */
- (BOOL)checkVaildPath;
/**
    检测目录是否存在
 */
- (BOOL)checkExistPath;
/**
    创建对应路径目录
 */
- (BOOL)createFolderFC;


@end
