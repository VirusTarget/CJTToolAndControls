//
//  checkTests.m
//  CJTToolAndControlsTests
//
//  Created by 陈晋添 on 2018/3/22.
//  Copyright © 2018年 cjt. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+Check.h"

@interface checkTests : XCTestCase

@end

@implementation checkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPhoneNumber {
    XCTAssertFalse([@"01234567891" isPhoneValid]);
    XCTAssertFalse([@"0123423" isPhoneValid]);
    XCTAssertFalse([@"你好，～" isPhoneValid]);
    XCTAssertFalse([@"15429095829" isPhoneValid]);
    XCTAssertFalse([@"1234567@qq.com" isPhoneValid]);
    XCTAssertFalse([@"Az123456" isPhoneValid]);
    XCTAssertFalse([@"az123456" isPhoneValid]);
    XCTAssertFalse([@"" isPhoneValid]);
    XCTAssertTrue([@"15000000000" isPhoneValid]);
}

- (void)testPassword {
    XCTAssertFalse([@"12345@qq.com" isPasswordValid]);
    XCTAssertFalse([@"123456789qqcom" isPasswordValid]);
    XCTAssertFalse([@"你好，～" isPasswordValid]);
    XCTAssertFalse([@"12345" isPasswordValid]);
    XCTAssertFalse([@"" isPasswordValid]);
    XCTAssertTrue([@"15000000000" isPasswordValid]);
    XCTAssertTrue([@"Az123456" isPasswordValid]);
    XCTAssertTrue([@"az123456" isPasswordValid]);
}

- (void)testAccount {
    XCTAssertFalse([@"你好，～" isAccountValid]);
    XCTAssertFalse([@"123" isAccountValid]);
    XCTAssertFalse([@"" isAccountValid]);
    XCTAssertFalse([@"Az123456" isAccountValid]);
    XCTAssertFalse([@"123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890" isAccountValid]);
    XCTAssertTrue([@"123456789qqcom" isAccountValid]);
    XCTAssertTrue([@"1234" isAccountValid]);
    XCTAssertTrue([@"qqcom" isAccountValid]);
    XCTAssertTrue([@"01234567891" isAccountValid]);
    XCTAssertTrue([@"15000000000" isAccountValid]);
    XCTAssertTrue([@"az123456" isAccountValid]);
    XCTAssertTrue([@"1234567@qq.com" isAccountValid]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
