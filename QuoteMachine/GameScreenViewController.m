//
//  GameScreenViewController.m
//  QuoteMachine
//
//  Created by Jim Campagno on 2/26/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "GameScreenViewController.h"
#import "QuoteDataStore.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreData/CoreData.h>
#import "Person+Methods.h"
#import "Quotes.h"
#import "MatchingTheQuotesGame.h"

@interface GameScreenViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayTheQuote;

- (IBAction)neilButton:(id)sender;
- (IBAction)billButton:(id)sender;

@end


@implementation GameScreenViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    //    property (strong, nonatomic) NSMutableDictionary *quotesReadyForQuiz; //This is complete and has been implemented as part of the initWithPeople method below.
    //    @property (strong, nonatomic) NSNumber *scoreOfGame; //This has been set to @0, no logic has been established yet.
    //    @property (nonatomic) BOOL isCorrectlyChosen; //No logis has been set for this. Do I need this?
    //    @property (strong, nonatomic) NSString *quoteToDisplay;
    //
    //    - (instancetype)initWithPeople:(NSArray *)people; //This is complete and has been implemented.
    //    - (BOOL)isPerson:(Person *)person matchedToQuote:(NSString *)quote; //Implemented but it's not doing anything to the score.
    //    - (NSString *)drawAQuoteToDisplay;
    //    - (NSInteger)score;
    
    
    
    self.dataStore = [QuoteDataStore sharedDataStore];
    [self.dataStore fetchData];
    
#warning I don't think I need this stuff here.
    //    self.dataStore.fetchedResults.delegate = self;
    //    [self.dataStore.fetchedResults performFetch:nil];
    
    
    MatchingTheQuotesGame *theGame = [[MatchingTheQuotesGame alloc] initWithPeople:self.dataStore.quotesReadyForGame];
    
    NSLog (@"Will this work?  It should display the dictionary in theGame object: %@", theGame.quotesReadyForQuiz);
    
    int totalNumberOfQuotes = 0;
    NSArray *allKeys = [theGame.quotesReadyForQuiz allKeys];
    
    for (NSUInteger i = 0 ; i < [theGame.quotesReadyForQuiz count] ; i++) {
        
        NSString *nameOfDude = allKeys[i];
        totalNumberOfQuotes += [[theGame.quotesReadyForQuiz valueForKey:nameOfDude] count];
    }
    
    NSLog (@"The total number of people are %ld, the total number of quotes are %i", [allKeys count], totalNumberOfQuotes);
    
    

    
    
    //    Person *test = self.dataStore.quotesReadyForGame[0];
    //
    //    NSLog (@"%@", test.name);
    //    NSArray *testQuotes = [test.quotes allObjects];
    //
    //    NSMutableArray *listOfMarioQuotes = [[NSMutableArray alloc] init];
    //
    //    for (Quotes *quote in testQuotes) {
    //        [listOfMarioQuotes addObject:quote.quote];
    //    }
    //    NSLog (@"The quotes for %@ are %@", test.name, listOfMarioQuotes);
    //
    //    NSMutableDictionary *holdingThePersonAndQuotes = [[NSMutableDictionary alloc] init];
    //
    //
    //    [holdingThePersonAndQuotes setValue:listOfMarioQuotes forKey:@"Mario"];
    //
    ////    for (NSString *quote in listOfMarioQuotes) {
    ////        [holdingThePersonAndQuotes setValue:quote forKey:@"Mario"];
    ////    }
    //
    //    NSLog (@" --------------- TESTING -----------");
    //
    //    NSLog(@"%@", holdingThePersonAndQuotes);
    //
    //
    //    NSString *wrongAnswer = @"I like the color red";
    //    NSString *rightAnswer = @"Here I go!";
    //
    //    NSMutableArray *jimTest = [[NSMutableArray alloc] init];
    //    for (NSString *inn in [holdingThePersonAndQuotes valueForKey:@"Mario"]) {
    //        [jimTest addObject:inn];
    //    }
    //
    //    if ([jimTest containsObject:rightAnswer]) {
    //        NSLog (@"MUCH MUCH BETTER WAY1!! WINNE");
    //    }
    //
    //    if ([[holdingThePersonAndQuotes valueForKey:@"Mario"] containsObject:rightAnswer]) {
    //        NSLog (@"WOW THIS WOULD BE GOOD, RIGHT ANSWER");
    //    }
    
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSFetchRequest *personQuoteRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    self.dataStore.quotesReadyForGame = [self.dataStore.managedObjectContext executeFetchRequest:personQuoteRequest error:nil];
    
#warning [self.tableView reloadData] needs to be placed here.  Instead of calling on tableView, when I create a custom one to be put in the view, do we refresh that?
    
    
}

#warning this isn't complete
//- (NSUInteger)generateRandomNumber:(NSUInteger)count {
//
//    return arc4random() % count;
//}


#warning This belongs somewhere else
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)neilButton:(id)sender {
    
}
- (IBAction)billButton:(id)sender {
}
@end
