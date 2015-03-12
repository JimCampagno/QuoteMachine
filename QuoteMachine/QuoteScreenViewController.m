//
//  QuoteScreenViewController.m
//  QuoteMachine
//
//  Created by Kavan Brandon on 3/7/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "QuoteScreenViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+distance.h"
#import "QuoteDataStore.h"
#import <CoreData/CoreData.h>
#import "Person+Methods.h"
#import "Quotes.h"
#import "MatchingTheQuotesGame.h"
#import "RBStoryboardLink.h"

@interface QuoteScreenViewController ()

@property (strong, nonatomic) MatchingTheQuotesGame *theUltimateGame;

@property (weak, nonatomic) IBOutlet UILabel *dragHereLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreOfGame;

@property (strong, nonatomic) IBOutlet UIView *quoteContainer;
@property (strong, nonatomic) IBOutlet UIView *dragContainer;
@property (strong, nonatomic) IBOutlet UIView *answerContainer;

@property (strong, nonatomic) IBOutlet UIImageView *billNye;
@property (strong, nonatomic) IBOutlet UIImageView *carlSagan;
@property (strong, nonatomic) IBOutlet UIImageView *isaacNewton;
@property (strong, nonatomic) IBOutlet UIImageView *neilTyson;

@property (strong, nonatomic) IBOutlet UIImageView *firstImage;
@property (strong, nonatomic) IBOutlet UIImageView *secondImage;
@property (strong, nonatomic) IBOutlet UIImageView *thirdImage;
@property (strong, nonatomic) IBOutlet UIImageView *fourthImage;

@property (strong, nonatomic) IBOutlet UIButton *resetButton;

@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;

@property (strong, nonatomic) IBOutlet UIView *answerDragArea;

@property (strong, nonatomic) NSLayoutConstraint *xPositionFirstImage;
@property (strong, nonatomic) NSLayoutConstraint *yPositionFirstImage;
@property (strong, nonatomic) NSLayoutConstraint *xPositionSecondImage;
@property (strong, nonatomic) NSLayoutConstraint *yPositionSecondImage;
@property (strong, nonatomic) NSLayoutConstraint *xPositionThirdImage;
@property (strong, nonatomic) NSLayoutConstraint *yPositionThirdImage;
@property (strong, nonatomic) NSLayoutConstraint *xPositionFourthImage;
@property (strong, nonatomic) NSLayoutConstraint *yPositionFourthImage;
@property (strong, nonatomic) NSLayoutConstraint *xResetButton;
@property (strong, nonatomic) NSLayoutConstraint *yResetButton;
@property (strong, nonatomic) NSLayoutConstraint *xAnswerDragArea;
@property (strong, nonatomic) NSLayoutConstraint *yAnswerDragArea;

@property (strong, nonatomic) NSLayoutConstraint *quoteLabelX;
@property (strong, nonatomic) NSLayoutConstraint *quoteLabelY;
@property (strong, nonatomic) NSLayoutConstraint *quoteLabelLeft;
@property (strong, nonatomic) NSLayoutConstraint *quoteLabelRight;

@property (strong, nonatomic) NSLayoutConstraint *scoreOfGameX;
@property (strong, nonatomic) NSLayoutConstraint *scoreOfGameY;
@property (strong, nonatomic) NSLayoutConstraint *scoreOfGameLeft;
@property (strong, nonatomic) NSLayoutConstraint *scoreOfGameRight;

@property (strong, nonatomic) NSLayoutConstraint *dragLabelX;
@property (strong, nonatomic) NSLayoutConstraint *dragLabelY;
@property (strong, nonatomic) NSLayoutConstraint *dragLabelLeft;
@property (strong, nonatomic) NSLayoutConstraint *dragLabelRight;

@property (nonatomic) CGPoint oldPosition;

- (IBAction)resetButton:(id)sender;

@end


@implementation QuoteScreenViewController

- (NSArray *)peopleThatWereChosen {
    if (!_peopleThatWereChosen) {
        _peopleThatWereChosen = [[NSArray alloc] init];
    }
    return _peopleThatWereChosen;
}

- (MatchingTheQuotesGame *)theUltimateGame {
    if (!_theUltimateGame) {
        _theUltimateGame = [[MatchingTheQuotesGame alloc] initWithPeople:self.peopleThatWereChosen];
    }
    
    return _theUltimateGame;
}

- (void)displayNewQuote {
    
    if ([self.theUltimateGame.holdingTheQuotesAlreadyDisplayed count] == 12) {
        
        self.quoteLabel.text = @"GAME OVER";
        
        [[self.view layer] setBackgroundColor:[UIColor darkGrayColor].CGColor];
        
    }
    else {
        
        [UIView animateWithDuration:1.0 animations:^{
            self.quoteLabel.alpha = 0.0f;
        } completion:^(BOOL finished) {
            self.quoteLabel.text = [self.theUltimateGame drawAQuoteToDisplay];
            [UIView animateWithDuration:1.0 animations:^{
                self.quoteLabel.alpha = 1.0f;
            }];
        }];
    }
}




- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.quoteLabel.numberOfLines = 0;
    self.quoteLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.quoteLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.quoteLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.quoteLabel.text = @"";
    
    self.dragHereLabel.numberOfLines = 0;
    self.dragHereLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.dragHereLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.dragHereLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.dragHereLabel.text = @"Who said it?  Drag the person below the quote to guess (You only get one guess per quote).";
    
    
    
    
    
    
    //Initial QUote to Display
    [UIView animateWithDuration:8.0 animations:^{
        self.quoteLabel.alpha = 0.0f;
    } completion:^(BOOL finished) {
        self.quoteLabel.text = [self.theUltimateGame drawAQuoteToDisplay];
        [UIView animateWithDuration:8.0 animations:^{
            self.quoteLabel.alpha = 1.0f;
            
        }];
    }];
    
    [[self.view layer] setBackgroundColor:[UIColor lightGrayColor].CGColor];
    
    self.scoreOfGame.text = [self.theUltimateGame.scoreOfGame stringValue];
    
    
    
    [[self.scoreOfGame layer] setBorderWidth:3.0f];
    [[self.scoreOfGame layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [[self.scoreOfGame layer] setCornerRadius:10];
    [[self.scoreOfGame layer] setMasksToBounds:YES];
    [[self.scoreOfGame layer] setBackgroundColor:[UIColor blueColor].CGColor];
    
    
    
    
    //Set the button images of the people chosen
    Person *one = self.peopleThatWereChosen[0];
    NSString *nameOfOne = one.name;
    UIImage *imageOne = [UIImage imageNamed:nameOfOne];
    [self.carlSagan setImage:imageOne];
    
    Person *two = self.peopleThatWereChosen[1];
    NSString *nameOfTwo = two.name;
    UIImage *imageTwo = [UIImage imageNamed:nameOfTwo];
    [self.billNye setImage:imageTwo];
    
    Person *three = self.peopleThatWereChosen[2];
    NSString *nameOfThree = three.name;
    UIImage *imageThree = [UIImage imageNamed:nameOfThree];
    [self.isaacNewton setImage:imageThree];
    
    Person *four = self.peopleThatWereChosen[3];
    NSString *nameOfFour = four.name;
    UIImage *imageFour = [UIImage imageNamed:nameOfFour];
    [self.neilTyson setImage:imageFour];
    
    //Keep this here as it works with the logic (refactor though when you have a moment)
    self.firstImage = self.carlSagan;   //Refactor, should say firstPerson, not self.carlSagan
    self.secondImage = self.billNye;    //Refactor, should say secondPerson, not self.billNye
    self.thirdImage = self.isaacNewton; //Refactor, should say thirdPerson, not self.isaacNewton
    self.fourthImage = self.neilTyson;  //Refactor, should say fourthPerson, not self.neilTyson
    
    [self removeConstraints];
    [self setContainerConstraints];
    [self setHeightAndWidthImageConstraints];
    [self setImageXAndYContraints];
    [self setRoundedCornersForImages];
    [self gestureSetup];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setRoundedView:(UIImageView *)roundedView toDiameter:(float)newSize;
{
    CGPoint saveCenter = roundedView.center;
    CGRect newFrame = CGRectMake(roundedView.frame.origin.x, roundedView.frame.origin.y, newSize, newSize);
    roundedView.frame = newFrame;
    roundedView.layer.cornerRadius = newSize / 1.25;
    roundedView.center = saveCenter;
}

-(void)setRoundedCornersForImages
{
    self.firstImage.clipsToBounds = YES;
    self.secondImage.clipsToBounds = YES;
    self.thirdImage.clipsToBounds = YES;
    self.fourthImage.clipsToBounds = YES;
    self.answerDragArea.clipsToBounds = YES;
    
    [self setRoundedView:self.firstImage toDiameter:25.0];
    [self setRoundedView:self.secondImage toDiameter:25.0];
    [self setRoundedView:self.thirdImage toDiameter:25.0];
    [self setRoundedView:self.fourthImage toDiameter:25.0];
    [self setRoundedView:self.answerDragArea toDiameter:25.0];
    
    //Creates Border around Drag Area
    
    [self.answerDragArea.layer setBorderWidth:1.0];
    [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
}

-(void)removeConstraints
{
    [self.view removeConstraints:self.view.constraints];
    
    [self.quoteContainer removeConstraints:self.view.constraints];
    [self.dragContainer removeConstraints:self.view.constraints];
    [self.answerContainer removeConstraints:self.view.constraints];
    [self.firstImage removeConstraints:self.firstImage.constraints];
    [self.secondImage removeConstraints:self.secondImage.constraints];
    [self.thirdImage removeConstraints:self.thirdImage.constraints];
    [self.fourthImage removeConstraints:self.fourthImage.constraints];
    [self.resetButton removeConstraints:self.resetButton.constraints];
    [self.answerDragArea removeConstraints:self.answerDragArea.constraints];
    [self.quoteLabel removeConstraints:self.quoteLabel.constraints];
    [self.scoreOfGame removeConstraints:self.scoreOfGame.constraints];
    [self.dragHereLabel removeConstraints:self.dragHereLabel.constraints];
    
    self.quoteContainer.translatesAutoresizingMaskIntoConstraints = NO;
    self.dragContainer.translatesAutoresizingMaskIntoConstraints = NO;
    self.answerContainer.translatesAutoresizingMaskIntoConstraints = NO;
    self.firstImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.secondImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.thirdImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.fourthImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.answerDragArea.translatesAutoresizingMaskIntoConstraints = NO;
    self.quoteLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.scoreOfGame.translatesAutoresizingMaskIntoConstraints = NO;
    self.dragHereLabel.translatesAutoresizingMaskIntoConstraints = NO;
}
-(void)removeSecondImageConstraint
{
    [self.secondImage removeConstraints:self.secondImage.constraints];
    self.secondImage.translatesAutoresizingMaskIntoConstraints = NO;
}


-(void)setContainerConstraints
{
    NSDictionary *views = @{@"quoteContainer":self.quoteContainer,
                            @"dragContainer":self.dragContainer,
                            @"answerContainer":self.answerContainer};
    
    //Quote Container Restraints
    NSLayoutConstraint *quoteContainerWidth = [NSLayoutConstraint
                                               constraintWithItem:self.quoteContainer
                                               attribute:NSLayoutAttributeWidth
                                               relatedBy:NSLayoutRelationEqual
                                               toItem:self.view
                                               attribute:NSLayoutAttributeWidth
                                               multiplier:1.0
                                               constant:0.0];
    
    NSLayoutConstraint *quoteContainerHeight = [NSLayoutConstraint constraintWithItem:self.quoteContainer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:.3333 constant:0.0];
    
    [self.view addConstraint:quoteContainerWidth];
    [self.view addConstraint:quoteContainerHeight];
    
    NSArray *dragContainerContraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|[dragContainer]|" options:0 metrics:nil views:views];
    
    NSArray *answerContainerContraint = [NSLayoutConstraint constraintsWithVisualFormat:@"|[answerContainer]|" options:0 metrics:nil views:views];
    
    NSArray *containerHeightRestraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[quoteContainer][dragContainer(==quoteContainer)][answerContainer(==quoteContainer)]|" options:0 metrics:nil views:views];
    
    [self.view addConstraints:dragContainerContraint];
    [self.view addConstraints:answerContainerContraint];
    [self.view addConstraints:containerHeightRestraints];
}

-(void)setImageXAndYContraints
{
    
    self.scoreOfGameLeft = [NSLayoutConstraint
                            constraintWithItem:self.scoreOfGame
                            attribute:NSLayoutAttributeLeft
                            relatedBy:NSLayoutRelationEqual
                            toItem:self.view
                            attribute:NSLayoutAttributeLeft
                            multiplier:1.0
                            constant:170.0];
    
    self.scoreOfGameRight = [NSLayoutConstraint
                             constraintWithItem:self.scoreOfGame
                             attribute:NSLayoutAttributeRight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.view
                             attribute:NSLayoutAttributeRight
                             multiplier:1.0
                             constant:-170.0];
    
    self.scoreOfGameX = [NSLayoutConstraint
                         constraintWithItem:self.scoreOfGame
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.view
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0];
    
    self.scoreOfGameY = [NSLayoutConstraint
                         constraintWithItem:self.scoreOfGame
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.view
                         attribute:NSLayoutAttributeCenterY
                         multiplier:1.0
                         constant:-270.0];
    
    
    
    
    
    self.dragLabelLeft = [NSLayoutConstraint
                          constraintWithItem:self.dragHereLabel
                          attribute:NSLayoutAttributeLeft
                          relatedBy:NSLayoutRelationEqual
                          toItem:self.view
                          attribute:NSLayoutAttributeLeft
                          multiplier:1.0
                          constant:10.0];
    
    self.dragLabelRight = [NSLayoutConstraint
                           constraintWithItem:self.dragHereLabel
                           attribute:NSLayoutAttributeRight
                           relatedBy:NSLayoutRelationEqual
                           toItem:self.view
                           attribute:NSLayoutAttributeRight
                           multiplier:1.0
                           constant:-10.0];
    
    
    self.dragLabelX = [NSLayoutConstraint
                       constraintWithItem:self.dragHereLabel
                       attribute:NSLayoutAttributeCenterX
                       relatedBy:NSLayoutRelationEqual
                       toItem:self.view
                       attribute:NSLayoutAttributeCenterX
                       multiplier:1.0
                       constant:0.0];
    
    self.dragLabelY = [NSLayoutConstraint
                       constraintWithItem:self.dragHereLabel
                       attribute:NSLayoutAttributeCenterY
                       relatedBy:NSLayoutRelationEqual
                       toItem:self.view
                       attribute:NSLayoutAttributeCenterY
                       multiplier:1.0
                       constant:40.0];
    
    
    
    
    
    
    
    
    
    
    
    self.quoteLabelLeft = [NSLayoutConstraint
                           constraintWithItem:self.quoteLabel
                           attribute:NSLayoutAttributeLeft
                           relatedBy:NSLayoutRelationEqual
                           toItem:self.view
                           attribute:NSLayoutAttributeLeft
                           multiplier:1.0
                           constant:10.0];
    
    self.quoteLabelRight = [NSLayoutConstraint
                            constraintWithItem:self.quoteLabel
                            attribute:NSLayoutAttributeRight
                            relatedBy:NSLayoutRelationEqual
                            toItem:self.view
                            attribute:NSLayoutAttributeRight
                            multiplier:1.0
                            constant:-10.0];
    
    self.quoteLabelX = [NSLayoutConstraint
                        constraintWithItem:self.quoteLabel
                        attribute:NSLayoutAttributeCenterX
                        relatedBy:NSLayoutRelationEqual
                        toItem:self.view
                        attribute:NSLayoutAttributeCenterX
                        multiplier:1.0
                        constant:0.0];
    
    self.quoteLabelY = [NSLayoutConstraint
                        constraintWithItem:self.quoteLabel
                        attribute:NSLayoutAttributeCenterY
                        relatedBy:NSLayoutRelationEqual
                        toItem:self.view
                        attribute:NSLayoutAttributeCenterY
                        multiplier:1.0
                        constant:-120.0];
    
    self.xPositionFirstImage = [NSLayoutConstraint
                                constraintWithItem:self.firstImage
                                attribute:NSLayoutAttributeCenterX
                                relatedBy:NSLayoutRelationEqual
                                toItem:self.answerContainer
                                attribute:NSLayoutAttributeCenterX
                                multiplier:0.25
                                constant:0.0];
    
    self.yPositionFirstImage = [NSLayoutConstraint
                                constraintWithItem:self.firstImage
                                attribute:NSLayoutAttributeCenterY
                                relatedBy:NSLayoutRelationEqual
                                toItem:self.answerContainer
                                attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                constant:0.0];
    
    self.xPositionSecondImage = [NSLayoutConstraint constraintWithItem:self.secondImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.answerContainer attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0.0];
    self.yPositionSecondImage = [NSLayoutConstraint constraintWithItem:self.secondImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.answerContainer attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    self.xPositionThirdImage = [NSLayoutConstraint constraintWithItem:self.thirdImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.answerContainer attribute:NSLayoutAttributeCenterX multiplier:1.25 constant:0.0];
    self.yPositionThirdImage = [NSLayoutConstraint constraintWithItem:self.thirdImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.answerContainer attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    self.xPositionFourthImage = [NSLayoutConstraint constraintWithItem:self.fourthImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.answerContainer attribute:NSLayoutAttributeCenterX multiplier:1.75 constant:0.0];
    self.yPositionFourthImage = [NSLayoutConstraint constraintWithItem:self.fourthImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.answerContainer attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    //Reset Button Constraint
    self.xResetButton = [NSLayoutConstraint constraintWithItem:self.resetButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.dragContainer attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    self.yResetButton = [NSLayoutConstraint constraintWithItem:self.resetButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.dragContainer attribute:NSLayoutAttributeCenterY multiplier:1.25 constant:0.0];
    
    //Answer Drag Area Constraint
    self.xAnswerDragArea = [NSLayoutConstraint constraintWithItem:self.answerDragArea attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.dragContainer attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    self.yAnswerDragArea = [NSLayoutConstraint constraintWithItem:self.answerDragArea attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.dragContainer attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    
    [self.view addConstraint:self.scoreOfGameLeft];
    [self.view addConstraint:self.scoreOfGameRight];
    [self.view addConstraint:self.scoreOfGameX];
    [self.view addConstraint:self.scoreOfGameY];
    
    [self.view addConstraint:self.quoteLabelX];
    [self.view addConstraint:self.quoteLabelY];
    [self.view addConstraint:self.quoteLabelLeft];
    [self.view addConstraint:self.quoteLabelRight];
    
    [self.view addConstraint:self.dragLabelLeft];
    [self.view addConstraint:self.dragLabelRight];
    [self.view addConstraint:self.dragLabelX];
    [self.view addConstraint:self.dragLabelY];
    
    [self.view addConstraint:self.xPositionFirstImage];
    [self.view addConstraint:self.yPositionFirstImage];
    [self.view addConstraint:self.xPositionSecondImage];
    [self.view addConstraint:self.yPositionSecondImage];
    [self.view addConstraint:self.xPositionThirdImage];
    [self.view addConstraint:self.yPositionThirdImage];
    [self.view addConstraint:self.xPositionFourthImage];
    [self.view addConstraint:self.yPositionFourthImage];
    [self.view addConstraint:self.xResetButton];
    [self.view addConstraint:self.yResetButton];
    [self.view addConstraint:self.xAnswerDragArea];
    [self.view addConstraint:self.yAnswerDragArea];
}

-(void)setHeightAndWidthImageConstraints
{
    //Image Restraints
    NSLayoutConstraint *firstImageContainerWidth = [NSLayoutConstraint constraintWithItem:self.firstImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.answerContainer attribute:NSLayoutAttributeWidth multiplier:.20 constant:0.0];
    
    NSLayoutConstraint *firstImageContainerHeight = [NSLayoutConstraint constraintWithItem:self.firstImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.answerContainer attribute:NSLayoutAttributeHeight multiplier:0.4 constant:0.0];
    
    NSLayoutConstraint *secondImageContainerWidth = [NSLayoutConstraint constraintWithItem:self.secondImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.firstImage attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *secondImageContainerHeight = [NSLayoutConstraint constraintWithItem:self.secondImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.firstImage attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *thirdImageContainerWidth = [NSLayoutConstraint constraintWithItem:self.thirdImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.firstImage attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *thirdImageContainerHeight = [NSLayoutConstraint constraintWithItem:self.thirdImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.firstImage attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *fourthImageContainerWidth = [NSLayoutConstraint constraintWithItem:self.fourthImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.firstImage attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *fourthImageContainerHeight = [NSLayoutConstraint constraintWithItem:self.fourthImage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.firstImage attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    
    //Answer Drag Area Width and Height
    NSLayoutConstraint *answerDragAreaWidth = [NSLayoutConstraint constraintWithItem:self.answerDragArea attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.dragContainer attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0];
    
    NSLayoutConstraint *answerDragAreaHeight = [NSLayoutConstraint constraintWithItem:self.answerDragArea attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.dragContainer attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0.0];
    
    [self.view addConstraint:firstImageContainerWidth];
    [self.view addConstraint:firstImageContainerHeight];
    [self.view addConstraint:secondImageContainerWidth];
    [self.view addConstraint:secondImageContainerHeight];
    [self.view addConstraint:thirdImageContainerWidth];
    [self.view addConstraint:thirdImageContainerHeight];
    [self.view addConstraint:fourthImageContainerWidth];
    [self.view addConstraint:fourthImageContainerHeight];
    [self.view addConstraint:answerDragAreaWidth];
    [self.view addConstraint:answerDragAreaHeight];
}

-(void)gestureSetup
{
    
    
    UIPanGestureRecognizer *panGestureFirstImage = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragFirstImage:)];
    [self.firstImage addGestureRecognizer:panGestureFirstImage];
    
    UIPanGestureRecognizer *panGestureSecondImage = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragSecondImage:)];
    [self.secondImage addGestureRecognizer:panGestureSecondImage];
    
    UIPanGestureRecognizer *panGestureThirdImage = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragThirdImage:)];
    [self.thirdImage addGestureRecognizer:panGestureThirdImage];
    
    UIPanGestureRecognizer *panGestureFourthImage = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragFourthImage:)];
    [self.fourthImage addGestureRecognizer:panGestureFourthImage];
    
    self.firstImage.userInteractionEnabled = YES;
    self.secondImage.userInteractionEnabled = YES;
    self.thirdImage.userInteractionEnabled = YES;
    self.fourthImage.userInteractionEnabled = YES;
}

- (void)increaseScoreByOne {
    
    self.theUltimateGame.scoreOfGame = [NSNumber numberWithInt:[self.theUltimateGame.scoreOfGame intValue] + 1];
    self.scoreOfGame.text = [self.theUltimateGame.scoreOfGame stringValue];
    
}

-(void)dragFirstImage:(UIPanGestureRecognizer *)gesture
{
    
    [UIView animateWithDuration:1.0 animations:^{
        self.dragHereLabel.alpha = 0.0f;
    }];

    self.dragHereLabel.alpha = 0.0f;
    
    
    double distanceFirstImage = [self.firstImage distanceToView:self.answerDragArea];
    
    CGPoint fingerLocation = [gesture locationInView:self.view];
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        self.oldPosition = fingerLocation;
        [self distanceBetweenFirstImageAndAnswerDragArea];
        NSLog (@"This is the initial drag when someone is trying to drag an item.");
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        if (distanceFirstImage <100)
        {
            [self distanceBetweenFirstImageAndAnswerDragArea];
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionFirstImage.constant = 140;
                self.yPositionFirstImage.constant = -222;
                [self.view layoutIfNeeded];
                
                if ([self.theUltimateGame isPerson:self.peopleThatWereChosen[0] matchedToQuote:self.quoteLabel.text])
                {
                    
                    [[self.view layer] setBackgroundColor:[UIColor greenColor].CGColor];
                    
                    [self increaseScoreByOne];
                    
                    
                    [[self.view layer] setBackgroundColor:[UIColor lightGrayColor].CGColor];
                    
                    
                    [UIView animateWithDuration:1.5 animations:^{
                        self.xPositionFirstImage.constant = 0;
                        self.yPositionFirstImage.constant = 0;
                        [self.view layoutIfNeeded];
                        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                        
                        [self displayNewQuote];
                        
                    }];
                    
                }
                else {
                    
                    [[self.view layer] setBackgroundColor:[UIColor redColor].CGColor];
                    
                    
                    
                    [[self.view layer] setBackgroundColor:[UIColor lightGrayColor].CGColor];
                    
                    
                    [UIView animateWithDuration:1.5 animations:^{
                        self.xPositionFirstImage.constant = 0;
                        self.yPositionFirstImage.constant = 0;
                        [self.view layoutIfNeeded];
                        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                        
                        [self displayNewQuote];
                        
                    }];
                    
                    
                    
                }
                
                
            }];
        }
        else
        {
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionFirstImage.constant = 0;
                self.yPositionFirstImage.constant = 0;
                [self.view layoutIfNeeded];
                [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                NSLog (@"This means it has been let go into an area that wasn't the answer portion.");
            }];
        }
    }
    
    CGFloat deltaX = fingerLocation.x - self.oldPosition.x;
    CGFloat deltaY = fingerLocation.y - self.oldPosition.y;
    
    self.oldPosition = fingerLocation;
    
    self.xPositionFirstImage.constant +=deltaX;
    self.yPositionFirstImage.constant +=deltaY;
    
}

-(void)dragSecondImage:(UIPanGestureRecognizer *)gesture
{
    [UIView animateWithDuration:1.0 animations:^{
        self.dragHereLabel.alpha = 0.0f;
    }];
    
    double distanceSecondImage = [self.secondImage distanceToView:self.answerDragArea];
    
    CGPoint fingerLocation = [gesture locationInView:self.view];
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        self.oldPosition = fingerLocation;
        [self distanceBetweenSecondImageAndAnswerDragArea];
        NSLog (@"Initial drag");
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        if (distanceSecondImage <100)
        {
            [self distanceBetweenSecondImageAndAnswerDragArea];
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionSecondImage.constant = 46;
                self.yPositionSecondImage.constant = -222;
                [self.view layoutIfNeeded];
                NSLog (@"This has been dragged and let go into the right area");
                
                if ([self.theUltimateGame isPerson:self.peopleThatWereChosen[1] matchedToQuote:self.quoteLabel.text])
                {
                    [[self.view layer] setBackgroundColor:[UIColor greenColor].CGColor];
                    
                    NSLog (@"WINNER WINNER WINNER!!!");
                    
                    [self increaseScoreByOne];
                    
                    [[self.view layer] setBackgroundColor:[UIColor lightGrayColor].CGColor];
                    
#warning test
                    [UIView animateWithDuration:1.5 animations:^{
                        self.xPositionSecondImage.constant = 0;
                        self.yPositionSecondImage.constant = 0;
                        [self.view layoutIfNeeded];
                        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                        
                        [self displayNewQuote];
                        
                    }];
                }
                else {
                    
                    [[self.view layer] setBackgroundColor:[UIColor redColor].CGColor];
                    
                    [[self.view layer] setBackgroundColor:[UIColor lightGrayColor].CGColor];
                    
#warning test
                    [UIView animateWithDuration:1.5 animations:^{
                        self.xPositionSecondImage.constant = 0;
                        self.yPositionSecondImage.constant = 0;
                        [self.view layoutIfNeeded];
                        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                        
                        [self displayNewQuote];
                        
                    }];
                    
                    
                    
                }
            }];
        }
        else
        {
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionSecondImage.constant = 0;
                self.yPositionSecondImage.constant = 0;
                [self.view layoutIfNeeded];
                [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                NSLog (@"Dragged and let go into wrong area");
            }];
        }
    }
    
    CGFloat deltaX = fingerLocation.x - self.oldPosition.x;
    CGFloat deltaY = fingerLocation.y - self.oldPosition.y;
    
    self.oldPosition = fingerLocation;
    
    self.xPositionSecondImage.constant +=deltaX;
    self.yPositionSecondImage.constant +=deltaY;
    
}

-(void)dragThirdImage:(UIPanGestureRecognizer *)gesture
{
    [UIView animateWithDuration:1.0 animations:^{
        self.dragHereLabel.alpha = 0.0f;
    }];
    
    double distanceThirdImage = [self.thirdImage distanceToView:self.answerDragArea];
    
    CGPoint fingerLocation = [gesture locationInView:self.view];
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        self.oldPosition = fingerLocation;
        [self distanceBetweenThirdImageAndAnswerDragArea];
        NSLog (@"Initial drag");
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        if (distanceThirdImage <100)
        {
            [self distanceBetweenThirdImageAndAnswerDragArea];
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionThirdImage.constant = -47;
                self.yPositionThirdImage.constant = -222;
                [self.view layoutIfNeeded];
                NSLog (@"Dragged into the right area and let go");
                if ([self.theUltimateGame isPerson:self.peopleThatWereChosen[2] matchedToQuote:self.quoteLabel.text])
                {
                    [[self.view layer] setBackgroundColor:[UIColor greenColor].CGColor];
                    
                    NSLog (@"WINNER WINNER WINNER!!!");
                    [self increaseScoreByOne];
                    
                    [[self.view layer] setBackgroundColor:[UIColor lightGrayColor].CGColor];
                    
#warning test
                    [UIView animateWithDuration:1.5 animations:^{
                        self.xPositionThirdImage.constant = 0;
                        self.yPositionThirdImage.constant = 0;
                        [self.view layoutIfNeeded];
                        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                        
                        [self displayNewQuote];
                        
                    }];
                }
                else {
                    
                    [[self.view layer] setBackgroundColor:[UIColor redColor].CGColor];
                    
                    [[self.view layer] setBackgroundColor:[UIColor lightGrayColor].CGColor];
                    
#warning test
                    [UIView animateWithDuration:1.5 animations:^{
                        self.xPositionThirdImage.constant = 0;
                        self.yPositionThirdImage.constant = 0;
                        [self.view layoutIfNeeded];
                        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                        
                        [self displayNewQuote];
                        
                    }];
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
            }];
        }
        else
        {
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionThirdImage.constant = 0;
                self.yPositionThirdImage.constant = 0;
                [self.view layoutIfNeeded];
                [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                NSLog (@"Dragged into the wrong area and let go");
            }];
        }
    }
    
    CGFloat deltaX = fingerLocation.x - self.oldPosition.x;
    CGFloat deltaY = fingerLocation.y - self.oldPosition.y;
    
    self.oldPosition = fingerLocation;
    
    self.xPositionThirdImage.constant +=deltaX;
    self.yPositionThirdImage.constant +=deltaY;
    
}

-(void)dragFourthImage:(UIPanGestureRecognizer *)gesture
{
    [UIView animateWithDuration:1.0 animations:^{
        self.dragHereLabel.alpha = 0.0f;
    }];
    
    double distanceFourthImage = [self.fourthImage distanceToView:self.answerDragArea];
    
    CGPoint fingerLocation = [gesture locationInView:self.view];
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        self.oldPosition = fingerLocation;
        [self distanceBetweenFourthImageAndAnswerDragArea];
        NSLog (@"Initial drag");
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        if (distanceFourthImage <100)
        {
            [self distanceBetweenFourthImageAndAnswerDragArea];
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionFourthImage.constant = -141;
                self.yPositionFourthImage.constant = -222;
                [self.view layoutIfNeeded];
                
                NSLog (@"Dragged into the right area and let go");
                if ([self.theUltimateGame isPerson:self.peopleThatWereChosen[3] matchedToQuote:self.quoteLabel.text])
                {
                    
                    [[self.view layer] setBackgroundColor:[UIColor greenColor].CGColor];
                    NSLog (@"WINNER WINNER WINNER!!!");
                    [self increaseScoreByOne];
                    
                    [[self.view layer] setBackgroundColor:[UIColor lightGrayColor].CGColor];
                    
                    [UIView animateWithDuration:1.5 animations:^{
                        self.xPositionFourthImage.constant = 0;
                        self.yPositionFourthImage.constant = 0;
                        [self.view layoutIfNeeded];
                        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                        
                        [self displayNewQuote];
                        
                    }];
                }
                else {
                    [[self.view layer] setBackgroundColor:[UIColor redColor].CGColor];
                    NSLog (@"LOSER LOSER LOSER!!!");
                    [[self.view layer] setBackgroundColor:[UIColor lightGrayColor].CGColor];
                    
                    [UIView animateWithDuration:1.5 animations:^{
                        self.xPositionFourthImage.constant = 0;
                        self.yPositionFourthImage.constant = 0;
                        [self.view layoutIfNeeded];
                        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                        
                        [self displayNewQuote];
                        
                    }];
                    
                }
                
            }];
        }
        else
        {
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionFourthImage.constant = 0;
                self.yPositionFourthImage.constant = 0;
                [self.view layoutIfNeeded];
                [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
                NSLog (@"Dragged into the wrong are and let go");
            }];
        }
    }
    
    CGFloat deltaX = fingerLocation.x - self.oldPosition.x;
    CGFloat deltaY = fingerLocation.y - self.oldPosition.y;
    
    self.oldPosition = fingerLocation;
    
    self.xPositionFourthImage.constant +=deltaX;
    self.yPositionFourthImage.constant +=deltaY;
    
}

-(void)distanceBetweenFirstImageAndAnswerDragArea
{
    double distanceFirstImage = [self.firstImage distanceToView:self.answerDragArea];
    
    if (distanceFirstImage < 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
    }
    else if (distanceFirstImage > 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
    }
    
}

-(void)distanceBetweenSecondImageAndAnswerDragArea
{
    double distanceSecondImage = [self.secondImage distanceToView:self.answerDragArea];
    
    if (distanceSecondImage < 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
    }
    else if (distanceSecondImage > 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
    }
}

-(void)distanceBetweenThirdImageAndAnswerDragArea
{
    double distanceThirdImage = [self.thirdImage distanceToView:self.answerDragArea];
    
    if (distanceThirdImage < 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
    }
    else if (distanceThirdImage > 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
    }
}

-(void)distanceBetweenFourthImageAndAnswerDragArea
{
    double distanceFourthImage = [self.fourthImage distanceToView:self.answerDragArea];
    
    if (distanceFourthImage < 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
    }
    else if (distanceFourthImage > 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
    }
}

- (IBAction)resetButton:(id)sender {
    
    [UIView animateWithDuration:1.5 animations:^{
        self.xPositionFirstImage.constant = 0;
        self.yPositionFirstImage.constant = 0;
        self.xPositionSecondImage.constant = 0;
        self.yPositionSecondImage.constant = 0;
        self.xPositionThirdImage.constant = 0;
        self.yPositionThirdImage.constant = 0;
        self.xPositionFourthImage.constant = 0;
        self.yPositionFourthImage.constant = 0;
        [self.answerDragArea.layer setBorderColor:[UIColor clearColor].CGColor];
        [self.view layoutIfNeeded];
        
    }];
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
