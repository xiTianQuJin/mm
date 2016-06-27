


//
//  XTQJWebManager.m
//  糯米
//
//  Created by tarena41 on 16/6/24.
//  Copyright © 2016年 tarena41. All rights reserved.
//

#import "XTQJWebManager.h"
#import "XTQJCategory.h"
#import "AFNetworking.h"
#import "XTQJBanners.h"
@implementation XTQJWebManager
+(void)GetBannersRequestWithPath:(NSString *)path andCallback:(MyCallBack)callback{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *array = dic[@"data"][@"banners"];
        NSArray *bannersArray = [XTQJBanners arrayOfModelsFromDictionaries:array error:nil];
        callback(bannersArray);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@",error);
    }];
}
+(void)GetNuomiBigNewBannerRequestWithPath:(NSString *)path andCallback:(MyCallBack)callback{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSString *pictureUrl = dic[@"data"][@"nuomiBigNewBanner"][0][@"pictureUrl"];
        callback(pictureUrl);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@",error);
    }];
}
+(void)GetCategoryRequestWithPath:(NSString *)path andCallback:(MyCallBack)callback{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *array = dic[@"data"][@"category"];
        NSArray *categoryArray = [XTQJCategory arrayOfModelsFromDictionaries:array error:nil];
        callback(categoryArray);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败：%@",error);
    }];
}
@end
