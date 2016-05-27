//
//  ViewController.h
//  PresentationLayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessLogicLayer/NoteBLL.h"
#import "Persistencelayer/Note.h"
#import "iAd/iAd.h"

@interface ViewController : UITableViewController<UITextFieldDelegate,UITextViewDelegate,ADBannerViewDelegate>

@property (strong,nonatomic)  NSMutableArray *allNotes;
@property (strong,nonatomic) NoteBLL *bll;
@property (strong,nonatomic) ADBannerView *bannerView;

-(void)reloadTableView;

-(void)reloadData;


//删除成功通知
-(void)removeNoteFinishedNotification:(NSNotification*)notification;
//删除失败通知
-(void)removeNoteFailedNotification:(NSNotification*)notification;

//查询所有成功通知
-(void)findAllNotesFinishedNotification:(NSNotification*)notification;
//查询所有失败通知
-(void)findAllNotesFailedNotification:(NSNotification*)notification;




@end

