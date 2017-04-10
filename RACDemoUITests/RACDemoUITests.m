//
//  RACDemoUITests.m
//  RACDemoUITests
//
//  Created by 李强 on 2017/3/17.
//  Copyright © 2017年 李强. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "LQMineCell.h"

@interface RACDemoUITests : XCTestCase

@end

@implementation RACDemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

}

-(void)testMyEditUserInfo{
    XCUIApplication * app = [[XCUIApplication alloc] init];
    [app.tabBars.buttons[@"我的"] tap];
//    [app.tables.staticTexts[@"我的订单"] tap];
    XCUIElement * cell = app.tables.cells.staticTexts[@"TheNameIsNull"];
    [cell tap];
    [app.tables.staticTexts[@"name:TheNameIsNull"] tap];
    XCUIElement *textField = [[[[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextField].element;
    [textField tap];
    [textField typeText:@"helloworld"];
    [app.buttons[@"确  定"] tap];
//    [self expectationForPredicate:[NSPredicate predicateWithFormat:@"self.count = 2"] evaluatedWithObject:app.tables handler:nil];
//    [self waitForExpectationsWithTimeout:2.0 handler:nil];
//    XCUIElement * oldCell = app.tables.staticTexts[@"name:TheNameIsNull"];
//    XCTAssertTrue(oldCell == nil,@"cell中的内容修改不成功");
}

-(void)testMock{
    
}

@end
