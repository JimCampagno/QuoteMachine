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
@property (strong, nonatomic) MatchingTheQuotesGame *theGame;

- (IBAction)neilButton:(id)sender;
- (IBAction)billButton:(id)sender;

@end


@implementation GameScreenViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.dataStore = [QuoteDataStore sharedDataStore];
    [self.dataStore fetchData];
    
    self.theGame = [[MatchingTheQuotesGame alloc] initWithPeople:self.dataStore.quotesReadyForGame];
    
    
    NSString *quoteChosen = [self.theGame drawAQuoteToDisplay];
    NSLog (@"The quote chosen --- %@", quoteChosen);
    
    Person *someone = self.dataStore.quotesReadyForGame[1];
    NSLog (@"The person we clicked was %@", someone.name);
    
    if ([self.theGame isPerson:someone matchedToQuote:quoteChosen]) {
        
        NSLog (@"Congrats Jim, this is working!");
    }
    else {
        NSLog (@"DIdn't pick the right person");
    }
    

    
    
//    NSLog (@"Will this work?  It should display the dictionary in theGame object: %@", self.theGame.quotesReadyForQuiz);
    
//    NSArray *allKeys = [self.theGame.quotesReadyForQuiz allKeys];
//    
//    NSLog (@"This should print all of the people: %@", allKeys);
//    
//    NSUInteger randomNumberToChoosePerson = arc4random_uniform((uint32_t) allKeys.count);
//    
//    NSLog (@"The random number chosen was %lu", (unsigned long)randomNumberToChoosePerson);
//    NSString *randomPersonChosen = allKeys[randomNumberToChoosePerson];
//
//    NSLog (@"That random person chosen was %@", randomPersonChosen);
//    
//    NSUInteger randomNumberFromAmountOfQuotesOfPerson =arc4random_uniform((uint32_t) [[self.theGame.quotesReadyForQuiz valueForKey:allKeys[randomNumberToChoosePerson]] count]);
//    
//    NSLog (@"The random number to use as a quote is %lu", randomNumberFromAmountOfQuotesOfPerson);
//    
//    
//    NSLog (@"To make sure this is working: %u", arc4random_uniform((uint32_t) [[self.theGame.quotesReadyForQuiz valueForKey:allKeys[randomNumberToChoosePerson]] count]));
//    
//    NSArray *listOfQuotesForPersonChosen = [self.theGame.quotesReadyForQuiz valueForKey:randomPersonChosen];
//    NSString *quoteChosen = listOfQuotesForPersonChosen[randomNumberFromAmountOfQuotesOfPerson];
//    
//    NSLog (@"The random quote for %@ is %@", randomPersonChosen, quoteChosen);
//    
//    NSString *helloAgain = (@"The color is blue");
//    
//    NSMutableArray *testing = [[NSMutableArray alloc] init];
//    
//    [testing addObject:quoteChosen];
//    [testing addObject:helloAgain];
//
//    NSString *jimIsTesting = (@"The color is blue");
//    
//    
//    
//    if ([testing containsObject:jimIsTesting]) {
//        
//        NSLog (@"Winner!");
//    }
//    
//    else {
//        NSLog (@"NOT A WINNER!");
//    }
//    
    

    
    
    
   

    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
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

//- (NSString *)generateRandomQuestion {
//    
//    NSInteger totalNumberOfQuotes = 0;
//    
//    NSArray *allKeys = [self.theGame.quotesReadyForQuiz allKeys];
//    
//    for (NSUInteger i = 0 ; i < [self.theGame.quotesReadyForQuiz count] ; i++) {
//        NSString *nameOfDude = allKeys[i];
//        totalNumberOfQuotes += [[self.theGame.quotesReadyForQuiz valueForKey:nameOfDude] count];
//    }
//
//    NSUInteger randomNumberForPerson = arc4random_uniform((uint32_t) predictionArray.count);
//    
//}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSFetchRequest *personQuoteRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    self.dataStore.quotesReadyForGame = [self.dataStore.managedObjectContext executeFetchRequest:personQuoteRequest error:nil];
    
#warning [self.tableView reloadData] needs to be placed here.  Instead of calling on tableView, when I create a custom one to be put in the view, do we refresh that?
    
    
}





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
