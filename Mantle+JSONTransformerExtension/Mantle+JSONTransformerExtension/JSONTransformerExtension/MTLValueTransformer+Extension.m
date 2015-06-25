//
//  MTLValueTransformer+Extension.m
//  Mantle+JSONTransformerExtension
//
//  Created by chenxiancai on 6/24/15.
//  Copyright (c) 2015 chenxiancai. All rights reserved.
//

#import "MTLValueTransformer+Extension.h"
#import <objc/runtime.h>

#define kDefaultString @""
#define kDefaultArray [NSArray array]
#define kDefaultDictionary [NSDictionary dictionary]
#define kDefaultBool NO
#define kDefaultNumber 0
#define kDefaultChar 0
#define kDefaultDate [NSDate date]

@implementation MTLValueTransformer (Extension)

+ (NSString *)stringTransformerWithValue:(id)value{
    if ([MTLValueTransformer nullValue:value]) {
        return kDefaultString;
    }else {
        if ([value isKindOfClass:[NSString class]]) {
            return (NSString *)value;
        }else if ([value isKindOfClass:[NSNumber class]]){
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            return [formatter stringFromNumber:value];
        }else {
            return kDefaultString;
        }
    }
}

+ (NSArray *)arrayTransformerWithValue:(id)value{
    if ([MTLValueTransformer nullValue:value]) {
        return kDefaultArray;
    }else {
        if ([value isKindOfClass:[NSArray class]]) {
            return (NSArray *)value;
        }else {
            return kDefaultArray;
        }
    }
}

+ (NSDictionary *)dictionaryTransformerWithValue:(id)value{
    if ([MTLValueTransformer nullValue:value]) {
        return kDefaultDictionary;
    }else {
        if ([value isKindOfClass:[NSDictionary class]]) {
            return (NSDictionary *)value;
        }else {
            return kDefaultDictionary;
        }
    }
}

+ (id)boolValueTransformerWithValue:(id)value{
    if ([MTLValueTransformer nullValue:value]) {
        return @(kDefaultBool);
    }else {
        if ([value isKindOfClass:[NSNumber class]]) {
            return  (NSNumber *)value;
        }else if([value isKindOfClass:[NSString class]]){
            NSString *str = (NSString *)value;
            return [NSNumber numberWithBool:str.boolValue];
        }else {
            return @(kDefaultBool);
        }
    }
}

+ (NSNumber *)numberTransformerWithValue:(id)value{
    if ([MTLValueTransformer nullValue:value]) {
        return @(kDefaultNumber);
    }else {
        if ([value isKindOfClass:[NSNumber class]]) {
            return  (NSNumber *)value;
        }else if([value isKindOfClass:[NSString class]]){
            NSString *str = (NSString *)value;
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            return [formatter numberFromString:str];
        }else {
            return @(kDefaultNumber);
        }
    }
}

+ (id)charTransformerWithValue:(id)value{
    if ([MTLValueTransformer nullValue:value]) {
        return @(kDefaultChar);
    }else {
        if ([value isKindOfClass:[NSNumber class]]) {
            return  (NSNumber *)value;
        }else if([value isKindOfClass:[NSString class]]){
            NSString *str = (NSString *)value;
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            return [formatter numberFromString:str];
        }else {
            return @(kDefaultChar);
        }
    }
}

+ (id)baseTransformerWithValue:(id)value{
    if ([MTLValueTransformer nullValue:value]) {
        return @(kDefaultNumber);
    }else {
        if ([value isKindOfClass:[NSNumber class]]) {
            return  (NSNumber *)value;
        }else if([value isKindOfClass:[NSString class]]){
            NSString *str = (NSString *)value;
            NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
            return [formatter numberFromString:str];
        }else {
            return @(kDefaultNumber);
        }
    }
}

+ (NSDate *)dateTransformWithValue:(id)value {
    if ([MTLValueTransformer nullValue:value]) {
        return kDefaultDate;
    }else {
        if ([value isKindOfClass:[NSNumber class]]) {
            unsigned long long timestemp = [value unsignedLongLongValue] / 1000;
            return  [NSDate dateWithTimeIntervalSince1970:timestemp];
        }else if([value isKindOfClass:[NSString class]]){
            unsigned long long timestemp = [value unsignedLongLongValue] / 1000;
            return [NSDate dateWithTimeIntervalSince1970:timestemp];
        }else {
            return kDefaultDate;
        }
    }
}

+ (id)transformerWithValue:(id)value
               propertyKey:(NSString *)key
                 className:(Class)className {
    const char *Ckey = [key UTF8String];
    objc_property_t property = class_getProperty(className, Ckey);
    
    //get property name
    const char * name = property_getName(property);
    NSString * propertyName = [NSString stringWithUTF8String:name];
    
    if (propertyName == nil) {
        NSLog(@"错误类型");
        return nil;
    }
    
    //get property type
    const char * attributes = property_getAttributes(property);
    NSString *propertyAttributes = [NSString stringWithUTF8String:attributes];
    
    if ([MTLValueTransformer containsString:@"NSString" from:propertyAttributes]) {
        return [MTLValueTransformer stringTransformerWithValue:value];
    }else if([MTLValueTransformer containsString:@"NSArray" from:propertyAttributes]){
        return [MTLValueTransformer arrayTransformerWithValue:value];
    }else if([MTLValueTransformer containsString:@"NSDictionary" from:propertyAttributes]){
        return [MTLValueTransformer dictionaryTransformerWithValue:value];
    }else if([MTLValueTransformer containsString:@"TB" from:propertyAttributes]){
        return [MTLValueTransformer boolValueTransformerWithValue:value];
    }else if([MTLValueTransformer containsString:@"NSNumber"
                                            from:propertyAttributes] ||
             [MTLValueTransformer containsString:@"Tq"
                                            from:propertyAttributes] ||
             [MTLValueTransformer containsString:@"TQ"
                                            from:propertyAttributes] ||
             [MTLValueTransformer containsString:@"Ts"
                                            from:propertyAttributes] ||
             [MTLValueTransformer containsString:@"Tf"
                                            from:propertyAttributes] ||
             [MTLValueTransformer containsString:@"Td"
                                            from:propertyAttributes] ||
             [MTLValueTransformer containsString:@"Ti"
                                            from:propertyAttributes]){
        return [MTLValueTransformer baseTransformerWithValue:value];
    }else if ([MTLValueTransformer containsString:@"Tc"
                                             from:propertyAttributes]){
        return [MTLValueTransformer charTransformerWithValue:value];
    }else if ([MTLValueTransformer containsString:@"NSDate"
                                             from:propertyAttributes]){
        return [MTLValueTransformer dateTransformWithValue:value];
    }else {
        return nil;
    }
}

+ (BOOL)containsString:(NSString*)other from:(NSString *)str{
    NSRange range = [str rangeOfString:other];
    return range.length != 0;
}

+ (BOOL)nullValue:(id)value {
    return ((NSNull *)value == [NSNull null] || [@"<null>" isEqualToString:(NSString *)value] || [@"(null)" isEqualToString:(NSString *)value] || value == nil);
}

@end
