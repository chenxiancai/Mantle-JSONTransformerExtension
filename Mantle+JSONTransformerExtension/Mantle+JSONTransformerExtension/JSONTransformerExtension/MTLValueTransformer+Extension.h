//
//  MTLValueTransformer+Extension.h
//  Mantle+JSONTransformerExtension
//
//  Created by chenxiancai on 6/24/15.
//  Copyright (c) 2015 chenxiancai. All rights reserved.
//

#import "MTLValueTransformer.h"

@interface MTLValueTransformer (Extension)

/**
 *  transform value to match the property type and avoid null value
 *
 *  @param value     value to transform
 *  @param key       property key name
 *  @param className class
 *
 *  @return transform value
 */
+ (id)transformerWithValue:(id)value
               propertyKey:(NSString *)key
                 className:(Class)className;

@end
