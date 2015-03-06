//
//  MatchingTheQuotesGame.h
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;
@class Quotes;

@interface MatchingTheQuotesGame : NSObject

@property (strong, nonatomic) NSMutableDictionary *quotesReadyForQuiz; //This is complete and has been implemented as part of the initWithPeople method below.
@property (strong, nonatomic) NSNumber *scoreOfGame; //This has been set to @0, no logic has been established yet.
@property (strong, nonatomic) NSMutableArray *holdingTheQuotesAlreadyDisplayed; // This has been implemented and SHOULD work. Did some minor testing here (not testing within the view)
@property (strong, nonatomic) NSString *randomQuotePicked; // THis apperas to be working, text within the controller

- (instancetype)initWithPeople:(NSArray *)people; //This is complete and has been implemented.
- (BOOL)isPerson:(Person *)person matchedToQuote:(NSString *)quote; //Implemented but it's not doing anything to the score.
- (NSString *)drawAQuoteToDisplay; //This has been implemented.

@end