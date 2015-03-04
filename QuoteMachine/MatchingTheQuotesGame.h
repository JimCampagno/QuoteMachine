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
@property (nonatomic) BOOL isCorrectlyChosen; //No logis has been set for this. Do I need this?
@property (strong, nonatomic) NSString *quoteToDisplay;

- (instancetype)initWithPeople:(NSArray *)people; //This is complete and has been implemented.
- (BOOL)isPerson:(Person *)person matchedToQuote:(NSString *)quote; //Implemented but it's not doing anything to the score.
- (NSString *)drawAQuoteToDisplay;
- (NSInteger)score;

@end



//- (NSUInteger)generateRandomNumber:(NSUInteger)count {
//    
//    return arc4random() % count;
//}
//
//
////To Figure out the number of quotes in the Quotes Ready For Game dictionary.
//- (NSUInteger)numberOfQuotesInListOfQuestions:(NSMutableDictionary *)quotesReadyForGame {
//    
//    NSUInteger totalNumberOfQuotes;
//    NSArray *allKeys = [quotesReadyForGame allKeys];
//    
//    for (NSUInteger i = 0 ; i < [quotesReadyForGame count] ; i++) {
//        
//        NSString *nameOfDude = allKeys[i];
//        totalNumberOfQuotes += [[quotesReadyForGame valueForKey:nameOfDude] count];
//    }
//    return totalNumberOfQuotes;
//}


//@property (strong, nonatomic) FISPlayingCardDeck *playingCardDeck; // returns the playingCardDeck in use
//@property (strong, nonatomic) NSNumber *handScore; // returns the total value of cards in the hand
//@property (strong, nonatomic) NSMutableArray *hand;
//@property (nonatomic) BOOL isBusted; // returns YES if handScore is more than 21
//@property (nonatomic) BOOL isBlackjack; // returns YES if handScore is 21
//
//- (id)init; // should initialize playingCardDeck with a new deck and set score and isBusted to default values
//- (void)deal; // should deal 2 new cards, add the cards to the hand, and add the card's value to the handscore.
//- (void)hit; // should deal one additional card, add the card to the hand, and add the card's value to the handscore. If an Ace (11) would bust the player, counts an ace as a 1.