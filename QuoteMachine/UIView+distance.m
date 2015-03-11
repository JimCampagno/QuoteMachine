//
//  UIView+distance.m
//  QuoteMachine
//
//  Created by Kavan Brandon on 3/8/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "UIView+distance.h"

@implementation UIView (distance)

-(double)distanceToView:(UIView *)view
{
    return sqrt(pow(view.center.x-self.center.x, 2) + pow(view.center.y - self.center.y, 2));
}

@end

