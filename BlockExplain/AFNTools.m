//
//  AFNTools.m
//  BlockExplain
//
//  Created by LZY on 18/1/7.
//  Copyright © 2018年 LZY. All rights reserved.
//

#import "AFNTools.h"

@implementation AFNTools
static AFNTools *tools;
+ (instancetype)shareAFNTools {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = (AFNTools *)[AFHTTPSessionManager manager];
    });
    return tools;
}


+ (void)GET:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    [[self shareAFNTools] GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)POST:(NSString *)url parameters:(NSDictionary *)parameters uccess:(void (^)(id))success failure:(void (^)(NSError *))failure {
    [[self shareAFNTools] POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
