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

@interface GameScreenViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayTheQuote;

- (IBAction)neilButton:(id)sender;
- (IBAction)billButton:(id)sender;

@end


@implementation GameScreenViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //    @property (nonatomic, retain) NSString * quote;
    //    @property (nonatomic, retain) Person *person;
    
    //    @property (nonatomic, retain) NSString * name;
    //    @property (nonatomic, retain) NSString * fieldOfStudy;
    //    @property (nonatomic, retain) NSString * summary;
    //    @property (nonatomic, retain) id thumbnailImage;
    //    @property (nonatomic, retain) id profilePicture;
    //    @property (nonatomic, retain) NSSet *quotes;
    
    self.dataStore = [QuoteDataStore sharedDataStore];
    self.dataStore.fetchedResults.delegate = self;
    [self.dataStore.fetchedResults performFetch:nil];
    
    Person *neil = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.dataStore.managedObjectContext];
    neil.name = @"Neil deGrasse Tyson";
    neil.fieldOfStudy = @"Science";
    neil.summary = @"Neil deGrasse Tyson is an American astrophysicist, cosmologist, author, and science communicator. Since 1996, he has been the Frederick P. Rose Director of the Hayden Planetarium at the Rose Center for Earth and Space in New York City.";
    neil.thumbnailImage = [UIImage imageNamed:@"neilDegrasseTyson"];
    neil.profilePicture = [UIImage imageNamed:@"neilDegrasseTysonProfilePicture"];
    
    Quotes *neilQuote1 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStore.managedObjectContext];
    Quotes *neilQuote2 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStore.managedObjectContext];
    Quotes *neilQuote3 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStore.managedObjectContext];
    
    neilQuote1.quote = @"Hello, my favorite number is 1";
    neilQuote2.person = neil;
    neilQuote2.quote = @"What is your problem man?!!!";
    neilQuote2.person = neil;
    neilQuote3.quote = @"I love WATER, WHAT DO YOU LOVE";
    neilQuote3.person = neil;
    
//    neilQuote1.person = neil;
    
    [neil addQuotesObject:neilQuote1];
    [neil addQuotesObject:neilQuote2];
    [neil addQuotesObject:neilQuote3];
    [self.dataStore saveContext];
    
//    NSLog (@"%@", neil.quotes);
    
    NSArray *test = [neil.quotes allObjects];
    NSLog (@"This should print the first quote %@", test);
    
    Quotes *quote = test[0];
    self.displayTheQuote.text = quote.quote;
    
    
//    NSArray *quotes = [[NSArray alloc] init];
//    quotes = @[@"I had a dream!", @"I am here", @"Bad to the bone."];
//    
//    NSMutableDictionary *quotesReadyForGame = [[NSMutableDictionary alloc] init];
//    
//    [quotesReadyForGame setObject:quotes forKey:@"Jim"];
//    
//    
//    NSArray *quotes1 = [[NSArray alloc] init];
//    quotes1 = @[@"I am cute", @"Red is my favorite color", @"Blue is nothing more than what you make it."];
//    
//    [quotesReadyForGame setObject:quotes1 forKey:@"Gary"];
//    
////    NSLog (@"%@", quotesReadyForGame);
////    
////    NSLog (@"%ld",  [self generateRandomNumber:[quotesReadyForGame count]]);
////    
////    NSLog (@"%ld", [[quotesReadyForGame allValues] count]);
////    
////    
////    NSLog (@"%ld", [[quotesReadyForGame valueForKey:@"Jim"] count]);
//    
//
////    NSArray *allKeys = [quotesReadyForGame allKeys];
////    NSLog (@"%ld", [allKeys count]);
////    
////
////    NSLog (@"%@", allKeys);
//    
//    
////    NSLog (@"The number of total quotes = %ld", [self numberOfQuotesInListOfQuestions:quotesReadyForGame]);
//    
//    
//    NSArray *listOfQuotes = [quotesReadyForGame objectForKey:@"Jim"];
//    NSLog (@"%@", listOfQuotes);
//    
//    NSLog (@"The amount of quotes is %ld", listOfQuotes.count);
//    NSLog (@"The third item is %@", listOfQuotes[2]);
    
    

//    @property (nonatomic, retain) NSString * quote;
//    @property (nonatomic, retain) Person *person;



    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSFetchRequest *personQuoteRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    self.dataStore.quotesReadyForGame = [self.dataStore.managedObjectContext executeFetchRequest:personQuoteRequest error:nil];
    
#warning [self.tableView reloadData] needs to be placed here.  Instead of calling on tableView, when I create a custom one to be put in the view, do we refresh that?
    
    
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
