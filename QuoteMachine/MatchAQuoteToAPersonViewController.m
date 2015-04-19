//
//  MatchAQuoteToAPersonViewController.m
//  QuoteMachine
//
//  Created by Jim Campagno on 4/18/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "MatchAQuoteToAPersonViewController.h"
#import "Person.h"
#import "ColorHelper.h"
#import "MatchingTheQuotesGame.h"

@interface MatchAQuoteToAPersonViewController ()

@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *quotesToDisplay;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UIButton *thirdButton;
@property (weak, nonatomic) IBOutlet UIButton *fourthButton;
@property (strong, nonatomic) MatchingTheQuotesGame *gameToBePlayed;

- (IBAction)personOne:(id)sender;
- (IBAction)personTwo:(id)sender;
- (IBAction)personThree:(id)sender;
- (IBAction)personFour:(id)sender;

@end

@implementation MatchAQuoteToAPersonViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpButtons];
    
    [self setupQuoteBox];
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [self.gameToBePlayed displayInstructionAndFirstQuoteWithLabel:self.quotesToDisplay];
}

- (void)setUpButtons {
    
    Person *firstPerson = self.fourChosenPeople[0];
    Person *secondPerson = self.fourChosenPeople[1];
    Person *thirdPerson = self.fourChosenPeople[2];
    Person *fourthPerson = self.fourChosenPeople[3];
    
    [self setupDisplayForButton:self.firstButton];
    [self setupDisplayForButton:self.secondButton];
    [self setupDisplayForButton:self.thirdButton];
    [self setupDisplayForButton:self.fourthButton];
    
    UIImage *firstImage = firstPerson.thumbnailImage;
    UIImage *secondImage = secondPerson.thumbnailImage;
    UIImage *thirdImage = thirdPerson.thumbnailImage;
    UIImage *fourthImage = fourthPerson.thumbnailImage;
    
    [self.firstButton setBackgroundImage:firstImage forState:UIControlStateNormal];
    [self.secondButton setBackgroundImage:secondImage forState:UIControlStateNormal];
    [self.thirdButton setBackgroundImage:thirdImage forState:UIControlStateNormal];
    [self.fourthButton setBackgroundImage:fourthImage forState:UIControlStateNormal];
}

- (void)setupDisplayForButton:(UIButton *)button {
    
    button.layer.borderWidth = 1.5;
    button.layer.borderColor = [ColorHelper randomColor];
    button.layer.cornerRadius = 37.5;
    button.layer.masksToBounds = YES;
}

- (void)setupQuoteBox {
    
    self.quotesToDisplay.numberOfLines = 0;
    self.quotesToDisplay.lineBreakMode = NSLineBreakByWordWrapping;
}

- (MatchingTheQuotesGame *)gameToBePlayed {
    
    if (!_gameToBePlayed) {
        
        _gameToBePlayed = [[MatchingTheQuotesGame alloc] initWithPeople:self.fourChosenPeople];
    }
    return _gameToBePlayed;
}

- (IBAction)personOne:(id)sender {
}

- (IBAction)personTwo:(id)sender {
}

- (IBAction)personThree:(id)sender {
}

- (IBAction)personFour:(id)sender {
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end