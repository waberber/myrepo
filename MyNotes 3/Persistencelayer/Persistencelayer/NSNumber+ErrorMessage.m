//
//  NSNumber+ErrorMessage.m
//  Persistencelayer
//
//  Created by waber on 16/5/23.
//  Copyright © 2016年 waber. All rights reserved.
//

#import "NSNumber+ErrorMessage.h"

@implementation NSNumber (ErrorMessage)

-(NSString*) errorMessage
{
    NSString *errStr = @"";
    NSInteger errorNum = [self integerValue];
    switch (errorNum) {
        case -7:
            errStr = @"没有数据";
            break;
        case -6:
            errStr = @"日期没有输入";
            break;
        case -5:
            errStr = @"内容没有输入";
            break;
        case -4:
            errStr = @"ID没有输入";
            break;
        case -3:
            errStr = @"数据访问失败";
            break;
        case -2:
            errStr = @"您的帐号最多能插入10条数据";
            break;
        case -1:
            errStr = @"用户不存在，请到http://51work6.com注册";
            break;
            
        default:
            break;
    }
    return errStr;
}

@end
