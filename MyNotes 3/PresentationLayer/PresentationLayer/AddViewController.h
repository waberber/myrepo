//
//  AddViewController.h
//  PresentationLayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessLogicLayer/NoteBLL.h"
#import "Persistencelayer/Note.h"

@interface AddViewController : UIViewController<UITextViewDelegate>

@property(strong,nonatomic)NoteBLL *bll;

//增加成功通知
-(void)createNoteFinishedNotification:(NSNotification*)notification;
//增加失败通知
-(void)createNoteFailedNotification:(NSNotification*)notification;

@end
