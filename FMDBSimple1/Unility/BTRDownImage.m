//
//  BTRDownImage.m
//  FMDBSimple1
//
//  Created by Benster on 15/4/28.
//  Copyright (c) 2015年 Workspaces. All rights reserved.
//

#import "BTRDownImage.h"

@implementation BTRDownImage

#pragma mark - 获取图像路径
+ (NSString *)imageFilePath:(NSString *)imageUrl
{
    // 获取caches文件夹路径
    NSString * cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    // 创建DownloadImages文件夹
    NSString * downloadImagesPath = [cachesPath stringByAppendingPathComponent:@"DownloadImages"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:downloadImagesPath]) {
        [fileManager createDirectoryAtPath:downloadImagesPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    //替换路径中的“/”
    NSString * imageName = [imageUrl stringByReplacingOccurrencesOfString:@"/" withString:@""];
    NSString * imageFilePath = [downloadImagesPath stringByAppendingPathComponent:imageName];
    
    return imageFilePath;
}

#pragma mark - 加载本地图像
+ (UIImage *)loadLocalImage:(NSString *)imageUrl
{
    // 获取图像路径
    NSString * filePath = [BTRDownImage imageFilePath:imageUrl];
    UIImage * image = [UIImage imageWithContentsOfFile:filePath];
    
    if (image != nil) {
        return image;
    }
    
    return nil;
}

+ (void)startDownloadImage:(NSString *)imageUrl
{
    // 先判断本地沙盒是否已经存在图像，存在直接获取，不存在再下载，下载后保存
    // 存在沙盒的Caches的子文件夹DownloadImages中
    UIImage *image = [BTRDownImage loadLocalImage:imageUrl];
    
    if (image == nil) {
        // 沙盒中没有，下载
        // 异步下载,分配在程序进程缺省产生的并发队列
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 多线程中下载图像
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
            // 缓存图片
            [imageData writeToFile:[BTRDownImage imageFilePath:imageUrl] atomically:YES];
            
            // 回到主线程完成UI设置
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image = [UIImage imageWithData:imageData];
                
            });
        });
    }
}

@end
