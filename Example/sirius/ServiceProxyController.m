//
//  ServiceProxyController.m
//  LeonTestDelegate
//
//  Created by 黄黎 on 14/11/25.
//  Copyright (c) 2014年 DJSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceProxyController.h"
#import "Y9ServiceProxy.h"
#import "Y9ServiceProxyRequest.h"

@implementation ServiceProxyController

- (IBAction)loginButtonAction:(id)sender {
    NSString *userNo = [self userNoTextField].text;
    NSString *instNo=[self instNoTextField].text;
    NSString *password = [self passwordTextField].text;
    
    
    [[self logTextView]setText:[NSString stringWithFormat:@"用户编号：%@,机构编号:%@,密码：%@",userNo,instNo,password]];
    
    Y9ServiceProxy *serviceProxy = [Y9ServiceProxy sharedProxy];
    
    Y9ServiceProxyRequest *request = [[Y9ServiceProxyRequest alloc]initWithAction:@"com.yun9.sys.inst.support.service.SysUserPasswdValidateService"];
    
    [request.data setObject:userNo forKey:@"userno"];
    [request.data setObject:instNo forKey:@"instid"];
    [request.data setObject:password forKey:@"password"];
    
    
    [serviceProxy action:request];
    
}


-(void)viewDidLoad{
    
}


@end