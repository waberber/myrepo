//
//  DetailViewController.m
//  PresentationLayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import "DetailViewController.h"
#import "BusinessLogicLayer/NoteBLL.h"
#import "Persistencelayer/Note.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtView;

@end

@implementation DetailViewController

@synthesize detailItem,detailContent;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.txtView.text = self.detailContent;
    self.txtView.delegate = self;
    
    self.bll = [[NoteBLL alloc] init];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modifyNoteFinishedNotification:) name:@"modifyNoteFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modifyNoteFailedNotification:) name:@"modifyNoteFailed" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CalcelButtonClick:(id)sender {
    [self.txtView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

//保存按钮
- (IBAction)SaveButtonClick:(id)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *today = [NSDate new];
    NSString *strToday = [formatter stringFromDate:today];
    NSString *content = self.txtView.text;
    
    Note *note = [[Note alloc] initWithDate:strToday content:content Id:self.detailItem];
    [self.bll modifyNote:note];

    
   
}

////修改信息回调函数
//-(void)modifyNoteFinished
//{
//    [self.txtView resignFirstResponder];
//    [self dismissViewControllerAnimated:YES completion:NULL];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"ModifyNoteSuccessd" object:nil];
//}
//-(void)modifyNoteFailed:(NSError *)error
//{
//    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"修改失败" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//    [controller addAction:okAction];
//    [self presentViewController:controller animated:YES completion:nil];
//}

//修改成功通知
-(void)modifyNoteFinishedNotification:(NSNotification*)notification
{
    [self.txtView resignFirstResponder];
  //  [self dismissViewControllerAnimated:YES completion:NULL];
   
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ModifyNoteSuccessd" object:nil];
    
     [self.navigationController popViewControllerAnimated:YES];
}
//修改失败通知
-(void)modifyNoteFailedNotification:(NSNotification*)notification
{
    NSError *error = [notification object];
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"修改失败" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:okAction];
    [self presentViewController:controller animated:YES completion:nil];
}

@end































