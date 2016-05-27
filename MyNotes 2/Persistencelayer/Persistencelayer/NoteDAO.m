//
//  NoteDAO.m
//  Persistencelayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import "NoteDAO.h"
#import "MKNetworkKit/MKNetworkKit.h"


@implementation NoteDAO

static NoteDAO *sharedManager = nil;
+(NoteDAO*)shareManager
{
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            sharedManager = [[self alloc] init];
        });
        return sharedManager;
}


//查询所有数据方法
-(void)findAll
{
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    NSMutableDictionary *parm = [[NSMutableDictionary alloc] init];
    [parm setValue:USER_ID forKey:@"email"];
    [parm setValue:@"JSON" forKey:@"type"];
    [parm setValue:@"query" forKey:@"action"];
    
    MKNetworkOperation *op = [engine operationWithPath:HOST_PATH params:parm];
    [op addCompletionHandler:^(MKNetworkOperation *operation){
        NSData *data = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        NSInteger resultCode = [resultCodeNumber integerValue];
        if(resultCode>=0)
        {
            NSMutableArray *listDict = [resDict objectForKey:@"Record"];
            NSMutableArray *listData = [NSMutableArray new];
            for (NSDictionary* dic in listDict) {
                Note *note = [[Note alloc] initWithDate:[dic objectForKey:@"CDate"] content:[dic objectForKey:@"Content"] Id:[(NSNumber*)[dic objectForKey:@"ID"] integerValue]];
                [listData addObject:note];
            }
            [self.delegate findAllFinished:listData];
        }
        else
        {
            NSString *message =[resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate findAllFailed:err];
        }
        
        
    } errorHandler:^(MKNetworkOperation *operation,NSError *err){
        [self.delegate findAllFailed:err];
    }];
    
    [engine enqueueOperation:op];
}

//创建备忘录方法
-(void)create:(Note *)model
{
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    NSMutableDictionary *parm = [[NSMutableDictionary alloc] init];
    [parm setValue:USER_ID forKey:@"email"];
    [parm setValue:@"JSON" forKey:@"type"];
    [parm setValue:@"add" forKey:@"action"];
    [parm setValue:model.date forKey:@"date"];
    [parm setValue:model.content forKey:@"content"];
    
    MKNetworkOperation *op = [engine operationWithPath:HOST_PATH params:parm];
    [op addCompletionHandler:^(MKNetworkOperation *operation){
        NSData *data = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        NSInteger resultCode = [resultCodeNumber integerValue];
        if (resultCode>=0) {
            [self.delegate createFinished];
        }
        else
        {
            NSString *message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate createFailed:err];
        }
    
    } errorHandler:^(MKNetworkOperation *operation,NSError *err){
        [self.delegate createFailed:err];
    }];
    
    [engine enqueueOperation:op];
}

//删除备忘录方法
-(void)remove:(Note *)model
{
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    NSMutableDictionary *parm = [[NSMutableDictionary alloc] init];
    [parm setValue:USER_ID forKey:@"email"];
    [parm setValue:@"JSON" forKey:@"type"];
    [parm setValue:@"remove" forKey:@"action"];
    [parm setValue:[NSString stringWithFormat:@"%d",model.Id] forKey:@"id"];
    
    MKNetworkOperation *op = [engine operationWithPath:HOST_PATH params:parm httpMethod:@"POST"];
    [op addCompletionHandler:^(MKNetworkOperation *operation){
        NSData *data = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        NSInteger resultCode = [resultCodeNumber integerValue];
        if (resultCode>=0) {
            [self.delegate removeFinished];
        }
        else
        {
            NSString *message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate removeFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *operation,NSError *err){
        [self.delegate removeFailed:err];
    }];
    
    [engine enqueueOperation:op];
}

//修改备忘录方法
-(void)modify:(Note *)model
{
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] initWithHostName:HOST_NAME customHeaderFields:nil];
    NSMutableDictionary *parm = [[NSMutableDictionary alloc] init];
    [parm setValue:USER_ID forKey:@"email"];
    [parm setValue:@"JSON" forKey:@"type"];
    [parm setValue:@"modify" forKey:@"action"];
    [parm setValue:[NSString stringWithFormat:@"%d",model.Id] forKey:@"id"];
    [parm setValue:model.date forKey:@"date"];
    [parm setValue:model.content forKey:@"content"];
    
    MKNetworkOperation *op = [engine operationWithPath:HOST_PATH params:parm];
    [op addCompletionHandler:^(MKNetworkOperation *operation){
        NSData *data = [operation responseData];
        NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSNumber *resultCodeNumber = [resDict objectForKey:@"ResultCode"];
        NSInteger resultCode = [resultCodeNumber integerValue];
        if (resultCode>=0) {
            [self.delegate modifyFinished];
        }
        else
        {
            NSString *message = [resultCodeNumber errorMessage];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObject:message forKey:NSLocalizedDescriptionKey];
            NSError *err = [NSError errorWithDomain:@"DAO" code:resultCode userInfo:userInfo];
            [self.delegate modifyFailed:err];
        }
        
    } errorHandler:^(MKNetworkOperation *operation,NSError *err){
        [self.delegate modifyFailed:err];
    }];
    
    [engine enqueueOperation:op];
}



@end


























































