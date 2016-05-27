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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(findAllFinishedNotification:) name:@"findAllFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(findAllFailedNotification:) name:@"findAllFailed" object:nil];
    [dao findAll];
}
//增加
-(void) createNote:(Note *)model
{
    NoteDAO *dao = [NoteDAO shareManager];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createFinishedNotification:) name:@"createFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(createFailedNotification:) name:@"createFailed" object:nil];
    [dao create:model];
}
//删除
-(void) removeNote:(Note *)model
{
    NoteDAO *dao = [NoteDAO shareManager];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeFinishedNotification:) name:@"removeFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeFailedNotification:) name:@"removeFailed" object:nil];
    [dao remove:model];
}
//修改
-(void) modifyNote:(Note *)model
{
    NoteDAO *dao = [NoteDAO shareManager];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modifyFinishedNotification:) name:@"modifyFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modifyFailedNotification:) name:@"modifyFailed" object:nil];
    [dao modify:model];
}

//创建成功通知
-(void)createFinishedNotification:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"createNoteFinished" object:[notification object]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"createFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"createFailed" object:nil];
}
//创建失败通知
-(void)createFailedNotification:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"createNoteFailed" object:[notification object]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"createFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"createFailed" object:nil];
}

//修改成功通知
-(void)modifyFinishedNotification:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"modifyNoteFinished" object:[notification object]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"modifyFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"modifyFailed" object:nil];
}
//修改失败通知
-(void)modifyFailedNotification:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"modifyNoteFailed" object:[notification object]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"modifyFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"modifyFailed" object:nil];
}

//删除成功通知
-(void)removeFinishedNotification:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"removeNoteFinished" object:[notification object]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"removeFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"removeFailed" object:nil];
}
//删除失败通知
-(void)removeFailedNotification:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"removeNoteFailed" object:[notification object]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"removeFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"removeFailed" object:nil];
}

//查询所有成功通知
-(void)findAllFinishedNotification:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"findAllNotesFinished" object:[notification object]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"findAllFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"findAllFailed" object:nil];
}
//查询所有失败通知
-(void)findAllFailedNotification:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"findAllNotesFailed" object:[notification object]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"findAllFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"findAllFailed" object:nil];
}



@end

















