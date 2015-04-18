//
//  ColorHelper.m
//  QuoteMachine
//
//  Created by Jim Campagno on 4/18/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "ColorHelper.h"

@implementation ColorHelper

+ (UIColor *)randomColor {
    
    CGFloat randomRed = arc4random_uniform(255)/255.0;
    CGFloat randomGreen = arc4random_uniform(255)/255.0;
    CGFloat randomBlue = arc4random_uniform(255)/255.0;
    
    UIColor *randomColor =
    [UIColor colorWithRed:randomRed green:randomGreen blue:randomBlue alpha:1];
    
    return randomColor;
    
}

@end
