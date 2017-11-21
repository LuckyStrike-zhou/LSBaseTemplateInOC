//
//  NSString+FileManager.m
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/20.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "NSString+FileManager.h"

@implementation NSString (FileManager)
#pragma mark --快速创建
+ (NSString*)FastDocument{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

+ (NSString*)FastLibrary{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
}

+ (NSString*)FastCaches{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
}

+ (NSString*)FastTmp{
    return NSTemporaryDirectory();
}

- (NSString*)fileFC:(NSString*)name{
    return [NSString stringWithFormat:@"%@/%@",self,name];
}

- (NSString*)folderFC:(NSString*)name{
    return [NSString stringWithFormat:@"%@/%@",self,name];
}
#pragma mark -- 数据读取
- (NSData*)readToDataFC{
    if ([self checkExistPath]) {
        return [[NSData alloc] initWithContentsOfFile:self];
    }
    return nil;
}
- (NSDictionary*)readToDicFC{
    if ([self checkExistPath]) {
        return [[NSDictionary alloc] initWithContentsOfFile:self];
    }
    return nil;
}
- (NSArray*)readToArrFC{
    if ([self checkExistPath]) {
        return [[NSArray alloc] initWithContentsOfFile:self];
    }
    return nil;
}

- (BOOL)saveFC:(id)data{
    [self createFolderFC];
    if ([data isKindOfClass:[NSData class]]) {
        return [((NSData*)data) writeToFile:self atomically:YES];
    } else if ([data isKindOfClass:[NSDictionary class]]) {
        return [((NSDictionary*)data) writeToFile:self atomically:YES];
    }else if ([data isKindOfClass:[NSArray class]]){
        return [((NSArray*)data) writeToFile:self atomically:YES];
    }
    return NO;
}
#pragma mark -- 功能
- (float)sizeFC{
    if ([self checkFolderOrFile]) {
     float totalSize = [self fileSize];
        for (NSString *item in self.contentsFC) {
            
            NSString *fullPath = [NSString stringWithFormat:@"%@/%@",self,item];
            totalSize += [fullPath fileSize];
        }
        return totalSize;
    } else {
        return [self fileSize];
    }
}

- (NSArray*)contentsFC{
    if ([self checkFolderOrFile]) {
        return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self error:nil];
    }
    return nil;
}

- (void)clearFC{
    if ([self checkExistPath]) {
        [[NSFileManager defaultManager] removeItemAtPath:self error:nil];
    }
}

- (NSTimeInterval)lastedFC{
    if ([self checkExistPath]) {
        
        NSDictionary *dic = [[NSFileManager defaultManager] attributesOfItemAtPath:self error:nil];
        
        NSDate * date = dic[NSFileModificationDate];
        NSDate * nowDate = [[NSDate alloc] init];
        
        return [nowDate timeIntervalSinceDate:date];
    }
    return 0;
}

#pragma mark --检测
- (BOOL)checkVaildPath{
    return [self containsString:NSHomeDirectory()];
}

- (BOOL)checkExistPath{
    if ([self checkVaildPath]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:self]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)createFolderFC{
    NSFileManager *mgr = [NSFileManager defaultManager];
    if ([self checkFullPath] && ![mgr fileExistsAtPath:self]) {
        return [mgr createDirectoryAtPath:[self foldersName] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return NO;
}

- (BOOL)checkFullPath{
    BOOL docu = [self containsString:[NSString stringWithFormat:@"%@",[NSString FastDocument]]];
    BOOL lib = [self containsString:[NSString stringWithFormat:@"%@/",[NSString FastLibrary]]];
    BOOL cac = [self containsString:[NSString stringWithFormat:@"%@/",[NSString FastCaches]]];
    BOOL tmp = [self containsString:[NSString stringWithFormat:@"%@/",[NSString FastTmp]]];
    
    return docu || lib || cac || tmp;
}

- (BOOL)checkFolderOrFile{
    if ([self checkExistPath]) {
        NSDictionary *dic = [[NSFileManager defaultManager]  attributesOfItemAtPath:self error:nil];
        return [dic[NSFileType] isEqualToString:NSFileTypeDirectory];
    }
    return NO;
}

- (float)fileSize{
    NSDictionary *dic = [[NSFileManager defaultManager] attributesOfItemAtPath:self error:nil];
    return [dic[NSFileSize] floatValue];
}

- (NSString*)foldersName{
    if ([self checkFullPath]) {
        NSString *file = [self componentsSeparatedByString:@"/"].lastObject;
        return [self stringByReplacingOccurrencesOfString:file withString:@""];
    }
    return nil;
}

@end
