//
//  ImageToDataTransformer.m
//  QuoteMachine
//
//  Created by Jim Campagno on 4/13/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "ImageToDataTransformer.h"
#import <UIKit/UIKit.h>

@implementation ImageToDataTransformer


+ (BOOL)allowsReverseTransformation {
    return YES;
}


+ (Class)transformedValueClass {
    return [NSData class];
}


- (id)transformedValue:(id)value {
    return UIImagePNGRepresentation(value);
}


- (id)reverseTransformedValue:(id)value {
    return [[UIImage alloc] initWithData:value];
}

@end
