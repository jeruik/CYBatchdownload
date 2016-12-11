//
//  CYCartoonHelper.h
//  Junengwan
//
//  Created by 小菜 on 16/12/2.
//  Copyright © 2016年 ‰∏äÊµ∑Ëß¶ÂΩ±ÊñáÂåñ‰º†Êí≠ÊúâÈôêÂÖ¨Âè∏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CYCartoonHelper : NSObject

+ (void)downAllImageWithPath:(NSString *)audioPath cartoonModel:(NSArray *)imageUrls imageDownloadSuccess:(void (^)(NSString *msg))imageSuccessBlock success:(void (^)(NSString *msg))successBlock failure:(void(^)(NSString *msg))failureBlock;

@end
