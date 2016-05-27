//
//  NoteDAODelegate.h
//  Persistencelayer
//
//  Created by waber on 16/5/23.
//  Copyright © 2016年 waber. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Note;

@protocol NoteDAODelegate

@optional

//成功查询所有数据的方法
-(void)findAllFinished:(NSMutableArray*)list;
//查询所有数据失败方法
-(void)findAllFailed:(NSError*)error;

//成功按照主键查询数据方法
-(void)findByIdFinished:(Note*)model;
//按照主键查询数据失败方法
-(void)findByIdFailed:(NSError*)error;

//成功插入备忘录方法
-(void)createFinished;
//插入备忘录失败方法
-(void)createFailed:(NSError*)error;

//成功删除备忘录方法
-(void)removeFinished;
//删除备忘录失败方法
-(void)removeFailed:(NSError*)error;

//成功修改备忘录方法
-(void)modifyFinished;
//修改备忘录失败方法
-(void)modifyFailed:(NSError*)error;

@end
