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

@interface QuoteScreenViewController ()

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

@property (nonatomic) CGPoint oldPosition;

- (IBAction)resetButton:(id)sender;


@end

@implementation QuoteScreenViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.firstImage = self.carlSagan;
    self.secondImage = self.billNye;
    self.thirdImage = self.isaacNewton;
    self.fourthImage = self.neilTyson;
    
    [self removeConstraints];
    [self setContainerConstraints];
    [self setHeightAndWidthImageConstraints];
    [self setImageXAndYContraints];
    [self setRoundedCornersForImages];
    [self gestureSetup];

    // Do any additional setup after loading the view.
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
    [self.answerDragArea.layer setBorderColor:[UIColor grayColor].CGColor];
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
    
    self.quoteContainer.translatesAutoresizingMaskIntoConstraints = NO;
    self.dragContainer.translatesAutoresizingMaskIntoConstraints = NO;
    self.answerContainer.translatesAutoresizingMaskIntoConstraints = NO;
    self.firstImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.secondImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.thirdImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.fourthImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.answerDragArea.translatesAutoresizingMaskIntoConstraints = NO;
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
    NSLayoutConstraint *quoteContainerWidth = [NSLayoutConstraint constraintWithItem:self.quoteContainer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0];
    
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
    self.xPositionFirstImage = [NSLayoutConstraint constraintWithItem:self.firstImage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.answerContainer attribute:NSLayoutAttributeCenterX multiplier:0.25 constant:0.0];
    self.yPositionFirstImage = [NSLayoutConstraint constraintWithItem:self.firstImage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.answerContainer attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
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

-(void)dragFirstImage:(UIPanGestureRecognizer *)gesture
{
    double distanceFirstImage = [self.firstImage distanceToView:self.answerDragArea];
    
    CGPoint fingerLocation = [gesture locationInView:self.view];
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        self.oldPosition = fingerLocation;
        [self distanceBetweenFirstImageAndAnswerDragArea];
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
        }];
        }
        else
        {
        [UIView animateWithDuration:1.5 animations:^{
            self.xPositionFirstImage.constant = 0;
            self.yPositionFirstImage.constant = 0;
            [self.view layoutIfNeeded];
            [self.answerDragArea.layer setBorderColor:[UIColor grayColor].CGColor];
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
    double distanceSecondImage = [self.secondImage distanceToView:self.answerDragArea];
    
    CGPoint fingerLocation = [gesture locationInView:self.view];
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        self.oldPosition = fingerLocation;
        [self distanceBetweenSecondImageAndAnswerDragArea];
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
            }];
        }
        else
        {
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionSecondImage.constant = 0;
                self.yPositionSecondImage.constant = 0;
                [self.view layoutIfNeeded];
                [self.answerDragArea.layer setBorderColor:[UIColor grayColor].CGColor];
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
    double distanceThirdImage = [self.thirdImage distanceToView:self.answerDragArea];
    
    CGPoint fingerLocation = [gesture locationInView:self.view];
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        self.oldPosition = fingerLocation;
        [self distanceBetweenThirdImageAndAnswerDragArea];
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
            }];
        }
        else
        {
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionThirdImage.constant = 0;
                self.yPositionThirdImage.constant = 0;
                [self.view layoutIfNeeded];
                [self.answerDragArea.layer setBorderColor:[UIColor grayColor].CGColor];
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
    double distanceFourthImage = [self.fourthImage distanceToView:self.answerDragArea];
    
    CGPoint fingerLocation = [gesture locationInView:self.view];
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        self.oldPosition = fingerLocation;
        [self distanceBetweenFourthImageAndAnswerDragArea];
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
            }];
        }
        else
        {
            [UIView animateWithDuration:1.5 animations:^{
                self.xPositionFourthImage.constant = 0;
                self.yPositionFourthImage.constant = 0;
                [self.view layoutIfNeeded];
                [self.answerDragArea.layer setBorderColor:[UIColor grayColor].CGColor];
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
        [self.answerDragArea.layer setBorderColor:[UIColor greenColor].CGColor];
    }
    else if (distanceFirstImage > 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor grayColor].CGColor];
    }

}

-(void)distanceBetweenSecondImageAndAnswerDragArea
{
    double distanceSecondImage = [self.secondImage distanceToView:self.answerDragArea];
    
    if (distanceSecondImage < 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor greenColor].CGColor];
    }
    else if (distanceSecondImage > 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor grayColor].CGColor];
    }
}

-(void)distanceBetweenThirdImageAndAnswerDragArea
{
    double distanceThirdImage = [self.thirdImage distanceToView:self.answerDragArea];
    
    if (distanceThirdImage < 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor greenColor].CGColor];
    }
    else if (distanceThirdImage > 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor grayColor].CGColor];
    }
}

-(void)distanceBetweenFourthImageAndAnswerDragArea
{
    double distanceFourthImage = [self.fourthImage distanceToView:self.answerDragArea];
    
    if (distanceFourthImage < 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor greenColor].CGColor];
    }
    else if (distanceFourthImage > 100)
    {
        [self.answerDragArea.layer setBorderWidth:1.0];
        [self.answerDragArea.layer setBorderColor:[UIColor grayColor].CGColor];
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
        [self.answerDragArea.layer setBorderColor:[UIColor grayColor].CGColor];
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
