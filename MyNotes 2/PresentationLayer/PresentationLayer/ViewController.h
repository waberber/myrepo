//
//  ViewController.h
//  PresentationLayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessLogicLayer/NoteBLL.h"
#import "BusinessLogicLayer/NoteBLLDelegate.h"
#import "Persistencelayer/Note.h"

@interface ViewController : UITableViewController<UITextFieldDelegate,UITextViewDelegate,NoteBLLDelegate>

@property (strong,nonatomic)  NSMutableArray *allNotes;
@property (strong,nonatomic) NoteBLL *bll;

-(void)reloadTableView;

-(void)reloadData;


@end

