//
//  ServiceProxyRequest.h
//  LeonTestDelegate
//
//  Created by 黄黎 on 14/11/25.
//  Copyright (c) 2014年 DJSoft. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Y9ServiceProxyRequest : NSObject

@property (strong,nonatomic) NSString *token;
@property (strong,nonatomic) NSString  *action;
@property (strong,nonatomic) NSMutableDictionary  *header;
@property (strong,nonatomic) NSMutableDictionary *data;

-(instancetype)initWithAction:(NSString *)action;

@end
