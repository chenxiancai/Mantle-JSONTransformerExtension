//
//  TestModel.m
//  Mantle+JSONTransformerExtension
//
//  Created by chenxiancai on 6/25/15.
//  Copyright (c) 2015 chenxiancai. All rights reserved.
//

#import "TestModel.h"
#import "MTLValueTransformer+Extension.h"

@implementation TestModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"modelString": @"testString",
             @"modelNumber": @"testNumber",
             @"modelArray": @"testArray",
             @"modelDictionay": @"testDictionay",
             @"modelBool": @"testBool",
             @"modelStringNull": @"testStringNull",
             @"modelNumberNull": @"testNumberNull",
             @"modelArrayNull": @"testArrayNull",
             @"modelDictionayNull": @"testDictionayNull",
             @"modelBoolNull": @"testBoolNull",
             @"modelNSInteger": @"testNSInteger",
             @"modelNSUInteger": @"testNSUInteger",
             @"modelShort": @"testShort",
             @"modelLong": @"testLong",
             @"modelChar": @"testChar",
             @"modelFloat": @"testFloat",
             @"modelDouble": @"testDouble",
             @"modelInt": @"testInt",
             @"modelBaseNull": @"testBaseNull",
             @"modelCharNull": @"testCharNull",
             @"modelDate": @"testDate"
             };
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key {
    return [MTLValueTransformer  transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        return [MTLValueTransformer transformerWithValue:value propertyKey:key className:[TestModel class]];
    }];
}

@end
