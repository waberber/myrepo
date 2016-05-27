//
//  DetailViewController.h
//  PresentationLayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessLogicLayer/NoteBLL.h"
#import "Persistencelayer/Note.h"

@interface DetailViewController : UIViewController<UITextViewDelegate>

@property NSInteger detailItem;
@property (strong,nonatomic) NSString *detailContent;
@property (strong,nonatomic) NoteBLL *bll;

//修改成功通知
-(void)modifyNoteFinishedNotification:(NSNotification*)notification;
//修改失败通知
-(void)modifyNoteFailedNotification:(NSNotification*)notification;

//-(void) setDetailItem:(NSInteger) item;
//-(void) setDetailContent:(NSString*) content;

@end
