//
//  initialCreationOfGame.h
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "QuoteDataStore.h"
#import <UIKit/UIKit.h>

@class Person;
@class Quotes;

@interface CreatePeople : NSObject

- (instancetype)init;
- (void)setNeilDegrasseTyson:(Person *)person;
- (void)setSuperMario:(Person *)person;
- (void)setMitchHedberg:(Person *)person;
- (void)setFinnTheHuman:(Person *)person;

@end
