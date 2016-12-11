//
//  ViewController.m
//  TestDemo
//
//  Created by 小菜 on 16/6/17.
//  Copyright © 2016年 蔡凌云. All rights reserved.
//

#import "ViewController.h"
#import "CYCartoonHelper.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [CYCartoonHelper downAllImageWithPath:@"存储路径" cartoonModel:@[@"你的模型数组"] imageDownloadSuccess:^(NSString *msg) {
        NSLog(@"所有图片下载完毕");
    } success:^(NSString *msg) {
        NSLog(@"图片音频全部下载完毕");
    } failure:^(NSString *msg) {
        NSLog(@"下载失败");
    }];
}

@end
