//
//  MatchingTheQuotesGame.m
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//


//@property (strong, nonatomic) NSMutableDictionary *quotesReadyForQuiz;
//@property (strong, nonatomic) NSNumber *scoreOfGame;
//@property (nonatomic) BOOL isCorrectlyChosen;

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

- (BOOL)isPerson:(Person *)person matchedToQuote:(NSString *)quote {
    
    if ([[self.quotesReadyForQuiz valueForKey:person.name] containsObject:quote]) {
        NSLog (@"You picked the correct Quote!");
        return YES;
    }
    else {
        return NO;
    }
}

#warning this is where I left off on Wednesday 11:15 AM
//- (NSString *)drawAQuoteToDisplay {
//    
//    
//    
//    
//    
//    
//    
//    
//    //In speaking with Zach, we can make a copy of the Dictionary (which in this case is the self.quotesReadyForQuiz and then use that copy.  We produce a random number and then actually REMOVE that item from the dictionary.  The random number produced will then be one less because of the previously removed item.
//    
//    
//}








//@property (strong, nonatomic) NSMutableDictionary *quotesReadyForQuiz;
//@property (strong, nonatomic) NSNumber *scoreOfGame;
//@property (nonatomic) BOOL isCorrectlyChosen;
//
//- (instancetype)initWithPeople:(NSArray *)people;
//- (BOOL)isPersonMatchedToQuote:(Person *)person displayedQuote:(Quotes *)quote;
//- (NSString *)drawQuoteToDisplay;
//- (NSInteger)score;

//NSLog (@"Test");
//
//Person *test = self.dataStore.quotesReadyForGame[0];
////    NSLog (@"%@", test);
//
//NSLog (@"%@", test.name);
//NSArray *testQuotes = [test.quotes allObjects];
//
//NSMutableArray *listOfMarioQuotes = [[NSMutableArray alloc] init];
//
//for (Quotes *quote in testQuotes) {
//    [listOfMarioQuotes addObject:quote.quote];
//}
//NSLog (@"The quotes for %@ are %@", test.name, listOfMarioQuotes);
//
//NSMutableDictionary *holdingThePersonAndQuotes = [[NSMutableDictionary alloc] init];
//
//
//[holdingThePersonAndQuotes setValue:listOfMarioQuotes forKey:@"Mario"];
//
////    for (NSString *quote in listOfMarioQuotes) {
////        [holdingThePersonAndQuotes setValue:quote forKey:@"Mario"];
////    }
//
//NSLog (@" --------------- TESTING -----------");
//
//NSLog(@"%@", holdingThePersonAndQuotes);
//
//
//NSString *wrongAnswer = @"I like the color red";
//NSString *rightAnswer = @"Here I go!";
//
//NSMutableArray *jimTest = [[NSMutableArray alloc] init];
//for (NSString *inn in [holdingThePersonAndQuotes valueForKey:@"Mario"]) {
//    [jimTest addObject:inn];
//}
//
//if ([jimTest containsObject:rightAnswer]) {
//    NSLog (@"MUCH MUCH BETTER WAY1!! WINNE");
//}
//
//if ([[holdingThePersonAndQuotes valueForKey:@"Mario"] containsObject:rightAnswer]) {
//    NSLog (@"WOW THIS WOULD BE GOOD, RIGHT ANSWER");
//}



@end

//@property (strong, nonatomic) NSMutableDictionary *quotesReadyForQuiz;
//@property (strong, nonatomic) NSNumber *scoreOfGame;
//@property (nonatomic) BOOL isCorrectlyChosen;
//
//- (instancetype)initWithPeople:(NSArray *)people;
//- (BOOL)isPersonMatchedToQuote:(Person *)person displayedQuote:(Quotes *)quote;
//- (NSString *)drawQuoteToDisplay;
//- (NSInteger)score;


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