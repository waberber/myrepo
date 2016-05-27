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
#import "BusinessLogicLayer/NoteBLLDelegate.h"

@interface DetailViewController : UIViewController<UITextViewDelegate,NoteBLLDelegate>

@property NSInteger detailItem;
@property (strong,nonatomic) NSString *detailContent;
@property (strong,nonatomic) NoteBLL *bll;

//-(void) setDetailItem:(NSInteger) item;
//-(void) setDetailContent:(NSString*) content;

@end
