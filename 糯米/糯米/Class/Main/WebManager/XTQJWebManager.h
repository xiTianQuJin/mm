//
//  XTQJWebManager.h
//  糯米
//
//  Created by tarena41 on 16/6/24.
//  Copyright © 2016年 tarena41. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^MyCallBack)(id obj);
@interface XTQJWebManager : NSObject
+(void)GetBannersRequestWithPath:(NSString *)path andCallback:(MyCallBack)callback;
+(void)GetNuomiBigNewBannerRequestWithPath:(NSString *)path andCallback:(MyCallBack)callback;
+(void)GetCategoryRequestWithPath:(NSString *)path andCallback:(MyCallBack)callback;
@end
