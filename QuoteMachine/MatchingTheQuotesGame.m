//
//  MatchingTheQuotesGame.m
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//


#import "MatchingTheQuotesGame.h"
#import "Person+Methods.h"
#import "Quotes.h"
#import "QuoteDataStore.h"

@implementation MatchingTheQuotesGame

- (instancetype)initWithPeople:(NSArray *)people {
    self = [super init];
    
    if (self) {
        
        for (NSInteger i = 0 ; i < [people count] ; i++) {
            Person *individual = people[i];
            NSArray *individualQuotes = [individual.quotes allObjects];
            NSMutableArray *listOfQuotesOfIndividual = [[NSMutableArray alloc] init];
            
            for (Quotes *quote in individualQuotes) {
                [listOfQuotesOfIndividual addObject:quote.quote];
            }
            
            [self.quotesReadyForQuiz setValue:listOfQuotesOfIndividual forKey:individual.name];
        }
    }
    
    return self;
}

- (NSMutableArray *)holdingTheQuotesAlreadyDisplayed {
    if (!_holdingTheQuotesAlreadyDisplayed) {
        _holdingTheQuotesAlreadyDisplayed = [[NSMutableArray alloc] init];
    }
    
    return _holdingTheQuotesAlreadyDisplayed;
}

- (NSMutableDictionary *)quotesReadyForQuiz {
    if (!_quotesReadyForQuiz) {
        _quotesReadyForQuiz = [[NSMutableDictionary alloc] init];
    }
    return _quotesReadyForQuiz;
}

- (NSNumber *)scoreOfGame {
    if (!_scoreOfGame) {
        _scoreOfGame = @0;
    }
    return _scoreOfGame;
}

- (NSString *)randomQuotePicked {
    if (!_randomQuotePicked) {
        _randomQuotePicked = [[NSString alloc] init];
    }
    
    return _randomQuotePicked;
}

- (BOOL)isPerson:(Person *)person matchedToQuote:(NSString *)quote {
    
    if ([[self.quotesReadyForQuiz valueForKey:person.name] containsObject:quote]) {
        NSLog (@"You picked the correct Quote!");
        return YES;
    }
    else {
        return NO;
    }
}

- (NSString *)drawAQuoteToDisplay {
    
    [self pickingARandomQuote];
    
    while ([self.holdingTheQuotesAlreadyDisplayed containsObject:self.randomQuotePicked]) {
        
        [self pickingARandomQuote];
    }
    
    [self.holdingTheQuotesAlreadyDisplayed addObject:self.randomQuotePicked];
    return self.randomQuotePicked;
}


- (void)pickingARandomQuote {
    
    NSArray *allKeys = [self.quotesReadyForQuiz allKeys];
    NSString *randomPersonChosen = allKeys[arc4random_uniform((uint32_t) allKeys.count)];
    NSUInteger randomQuoteNumber =arc4random_uniform((uint32_t) [[self.quotesReadyForQuiz valueForKey:randomPersonChosen] count]);
    NSArray *listOfQuotesForPersonChosen = [self.quotesReadyForQuiz valueForKey:randomPersonChosen];
    self.randomQuotePicked = listOfQuotesForPersonChosen[randomQuoteNumber];
    
}

@end