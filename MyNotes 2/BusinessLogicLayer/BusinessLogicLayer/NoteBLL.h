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
#import "Persistencelayer/NoteDAODelegate.h"
#import "NoteBLLDelegate.h"

@interface NoteBLL : NSObject <NoteDAODelegate>

@property (weak,nonatomic) id <NoteBLLDelegate> delegate;

//创建
-(void) createNote:(Note*)model;

//修改
-(void) modifyNote:(Note*)model;

//删除
-(void) removeNote:(Note*)model;

//查询所有
-(void) findAllNotes;

@end
