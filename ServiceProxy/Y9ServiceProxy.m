//
//  ServiceProxy.m
//  LeonTestDelegate
//
//  Created by 黄黎 on 14/11/25.
//  Copyright (c) 2014年 DJSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Y9ServiceProxy.h"

static NSString * const serviceURL = @"http://120.24.84.201";

@implementation Y9ServiceProxy


+(instancetype)sharedProxy{
    static Y9ServiceProxy *_serviceProxy = nil;
    static dispatch_once_t onceToken;
    
    

    dispatch_once(&onceToken,^{
        
        //配置调用参数
        NSURLSessionConfiguration *defaultConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        //设置头信息
        [defaultConfig setHTTPAdditionalHeaders:@{@"Content-Type":@"application/json; encoding=utf-8"}];
        //
        //设置Cache,第一个参数内存缓存10M,第二个参数磁盘参数5M
        NSURLCache *cache = [[NSURLCache alloc]initWithMemoryCapacity:10 * 1024 *1024 diskCapacity:5 * 1024 * 1024 diskPath:nil];
        [defaultConfig setURLCache:cache];
//
        _serviceProxy = [[Y9ServiceProxy alloc]initWithBaseURL:[NSURL URLWithString:serviceURL]sessionConfiguration:defaultConfig];
        
        //请求信息设置，设置为json格式
        _serviceProxy.requestSerializer = [AFJSONRequestSerializer serializer];
        [_serviceProxy.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
        [_serviceProxy.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        _serviceProxy.responseSerializer = [AFJSONResponseSerializer serializer];
        //_serviceProxy.responseSerializer = [AFHTTPResponseSerializer serializer];
//        _serviceProxy.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//        _serviceProxy.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

    
        
    });
    
    return _serviceProxy;
}

-(NSURLSessionDataTask *)action:(Y9ServiceProxyRequest *)request{
    
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    
    [params setValue:request.action forKey:@"action"];
    [params setValue:request.header forKey:@"header"];
    [params setValue:request.data forKey:@"data"];
    [params setValue:request.token forKey:@"token"];
    
    NSURLSessionDataTask *task = [self POST:@"/service/service/biz/action.yun9" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"Cause:%@;Code:%@;Data:%@",[responseObject objectForKey:@"cause"],[responseObject objectForKey:@"code"],[responseObject objectForKey:@"data"]);
      
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    return task;
}

@end