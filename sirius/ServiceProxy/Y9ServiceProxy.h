//
//  ServiceProxy.h
//  LeonTestDelegate
//
//  Created by 黄黎 on 14/11/25.
//  Copyright (c) 2014年 DJSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "Y9ServiceProxyRequest.h"

@interface Y9ServiceProxy : AFHTTPSessionManager

typedef void (^OnServerCompleteHandler)();

+(instancetype)sharedProxy;

-(NSURLSessionDataTask *)action:(Y9ServiceProxyRequest *) request ;

@end