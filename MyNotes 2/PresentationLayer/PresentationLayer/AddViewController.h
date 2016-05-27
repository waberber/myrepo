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
#import "BusinessLogicLayer/NoteBLLDelegate.h"

@interface AddViewController : UIViewController<UITextViewDelegate,NoteBLLDelegate>

@property(strong,nonatomic)NoteBLL *bll;

@end
