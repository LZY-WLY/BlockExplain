//
//  AFNTools.h
//  BlockExplain
//
//  Created by LZY on 18/1/7.
//  Copyright © 2018年 LZY. All rights reserved.
//  数据请求 工具类

#import "AFHTTPSessionManager.h"

@interface AFNTools : AFHTTPSessionManager


/**
 AFNTools的GET方法

 @param url 请求地址
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)GET:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;

/**
 AFNTools的POST方法

 @param url 请求地址
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)POST:(NSString *)url parameters:(NSDictionary *)parameters uccess:(void(^)(id json))success failure:(void(^)(NSError *error))failure;
@end
