//
//  OCSummer.m
//  Persistencelayer
//
//  Created by waber on 16/5/22.
//  Copyright © 2016年 waber. All rights reserved.
//

#import "OCSummer.h"

@implementation OCSummer


//1.文件使用
-(void) usingFile
{
    //创建文件
    NSString *fieName = @"testFile";
    NSFileManager *fm = [NSFileManager defaultManager];//创建文件管理器实例
    //测试文件是否存在
    if ([fm fileExistsAtPath:fieName] == NO) {
        return;
    }
    //复制文件
    [fm copyItemAtPath:fieName toPath:@"newFile" error:NULL];
    //测试两个文件是否一致
    [fm contentsEqualAtPath:fieName andPath:@"newFile"];
    //重命名文件
    [fm moveItemAtPath:@"newFile" toPath:@"newFile2" error:NULL];
    //获取文件大小
    NSDictionary *attr = [fm attributesOfItemAtPath:fieName error:NULL];
    NSLog(@"file size:%llu bytes",[attr objectForKey:NSFileSize]);
    //删除文件
    [fm removeItemAtPath:fieName error:NULL];
    //显示文件内容
    NSLog(@"%@",[NSString stringWithContentsOfFile:fieName encoding:NSUTF8StringEncoding error:NULL]);
    
}

//2.使用目录
-(void) usingDirectory
{
    //创建文件管理器实例
    NSFileManager *fm = [NSFileManager defaultManager];
    //获取当前目录
    NSString *path = [fm currentDirectoryPath];
    //创建一个新的目录
    [fm createDirectoryAtPath:@"testDir" withIntermediateDirectories:YES attributes:nil error:NULL];
    //重命名新的目录
    [fm moveItemAtPath:@"testDir" toPath:@"newDir" error:NULL];
    //更改目录到新的目录
    [fm changeCurrentDirectoryPath:@"newDir"];
    //获取并线时当工作目录
    path = [fm currentDirectoryPath];
}

//3.枚举目录中的内容
-(void) enumDirectory
{
    //创建文件管理器实例
    NSFileManager *fm = [NSFileManager defaultManager];
    //获取当前工作路径
    NSString *path = [fm currentDirectoryPath];
    //枚举目录
    NSDirectoryEnumerator *dirEnum = [fm enumeratorAtPath:path];
    while ( (path = [dirEnum nextObject]) !=nil ) {
        NSLog(path);
    }
    //另外一种枚举方法
    NSArray *dirArray = [fm contentsOfDirectoryAtPath:[fm currentDirectoryPath] error:NULL];
}

//4.使用路径：NSPathUtilities.h
-(void) usingNSPathUtilities
{
    //创建文件管理器实例
    NSFileManager *fm = [NSFileManager defaultManager];
    //获取临时工作目录
    NSString *tempDir = NSTemporaryDirectory();
    //从当前目录中提取基本目录
    NSString *path = [[fm currentDirectoryPath]  lastPathComponent];
    //创建fName在当前目录中的完整路径
    NSString *fName = @"newFile";
    NSString *fullPath = [path stringByAppendingPathComponent:fName];
    //获取文件扩展名
    NSString *extension = [fullPath pathExtension];
    //获取用户主目录
    NSString *homeDir = NSHomeDirectory();
    //拆分路径成各组部分
    NSArray *components = [homeDir pathComponents];
}

//5.复制文件和使用NSProcessInfo类
-(void) copyFile
{
    NSString *source,*dest;
    //创建文件管理器实例
    NSFileManager *fm = [NSFileManager defaultManager];
    //确认源文件可以读取
    [fm isReadableFileAtPath:source];
    //若目标文件存在则删除
    [fm removeItemAtPath:dest error:NULL];
    //执行复制
    [fm copyItemAtPath:source toPath:dest error:NULL];
}

//6.基本文件操作：NSFileHandle
-(void) usingFileHandle
{
    NSFileHandle *inFile,*outFile;
    NSData *buffer;
    //打开文件testFile并读取
    inFile = [NSFileHandle fileHandleForReadingAtPath:@"testFile"];
    //创建输出文件
    [[NSFileManager defaultManager] createFileAtPath:@"testOut" contents:nil attributes:nil];
    //打开outFile文件并写入
    outFile = [NSFileHandle fileHandleForWritingAtPath:@"testOut"];
    //截断原有数据
    [outFile truncateFileAtOffset:0];
    //从inFile中读取，并写入outFile
    buffer = [inFile readDataToEndOfFile];
    [outFile writeData:buffer];
    //关闭文件
    [inFile closeFile];
    [outFile closeFile];
}

//7.textView控件
    //需要实现UITextFieldDelegate和UITextViewDelegate,在ViewDidLoad中指定委托对象：self.txtView.delegate = self;
    /*UITextField通过委托放弃第一响应者，关闭键盘
    -(BOOL) textFieldShouldReturn:(UITextField *)textField
    {
        [textField resignFirstResponder];
        return YES;
    }
     */
     /*UITextField通过委托放弃第一响应者，关闭键盘
      -(BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
      {
        if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
      }
      return YES;
      }
      */

//8.开关控件UISwitch
-(IBAction)switchValueChanged:(id)sender//为开关指定输出接口
{
    UISwitch *witchSwitch = (UISwitch*)sender;
    BOOL setting = witchSwitch.isOn;//获取开关状态
    [witchSwitch setOn:YES animated:YES];//设置开关打开
    [witchSwitch setOn:NO animated:YES];//设置开关关闭
}

//9.滑块控件UISlider
-(IBAction)sliderValueChange:(id)sender
{
    UISlider *slider = (UISlider*)sender;
    float progressValue = slider.value;//获取滑块控件的值(浮点型)
}

//10.分段控件

//11.网页视图UIWebView






@end





































