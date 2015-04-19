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
@property (weak, nonatomic) IBOutlet UILabel *nameOfPersonOne;
@property (weak, nonatomic) IBOutlet UILabel *nameOfPersonTwo;
@property (weak, nonatomic) IBOutlet UILabel *nameOfPersonThree;
@property (weak, nonatomic) IBOutlet UILabel *nameOfPersonFour;
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



- (IBAction)personOne:(id)sender {
    
    [self.gameToBePlayed makeAGuessWithPerson:self.fourChosenPeople[0] toQuoteInLabel:self.quotesToDisplay inView:self.view withScoreLabel:self.score];
}

- (IBAction)personTwo:(id)sender {
    
    [self.gameToBePlayed makeAGuessWithPerson:self.fourChosenPeople[1] toQuoteInLabel:self.quotesToDisplay inView:self.view withScoreLabel:self.score];
}

- (IBAction)personThree:(id)sender {
    
    [self.gameToBePlayed makeAGuessWithPerson:self.fourChosenPeople[2] toQuoteInLabel:self.quotesToDisplay inView:self.view withScoreLabel:self.score];
}

- (IBAction)personFour:(id)sender {
    
    [self.gameToBePlayed makeAGuessWithPerson:self.fourChosenPeople[3] toQuoteInLabel:self.quotesToDisplay inView:self.view withScoreLabel:self.score];
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
    
    self.nameOfPersonOne.text = firstPerson.name;
    self.nameOfPersonTwo.text = secondPerson.name;
    self.nameOfPersonThree.text = thirdPerson.name;
    self.nameOfPersonFour.text = fourthPerson.name;
    
    [self setupTextBoxForNameLabe:self.nameOfPersonOne];
    [self setupTextBoxForNameLabe:self.nameOfPersonTwo];
    [self setupTextBoxForNameLabe:self.nameOfPersonThree];
    [self setupTextBoxForNameLabe:self.nameOfPersonFour];
    
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

- (void)setupTextBoxForNameLabe:(UILabel *)label {
    
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
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
