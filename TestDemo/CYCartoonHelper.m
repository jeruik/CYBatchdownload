//
//  CYCartoonHelper.m
//  Junengwan
//
//  Created by 小菜 on 16/12/2.
//  Copyright © 2016年 ‰∏äÊµ∑Ëß¶ÂΩ±ÊñáÂåñ‰º†Êí≠ÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import "CYCartoonHelper.h"
#import "TCBlobDownload.h"
#import "SDWebImageManager.h"
@implementation CYCartoonHelper

// Cartoon/Audio

+ (void)downAllImageWithPath:(NSString *)audioPath cartoonModel:(NSArray *)imageUrls imageDownloadSuccess:(void (^)(NSString *msg))imageSuccessBlock success:(void (^)(NSString *msg))successBlock failure:(void(^)(NSString *msg))failureBlock {

    
    // 创建组
    dispatch_group_t imageGroup = dispatch_group_create();
    
    for (NSString *urlStr in imageUrls) {
        
        // 添加到组
        dispatch_group_enter(imageGroup);
        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:urlStr] options:SDWebImageAvoidAutoSetImage progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            if (error) {
                failureBlock(@"图片资源加载失败");
            } else {
                // 图片下载完成 离开组
                dispatch_group_leave(imageGroup);
            }
        }];
    }
    
    // 所有图片下载完成 就会来到
    dispatch_group_notify(imageGroup, dispatch_get_main_queue(), ^{
        imageSuccessBlock(@"所有图片下载完毕");
        
        // 创建音频下载组
        dispatch_group_t audioGroup = dispatch_group_create();
        
        NSArray *audioUrls = @[@"你的音频下载地址"];
        for (NSString *audioUrlStr in audioUrls) {
            // 添加单个音频下载音频操作
            dispatch_group_enter(audioGroup);
            
            TCBlobDownloadManager *sharedManager = [TCBlobDownloadManager sharedInstance];
            NSString *customPath = @"下载存储路径";
            [sharedManager startDownloadWithURL:[NSURL URLWithString:audioUrlStr] customPath:customPath firstResponse:^(NSURLResponse *response) {
                
            } progress:^(uint64_t receivedLength, uint64_t totalLength, NSInteger remainingTime, float progress) {
                
            } error:^(NSError *error) {
                
                failureBlock(@"音频加载失败");
            } complete:^(BOOL downloadFinished, NSString *pathToFile) {
                NSLog(@"下载完成");
                dispatch_group_leave(audioGroup);
            }];
        }
        dispatch_group_notify(audioGroup, dispatch_get_main_queue(), ^{
            successBlock(@"所有资源加载完毕");
        });
    });
}

@end
