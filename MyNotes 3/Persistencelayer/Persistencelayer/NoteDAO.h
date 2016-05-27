//
//  NoteDAO.h
//  Persistencelayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
#import "NSNumber+ErrorMessage.h"

#define HOST_PATH @"/service/mynotes/WebService.php"
#define HOST_NAME @"51work6.com"
#define USER_ID @"584991749@qq.com"

@interface NoteDAO : NSObject

@property (strong,nonatomic)NSMutableArray *listData;//返回内容

//增加
-(void) create:(Note*) model;

//删除
-(void) remove:(Note*)model;

//查询所有
-(void) findAll;

//修改
-(void) modify:(Note*) model;

+(NoteDAO*) shareManager;

@end
