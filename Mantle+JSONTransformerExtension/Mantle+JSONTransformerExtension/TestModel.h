//
//  TestModel.h
//  Mantle+JSONTransformerExtension
//
//  Created by chenxiancai on 6/25/15.
//  Copyright (c) 2015 chenxiancai. All rights reserved.
//

#import "Mantle.h"

@interface TestModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString * modelString;
@property (nonatomic, copy) NSNumber * modelNumber;
@property (nonatomic, copy) NSArray *modelArray;
@property (nonatomic, copy) NSDictionary *modelDictionay;
@property (nonatomic, assign) BOOL modelBool;
@property (nonatomic, copy) NSString * modelStringNull;
@property (nonatomic, copy) NSNumber * modelNumberNull;
@property (nonatomic, copy) NSArray *modelArrayNull;
@property (nonatomic, copy) NSDictionary *modelDictionayNull;
@property (nonatomic, assign) BOOL modelBoolNull;
@property (nonatomic, assign) NSInteger modelNSInteger;
@property (nonatomic, assign) NSUInteger modelNSUInteger;
@property (nonatomic, assign) short modelShort;
@property (nonatomic, assign) long modelLong;
@property (nonatomic, assign) char modelChar;
@property (nonatomic, assign) float modelFloat;
@property (nonatomic, assign) double modelDouble;
@property (nonatomic, assign) int modelInt;
@property (nonatomic, assign) int modelBaseNull;
@property (nonatomic, assign) char modelCharNull;
@property (nonatomic, copy) NSDate *modelDate;

@end
