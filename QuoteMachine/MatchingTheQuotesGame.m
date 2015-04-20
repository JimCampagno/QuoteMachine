//
//  MatchingTheQuotesGame.m
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//


#import "MatchingTheQuotesGame.h"
#import "Person.h"
#import "Quotes.h"
#import "QuoteDataStore.h"

@implementation MatchingTheQuotesGame


#pragma mark - Initliazing Game

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

#pragma mark - Game logic

- (BOOL)isPerson:(Person *)person matchedToQuote:(NSString *)quote {
    
    if ([[self.quotesReadyForQuiz valueForKey:person.name] containsObject:quote]) {
        
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

- (void)displayInstructionAndFirstQuoteWithLabel:(UILabel *)label {
    
    label.alpha = 0.0;
    label.text = @"A quote will display here.  Tap the person who you think said it.";
    
    [UIView animateWithDuration:1.5
                     animations:^{
                         
                         label.alpha = 1.0;
                     }
                     completion:^ (BOOL finished) {
                         
                         [UIView animateWithDuration:2.0 animations:^{
                             
                             label.alpha = 0.0;
                         } completion:^(BOOL finished) {
                             
                             label.text = [self drawAQuoteToDisplay];
                             
                             [UIView animateWithDuration:5.0 animations:^{
                                 
                                 label.alpha = 1.0;
                             }];
                         }];
                     }];
}

- (void)displayANewQuoteWithLabel:(UILabel *)label {
    
    if ([self.holdingTheQuotesAlreadyDisplayed count] == 12) {
        
        NSString *displayTheFinalScore = [NSString stringWithFormat:@"%@ out of 12.", [self.scoreOfGame stringValue] ];
        label.text = displayTheFinalScore;
        UIColor *color = [UIColor blueColor];
        [label setTextColor:color];
        
    }
    else {
        
        [UIView animateWithDuration:1.0 animations:^{
            label.alpha = 0.0f;
            
        } completion:^(BOOL finished) {
            label.textColor = [UIColor blackColor];
            label.font=[label.font fontWithSize:24];
            label.text = [self drawAQuoteToDisplay];
            [UIView animateWithDuration:1.0 animations:^{
                label.alpha = 1.0f;
            }];
        }];
    }
}

- (void)makeAGuessWithPerson:(Person *)person toQuoteInLabel:(UILabel *)label inView:(UIView *)view withScoreLabel:(UILabel *)score {
    
    
    if ([self isPerson:person matchedToQuote:label.text])
    {
        [UIView animateWithDuration:0.3
                         animations:^{
                             
                             view.layer.backgroundColor = [UIColor greenColor].CGColor;
                             self.scoreOfGame = [NSNumber numberWithInt:[self.scoreOfGame intValue] + 1];
                             score.text = [self.scoreOfGame stringValue];
                             
                         }
                         completion:^ (BOOL finished) {
                             
                             [UIView animateWithDuration:2.0 animations:^{
                                 
                                 
                                 view.layer.backgroundColor = [UIColor whiteColor].CGColor;
                                 [self displayANewQuoteWithLabel:label];
                             }];
                             
                         }];
    } else {
        
        label.alpha = 0.0;
        label.textColor = [UIColor whiteColor];
        label.font=[label.font fontWithSize:28];
        NSString *firstPart = [self returnCorrectPersonWithQuote:label.text];
        NSString *secondPart = @" said it.";
        
        NSString *message = [firstPart stringByAppendingString:secondPart];
        label.text = message;
    
        [UIView animateWithDuration:0.3
                         animations:^{
                             
                             view.layer.backgroundColor = [UIColor redColor].CGColor;

                         }
                         completion:^(BOOL finished) {
                             
                             [UIView animateWithDuration:0.3
                              
                                              animations:^{
                                                  
                                                  label.alpha = 1.0;
                                              }
                                              completion:^ (BOOL finished) {
                                                  
                                                  [UIView animateWithDuration:1.7
                                                                   animations:^{
                                                                       view.layer.backgroundColor =
                                                                       [UIColor whiteColor].CGColor;
                                                            
                                                                       [self displayANewQuoteWithLabel:label];
                                                                       
                                                                   }];
                                              }];
                         }];
    }
}


- (NSString *)returnCorrectPersonWithQuote:(NSString *)quote {
    
    NSString *result = @"";
    
    for (NSString *key in self.quotesReadyForQuiz) {
        
        NSMutableArray *value = [self.quotesReadyForQuiz objectForKey:key];
        
        for (NSString *quoteSaid in value) {
            
            if ([quoteSaid isEqualToString:quote]) {
                
                result = [NSString stringWithFormat:@"%@", key];
                return result;
                
            }
        }
        
    }
    
    return result;
}

#pragma mark - Overriding Getters

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


@end