//
//  PersistencelayerTests.m
//  PersistencelayerTests
//
//  Created by waber on 16/5/26.
//  Copyright © 2016年 waber. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NoteDAO.h"

@interface PersistencelayerTests : XCTestCase

@property (strong,nonatomic)XCTestExpectation *expectation;

@end

@implementation PersistencelayerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)findAllFinishedNotification:(NSNotification*)notification
{
    [self.expectation fulfill];
    XCTAssert(true,@"查询所有数据方法成功");
    
    NSMutableArray *allNotes = [notification object];
    XCTAssertEqual([allNotes count], 5,@"查询正确");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"findAllFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"findAllFailed" object:nil];
}
-(void)findAllFailedNotification:(NSNotification*)notification
{
    [self.expectation fulfill];
    NSError *error = [notification object];
    XCTAssertNotNil(error);
    XCTFail(@"查询所有方法失败");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"findAllFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"findAllFailed" object:nil];
    
}

-(void)testFindAll
{
    self.expectation = [self expectationWithDescription:@"request NotesURL"];
    NoteDAO *dao = [NoteDAO shareManager];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(findAllFinishedNotification:) name:@"findAllFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(findAllFailedNotification:) name:@"findAllFailed" object:nil];
    [dao findAll];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

@end

























