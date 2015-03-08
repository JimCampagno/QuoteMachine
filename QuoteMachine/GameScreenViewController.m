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

@property (strong, nonatomic) MatchingTheQuotesGame *theGame;
@property (weak, nonatomic) IBOutlet UIButton *playButtonProp;

- (IBAction)playButton:(id)sender;

- (IBAction)neilButton:(id)sender;
- (IBAction)billButton:(id)sender;
- (IBAction)isaacButton:(id)sender;
- (IBAction)carlButton:(id)sender;
- (IBAction)larryButton:(id)sender;

@end


@implementation GameScreenViewController



- (NSMutableArray *)fourPeopleChosen {
    if (!_fourPeopleChosen) {
        _fourPeopleChosen = [[NSMutableArray alloc] init];
    }
    return _fourPeopleChosen;
}

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
    
    
    
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSFetchRequest *personQuoteRequest = [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    self.dataStore.quotesReadyForGame = [self.dataStore.managedObjectContext executeFetchRequest:personQuoteRequest error:nil];
    // [self.tableView reloadData] needs to be placed here.  Instead of calling on tableView, when I create a custom one to be put in the view, do we refresh that?
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//@"Mario"
//@"Mitch Hedberg"
//@"Finn The Human"
//@"Larry David"

- (IBAction)playButton:(id)sender {
}


- (IBAction)isaacButton:(id)sender {
    
    [self tappedButton:sender withName:@"Mario"];
}

- (IBAction)carlButton:(id)sender {
    
    [self tappedButton:sender withName:@"Finn The Human"];
}

- (IBAction)larryButton:(id)sender {
    
    [self tappedButton:sender withName:@"Finn The Human"];
}
- (IBAction)billButton:(id)sender {
    
    [self tappedButton:sender withName:@"Mitch Hedberg"];
}

- (IBAction)neilButton:(id)sender {
    
    [self tappedButton:sender withName:@"Neil deGrasse Tyson"];
    
}

- (void)tappedButton:(UIButton *)button withName:(NSString *)nameOfPerson {
    
    if ([self.fourPeopleChosen count] == 4) {
        
        [self tapToDeselectButton:button];
        [self removePersonFromPoolWithName:nameOfPerson];
        
        self.playButtonProp.enabled = NO;

        
        for (Person *person in self.fourPeopleChosen) {
            NSLog (@"This person is in the pool: %@", person.name);
        }
    }
    else {
        if (button.layer.borderColor == [UIColor greenColor].CGColor) {
            
            [self tapToDeselectButton:button];
            [self removePersonFromPoolWithName:nameOfPerson];
            for (Person *person in self.fourPeopleChosen) {
                NSLog (@"This person is in the pool: %@", person.name);
            }
        }
        else {
            
            [self tapToSelectButton:button];
            [self addPersonToPoolToBePlayedWithName:nameOfPerson];
            
            if ([self.fourPeopleChosen count] == 4) {
            self.playButtonProp.enabled = YES;
            }
            for (Person *person in self.fourPeopleChosen) {
                NSLog (@"This person is in the pool: %@", person.name);
            }
            
        }
    }
}

- (void)addPersonToPoolToBePlayedWithName:(NSString *)name {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", name];
    NSArray *filteredArray = [self.dataStore.quotesReadyForGame filteredArrayUsingPredicate:predicate];
    Person *person = filteredArray[0];
    [self.fourPeopleChosen addObject:person];
}

- (void)removePersonFromPoolWithName:(NSString *)name {

    for (Person *person in self.fourPeopleChosen) {
        if ([person.name isEqualToString:name]) {
            [self.fourPeopleChosen removeObject:person];
            break;
        }
    }
}


- (void)tapToSelectButton:(UIButton *)button {
    [[button layer] setBorderWidth:3.0f];
    
    [[button layer] setBorderColor:[UIColor greenColor].CGColor];
    
    [UIView animateKeyframesWithDuration:0.6
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
                                  button.transform = CGAffineTransformMakeScale(2.5, 2.5);
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:1/3.0
                                                                animations:^{
                                                                    button.transform = CGAffineTransformMakeRotation(4.0 * M_PI / 3.0);
                                                                }];
                                  [UIView addKeyframeWithRelativeStartTime:1/3.0
                                                          relativeDuration:1/3.0
                                                                animations:^{
                                                                    button.transform = CGAffineTransformMakeRotation(2.0 * M_PI / 3.0);
                                                                }];
                                  [UIView addKeyframeWithRelativeStartTime:2/3.0
                                                          relativeDuration:1/3.0
                                                                animations:^{
                                                                    button.transform = CGAffineTransformMakeRotation(0);
                                                                }];
                              }
                              completion:^(BOOL finished) {
                                  [[button layer] setBorderWidth:2.5f];
                                  [[button layer] setBorderColor:[UIColor greenColor].CGColor];
                              }];
    
    NSLog (@"WE ARE INITIALLY CLICKING THE BUTTON!");
}

- (void)tapToDeselectButton:(UIButton *)button {
    NSLog (@"WE ARE DE-SELECTING THE BUTTON!");
    
    [[button layer] setBorderColor:[UIColor clearColor].CGColor];
    
    button.transform = CGAffineTransformMakeScale(1.8,1.8);
    button.alpha = 0.0f;
    
    [UIView beginAnimations:@"button" context:nil];
    [UIView setAnimationDuration:0.50];
    button.transform = CGAffineTransformMakeScale(1,1);
    button.alpha = 1.0f;
    [UIView commitAnimations];
}


@end
