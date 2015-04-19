//
//  MatchingTheQuotesGame.h
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Person;
@class Quotes;

@interface MatchingTheQuotesGame : NSObject

@property (strong, nonatomic) NSMutableDictionary *quotesReadyForQuiz;
@property (strong, nonatomic) NSNumber *scoreOfGame;
@property (strong, nonatomic) NSMutableArray *holdingTheQuotesAlreadyDisplayed;
@property (strong, nonatomic) NSString *randomQuotePicked;

- (instancetype)initWithPeople:(NSArray *)people;
- (BOOL)isPerson:(Person *)person matchedToQuote:(NSString *)quote;
- (NSString *)drawAQuoteToDisplay;
- (void)displayInstructionAndFirstQuoteWithLabel:(UILabel *)label;
- (void)displayANewQuoteWithLabel:(UILabel *)label;
- (void)makeAGuessWithPerson:(Person *)person toQuoteInLabel:(UILabel *)label inView:(UIView *)view withScoreLabel:(UILabel *)score;

@end