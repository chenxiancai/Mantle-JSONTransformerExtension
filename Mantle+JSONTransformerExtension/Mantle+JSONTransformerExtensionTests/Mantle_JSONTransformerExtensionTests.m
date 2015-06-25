//
//  Mantle_JSONTransformerExtensionTests.m
//  Mantle+JSONTransformerExtensionTests
//
//  Created by chenxiancai on 6/24/15.
//  Copyright (c) 2015 chenxiancai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Mantle.h"
#import "TestModel.h"

@interface Mantle_JSONTransformerExtensionTests : XCTestCase

@end

@implementation Mantle_JSONTransformerExtensionTests

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
    TestModel *testModel = [MTLJSONAdapter modelOfClass:[TestModel class] fromJSONDictionary:[self testDictionary] error:nil];
    NSLog(@"%@", testModel);
    
    XCTAssertTrue([testModel.modelString isEqualToString:@"test"]);
    XCTAssertTrue(testModel.modelNumber.integerValue == 1);
    XCTAssertTrue([testModel.modelArray[0] isEqualToString:@"test"]);
    XCTAssertTrue([testModel.modelArray[1] isEqualToString:@"1"]);
    XCTAssertTrue([testModel.modelDictionay[@"test"] integerValue] == 1);
    XCTAssertTrue(testModel.modelBool);
    XCTAssertTrue([testModel.modelStringNull isEqualToString:@""]);
    XCTAssertTrue(testModel.modelNumberNull.integerValue == 0);
    XCTAssertTrue([testModel.modelArrayNull count] == 0);
    XCTAssertTrue([testModel.modelDictionayNull count] == 0);
    XCTAssertTrue(!testModel.modelBoolNull);
    XCTAssertTrue(testModel.modelNSInteger == -1);
    XCTAssertTrue(testModel.modelNSUInteger == 1);
    XCTAssertTrue(testModel.modelShort == 1);
    XCTAssertTrue(testModel.modelLong == 1);
    XCTAssertTrue(testModel.modelChar == 97);
    XCTAssertTrue(testModel.modelFloat - 1.1 < 0.0001);
    XCTAssertTrue(testModel.modelDouble - 1.1 < 0.0000001);
    XCTAssertTrue(testModel.modelInt == 1);
    XCTAssertTrue(testModel.modelBaseNull == 0);
    XCTAssertTrue(testModel.modelCharNull == 0);
    unsigned long long timestemp = [testModel.modelDate timeIntervalSince1970];
    NSNumber *testTimestemp = [[self testDictionary]  objectForKey:@"testDate"];
    XCTAssertTrue(timestemp == testTimestemp.unsignedLongLongValue / 1000);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (NSDictionary *)testDictionary {
    return @{@"testString": @"test",
             @"testNumber": @"1",
             @"testArray": @[@"test",@"1"],
             @"testDictionay": @{@"test": @"1"},
             @"testBool": @(YES),
             @"testStringNull": [NSNull null],
             @"testNumberNull": [NSNull null],
             @"testArrayNull": [NSNull null],
             @"testDictionayNull": [NSNull null],
             @"testBoolNull": [NSNull null],
             @"testNSInteger": @(-1),
             @"testNSUInteger": @(1),
             @"testShort":@(1),
             @"testLong": @(1),
             @"testChar": @'a',
             @"testFloat": @(1.1),
             @"testDouble": @(1.1),
             @"testInt": @(1),
             @"testBaseNull": [NSNull null],
             @"testCharNull": [NSNull null],
             @"testDate": @([[NSDate date] timeIntervalSince1970] * 1000)};
}

@end
