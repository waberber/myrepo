//
//  AddViewController.m
//  PresentationLayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import "AddViewController.h"


@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UITextView *txtContent;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.bll = [[NoteBLL alloc] init];
    self.bll.delegate = self;
    
    self.txtContent.delegate = self;
    [self.txtContent becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//保存按钮点击事件
- (IBAction)SaveButtonClick:(id)sender {
  //  NoteBLL *bll = [[NoteBLL alloc] init];
  //  bll.delegate = self;
    
    NSDate *today = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前系统时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strToday = [formatter stringFromDate:today];//将时间转换为字符串
    NSString *theContent = self.content.text;//获取输入内容

    Note *note = [[Note alloc] initWithDate:strToday content:theContent];//创建一条记录
    
    [self.bll createNote:note];
//
//    BOOL result = [bll createNote:note];//调用业务逻辑层方法创建纪录
//    if (result) {
////        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"操作成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
////        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
////            [self.txtContent resignFirstResponder];
////            [self dismissViewControllerAnimated:YES completion:^{
////                [[NSNotificationCenter defaultCenter] postNotificationName:@"AddNoteSuccessd" object:nil];
////            }];
////        }];
////        [controller addAction:okAction];
////        [self presentViewController:controller animated:YES completion:nil];
//        
//        [self.txtContent resignFirstResponder];
//        [self dismissViewControllerAnimated:YES completion:nil];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"AddNoteSuccessd" object:nil];
//        
//         }
//    else
//    {
//        
//        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"操作失败" message:@"操作失败" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//        [controller addAction:okAction];
//        [self presentViewController:controller animated:YES completion:nil];
//
//    }
}

//取消按钮点击事件
- (IBAction)CancelButtonClick:(id)sender {
    [self.txtContent resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//创建备忘录回调函数
-(void)createNoteFinished
{
    [self.txtContent resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AddNoteSuccessd" object:nil];
}
-(void)createNoteFailed:(NSError *)error
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示信息" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:okAction];
    [self presentViewController:controller animated:YES completion:nil];
}
@end













































