//
//  NoteBLLDelegate.h
//  BusinessLogicLayer
//
//  Created by waber on 16/5/23.
//  Copyright © 2016年 waber. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NoteBLLDelegate <NSObject>

@optional

//成功查询所有数据方法
-(void)findAllNotesFinished:(NSMutableArray*)list;
//查询所有数据失败方法
-(void)findAllNotesFailed:(NSError*)err;

//成功按照主键查询数据方法
-(void)findByIdFinished:(Note*)model;
//按照主键查询数据失败方法
-(void)findByIdFailed:(NSError*)error;

//成功插入备忘录方法
-(void)createNoteFinished;
//插入备忘录失败方法
-(void)createNoteFailed:(NSError*)error;

//成功删除备忘录方法
-(void)removeNoteFinished;
//删除备忘录失败方法
-(void)removeNoteFailed:(NSError*)error;

//成功修改备忘录方法
-(void)modifyNoteFinished;
//修改备忘录失败方法
-(void)modifyNoteFailed:(NSError*)error;

@end
