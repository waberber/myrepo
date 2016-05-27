//
//  NoteBLL.m
//  BusinessLogicLayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import "NoteBLL.h"

@implementation NoteBLL

//查询所有
-(void) findAllNotes
{
    NoteDAO *dao = [NoteDAO shareManager];
    dao.delegate = self;
    [dao findAll];
}
//增加
-(void) createNote:(Note *)model
{
    NoteDAO *dao = [NoteDAO shareManager];
    dao.delegate = self;
    [dao create:model];
}
//删除
-(void) removeNote:(Note *)model
{
    NoteDAO *dao = [NoteDAO shareManager];
    dao.delegate = self;
    [dao remove:model];
}
//修改
-(void) modifyNote:(Note *)model
{
    NoteDAO *dao = [NoteDAO shareManager];
    dao.delegate = self;
    [dao modify:model];
}

//查询所有数据委托
-(void)findAllFinished:(NSMutableArray *)list
{
    [self.delegate findAllNotesFinished:list];
}
-(void)findAllFailed:(NSError *)error
{
    [self.delegate findAllNotesFailed:error];
}

//增加数据委托
-(void)createFinished
{
    [self.delegate createNoteFinished];
}
-(void)createFailed:(NSError *)error
{
    [self.delegate createNoteFailed:error];
}

//删除数据委托
-(void)removeFinished
{
    [self.delegate removeNoteFinished];
}
-(void)removeFailed:(NSError *)error
{
    [self.delegate removeNoteFailed:error];
}

//修改数据委托
-(void)modifyFinished
{
    [self.delegate modifyNoteFinished];
}
-(void)modifyFailed:(NSError *)error
{
    [self.delegate modifyNoteFailed:error];
}

@end

















