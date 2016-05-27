//
//  ViewController.m
//  PresentationLayer
//
//  Created by waber on 16/5/21.
//  Copyright © 2016年 waber. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize allNotes;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //广告
    self.bannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    self.bannerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.bannerView.delegate = self;
    [self.view addSubview:self.bannerView];
    
    
    //注册监听通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"AddNoteSuccessd" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"ModifyNoteSuccessd" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(findAllNotesFinishedNotification:) name:@"findAllNotesFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(findAllNotesFailedNotification:) name:@"findAllNotesFailed" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeNoteFinishedNotification:) name:@"removeNoteFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeNoteFailedNotification:) name:@"removeNoteFailed" object:nil];
    
    
    self.bll = [[NoteBLL alloc] init];
    [self.bll findAllNotes];
    
    //下拉刷新控件
    UIRefreshControl *rc = [[UIRefreshControl alloc] init];
    rc.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [rc addTarget:self action:@selector(reloadTableView) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = rc;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = [self.allNotes  count];
    return count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    Note *note = [self.allNotes objectAtIndex:row];
    cell.textLabel.text = note.content;
    cell.detailTextLabel.text = note.date;
    
    
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Note *note = [self.allNotes objectAtIndex:[indexPath row] ];
        
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        
        [controller setDetailItem:note.Id];
        [controller setDetailContent:note.content];
    }
}


-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

//删除备忘录
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Note *note = [self.allNotes objectAtIndex:[indexPath row]];
        [self.bll removeNote:note];
    }
}

-(void)reloadData
{
    [self.refreshControl beginRefreshing];
    [self reloadTableView];
}

-(void) reloadTableView
{
    if (self.refreshControl.refreshing) {
        self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"加载中..."];
        //重新加载数据
        self.allNotes = nil;
        [self.bll findAllNotes];
    }
}


////查询所有备忘录委托
//-(void)findAllNotesFinished:(NSMutableArray *)list
//{
//    self.allNotes = list;
//    [self.refreshControl endRefreshing];
//    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
//    [self.tableView reloadData];
//}
//-(void)findAllNotesFailed:(NSError *)err
//{
//    self.allNotes = nil;
//    [self.refreshControl endRefreshing];
//    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
//    NSLog(@"查询数据失败");
//}
//
////删除备忘录委托
//-(void) removeNoteFinished
//{
//    [self reloadData];
//}
//-(void)removeNoteFailed:(NSError *)error
//{
//    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示信息" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//    [controller addAction:okAction];
//    [self presentViewController:controller animated:YES completion:nil];
//}

//删除成功通知
-(void)removeNoteFinishedNotification:(NSNotification*)notification
{
    [self reloadData];
}
//删除失败通知
-(void)removeNoteFailedNotification:(NSNotification*)notification
{
    NSError *error = [notification object];
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"提示信息" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [controller addAction:okAction];
    [self presentViewController:controller animated:YES completion:nil];
}

//查询所有成功通知
-(void)findAllNotesFinishedNotification:(NSNotification*)notification
{
    self.allNotes = [notification object];
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [self.tableView reloadData];

}
//查询所有失败通知
-(void)findAllNotesFailedNotification:(NSNotification*)notification
{
    self.allNotes = nil;
    [self.refreshControl endRefreshing];
    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    NSLog(@"查询数据失败");
}


//iAd广告委托
-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"加载广告成功");
}
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"加载广告失败，%@",[error localizedDescription]);
}
-(void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    NSLog(@"广告关闭");
    [self.bannerView removeFromSuperview];
}






@end





































