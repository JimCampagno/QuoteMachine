//
//  GameScreenViewController.m
//  QuoteMachine
//
//  Created by Jim Campagno on 2/26/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "GameScreenViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface GameScreenViewController ()

- (IBAction)neilButton:(id)sender;
- (IBAction)billButton:(id)sender;

@end


@implementation GameScreenViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSArray *quotes = [[NSArray alloc] init];
    quotes = @[@"I had a dream!", @"I am here", @"Bad to the bone."];
    
    NSMutableDictionary *quotesReadyForGame = [[NSMutableDictionary alloc] init];
    
    [quotesReadyForGame setObject:quotes forKey:@"Jim"];
    
    
    NSArray *quotes1 = [[NSArray alloc] init];
    quotes1 = @[@"I am cute", @"Red is my favorite color", @"Blue is nothing more than what you make it."];
    
    [quotesReadyForGame setObject:quotes1 forKey:@"Gary"];
    
//    NSLog (@"%@", quotesReadyForGame);
//    
//    NSLog (@"%ld",  [self generateRandomNumber:[quotesReadyForGame count]]);
//    
//    NSLog (@"%ld", [[quotesReadyForGame allValues] count]);
//    
//    
//    NSLog (@"%ld", [[quotesReadyForGame valueForKey:@"Jim"] count]);
    

//    NSArray *allKeys = [quotesReadyForGame allKeys];
//    NSLog (@"%ld", [allKeys count]);
//    
//
//    NSLog (@"%@", allKeys);
    
    
//    NSLog (@"The number of total quotes = %ld", [self numberOfQuotesInListOfQuestions:quotesReadyForGame]);
    
    
    NSArray *listOfQuotes = [quotesReadyForGame objectForKey:@"Jim"];
    NSLog (@"%@", listOfQuotes);
    
    NSLog (@"The amount of quotes is %ld", listOfQuotes.count);
    NSLog (@"The third item is %@", listOfQuotes[2]);
    
    
    
    
    
    
    
    
    
    
    

    // Do any additional setup after loading the view.
}
- (NSUInteger)generateRandomNumber:(NSUInteger)count {
    
    return arc4random() % count;
}


//To Figure out the number of quotes in the Quotes Ready For Game dictionary.
- (NSUInteger)numberOfQuotesInListOfQuestions:(NSMutableDictionary *)quotesReadyForGame {
    
    NSUInteger totalNumberOfQuotes;
    NSArray *allKeys = [quotesReadyForGame allKeys];
    
    for (NSUInteger i = 0 ; i < [quotesReadyForGame count] ; i++) {
        
        NSString *nameOfDude = allKeys[i];
        totalNumberOfQuotes += [[quotesReadyForGame valueForKey:nameOfDude] count];
    }
    return totalNumberOfQuotes;
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
