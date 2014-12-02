//
//  ServiceProxyRequest.m
//  LeonTestDelegate
//
//  Created by 黄黎 on 14/11/25.
//  Copyright (c) 2014年 DJSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Y9ServiceProxyRequest.h"

@implementation Y9ServiceProxyRequest

-(instancetype)initWithAction:(NSString *)action{
    
    self = [self init];
    
    if (!self){
        return nil;
    }
    
    self.action = action;
    self.token = @"8fc50dd14a951318ca168e40a9fa1ec78d1110e058700c9affdbe6ab5eb6b931";
    
    self.data = [[NSMutableDictionary alloc]init];
    
    self.header = [[NSMutableDictionary alloc]init];
    [self.header setValue:@"instid" forKey:@"1"];
    [self.header setValue:@"userid" forKey:@"111"];
    
    return self;
    
}

@end