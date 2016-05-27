//
//  NoteBLL.h
//  BusinessLogicLayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Persistencelayer/NoteDAO.h"
#import "Persistencelayer/Note.h"

@interface NoteBLL : NSObject


//创建
-(void) createNote:(Note*)model;

//修改
-(void) modifyNote:(Note*)model;

//删除
-(void) removeNote:(Note*)model;

//查询所有
-(void) findAllNotes;

//创建成功通知
-(void)createFinishedNotification:(NSNotification*)notification;
//创建失败通知
-(void)createFailedNotification:(NSNotification*)notification;

//修改成功通知
-(void)modifyFinishedNotification:(NSNotification*)notification;
//修改失败通知
-(void)modifyFailedNotification:(NSNotification*)notification;

//删除成功通知
-(void)removeFinishedNotification:(NSNotification*)notification;
//删除失败通知
-(void)removeFailedNotification:(NSNotification*)notification;

//查询所有成功通知
-(void)findAllFinishedNotification:(NSNotification*)notification;
//查询所有失败通知
-(void)findAllFailedNotification:(NSNotification*)notification;

@end
