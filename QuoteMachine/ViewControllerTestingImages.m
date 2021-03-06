//
//  ViewControllerTestingImages.m
//  QuoteMachine
//
//  Created by Jim Campagno on 4/13/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "ViewControllerTestingImages.h"
#import "Person.h"
#import "PersonCollectionViewCell.h"
#import "ColorHelper.h"
#import "MatchAQuoteToAPersonViewController.h"


@interface ViewControllerTestingImages ()

@property (strong, nonatomic) NSMutableArray * fourPeopleChosen;

@property (weak, nonatomic) IBOutlet UILabel *selectFourPeople;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIImageView *firstImage;
@property (weak, nonatomic) IBOutlet UIImageView *secondImage;
@property (weak, nonatomic) IBOutlet UIImageView *thirdImage;
@property (weak, nonatomic) IBOutlet UIImageView *fourthImage;

@property (weak, nonatomic) IBOutlet UIImageView *blurView;
@property (strong, nonatomic) UIVisualEffectView *blurEffectView;

@property (strong, nonatomic) UILabel *playLabel;
@property (strong, nonatomic) UILabel *cancelLabel;

@property (weak, nonatomic) IBOutlet UIImageView *gameImageOne;
@property (weak, nonatomic) IBOutlet UIImageView *gameImageTwo;
@property (weak, nonatomic) IBOutlet UIImageView *gameImageThree;
@property (weak, nonatomic) IBOutlet UIImageView *gameImageFour;
@end

@implementation ViewControllerTestingImages


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    self.dataStore = [QuoteDataStore sharedDataStore];
    [self.dataStore fetchData];
    
    [self setupAllFourTopImages];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.selectFourPeople.layer.borderWidth = 0.5;
    self.selectFourPeople.layer.borderColor = [UIColor blackColor].CGColor;
    self.selectFourPeople.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    self.selectFourPeople.font = [UIFont fontWithName:@"Courier-Bold" size:29.0f];
    
    
    
    
}

- (void)setupTopImageCell:(UIImageView *)image {
    
    image.layer.borderWidth = 1.5;
    image.layer.borderColor = [UIColor grayColor].CGColor;
    image.layer.cornerRadius = 34.0;
    image.layer.masksToBounds = YES;
}

- (void)setupAllFourTopImages {
    
    [self setupTopImageCell:self.firstImage];
    [self setupTopImageCell:self.secondImage];
    [self setupTopImageCell:self.thirdImage];
    [self setupTopImageCell:self.fourthImage];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Person *personToUse = [self.dataStore.quotesReadyForGame objectAtIndex:indexPath.row];
    PersonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"personCell" forIndexPath:indexPath];
    [cell fillInCellForDisplayWithName:personToUse.name andPhoto:personToUse.thumbnailImage];
    
    if ([self.fourPeopleChosen containsObject:personToUse]) {
        
        [cell setUpPropertiesOfCellOnReuseWhenSelected];
        
        return cell;
        
    } else {
        
        return cell;
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.dataStore.quotesReadyForGame count];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectFourPeople.hidden = YES;
    
    UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
    PersonCollectionViewCell *cellToUse = (PersonCollectionViewCell *)datasetCell;
    Person *personTapped = [self.dataStore.quotesReadyForGame objectAtIndex:indexPath.row];
    
    if ([self.fourPeopleChosen containsObject:personTapped]) {
        
        if ([self.fourPeopleChosen count] == 4) {
            
            [self.blurEffectView removeFromSuperview];
            self.firstImage.alpha = 1.0;
            self.secondImage.alpha = 1.0;
            self.thirdImage.alpha = 1.0;
            self.fourthImage.alpha = 1.0;
        }
        [self deselectSpecificCell:cellToUse containingPerson:personTapped];
        
    } else {
        
        [self selectSpecificCell:cellToUse containingPerson:personTapped];
        
    }
}


- (void)selectSpecificCell:(PersonCollectionViewCell *)cell containingPerson:(Person *)personTapped {
    
    if ([self.fourPeopleChosen count] == 4) {
        
        [cell animateCellWhenSelected];
        
    } else {
        
        [self.fourPeopleChosen addObject:personTapped];
        [self addImageToTopOfViewWithPerson:personTapped];
        
        cell.alpha = 0.6;
        
        
        cell.imageView.alpha = 1.0;
        
        [cell animateWhenAddedToArray];
        
        if ([self.fourPeopleChosen count] == 4) {
            
            [self blurOutTopImages];
        }
    }
    
}

- (void)deselectSpecificCell:(PersonCollectionViewCell *)cell containingPerson:(Person *)personTapped {
    
    
    [self.fourPeopleChosen removeObject:personTapped];
    [self removeImageFromTopViewWithPerson:personTapped];
    [cell animateWhenRemovedFromArray];
    cell.alpha = 1.0;

    
}


- (NSMutableArray *)fourPeopleChosen {
    if (!_fourPeopleChosen) {
        _fourPeopleChosen = [[NSMutableArray alloc] init];
    }
    return _fourPeopleChosen;
}

- (void)addImageToTopOfViewWithPerson:(Person *)person {
    
    if (!self.firstImage.image) {
        
        self.firstImage.image = person.thumbnailImage;
        self.firstImage.layer.borderColor = [UIColor greenColor].CGColor;
        self.firstImage.layer.borderWidth = 2.5;

        
        
    }
    else if (!self.secondImage.image) {
        
        self.secondImage.image = person.thumbnailImage;
        self.secondImage.layer.borderColor = [UIColor greenColor].CGColor;
        self.secondImage.layer.borderWidth = 2.5;


        
    }
    else if (!self.thirdImage.image) {
        
        self.thirdImage.image = person.thumbnailImage;
        self.thirdImage.layer.borderColor = [UIColor greenColor].CGColor;
        self.thirdImage.layer.borderWidth = 2.5;


        
    }
    else if (!self.fourthImage.image) {
        
        self.fourthImage.image = person.thumbnailImage;
        self.fourthImage.layer.borderColor = [UIColor greenColor].CGColor;
        self.fourthImage.layer.borderWidth = 2.5;


        //        self.fourthImage.layer.borderColor = [ColorHelper randomColor];
        //        self.fourthImage.layer.borderWidth = 1.2;
    }
}

- (void)removeImageFromTopViewWithPerson:(Person *)person {
    
    if (self.firstImage.image == person.thumbnailImage) {
        
        self.firstImage.image = nil;
        self.firstImage.layer.borderColor = [UIColor grayColor].CGColor;
        self.firstImage.layer.borderWidth = 1.5;



        
        
    }
    else if (self.secondImage.image == person.thumbnailImage) {
        self.secondImage.image = nil;
        self.secondImage.layer.borderColor = [UIColor grayColor].CGColor;
        self.secondImage.layer.borderWidth = 1.5;

        
    }
    else if (self.thirdImage.image == person.thumbnailImage) {
        self.thirdImage.image = nil;
        self.thirdImage.layer.borderColor = [UIColor grayColor].CGColor;
        self.thirdImage.layer.borderWidth = 1.5;

        
    }
    else if (self.fourthImage.image == person.thumbnailImage) {
        self.fourthImage.image = nil;
        self.fourthImage.layer.borderColor = [UIColor grayColor].CGColor;
        self.fourthImage.layer.borderWidth = 1.5;

        //        self.fourthImage.layer.borderWidth = 0.0;
    }
}

- (void)blurOutTopImages {
    
    // Blur effect
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [self.blurEffectView setFrame:self.blurView.bounds];
    
    self.blurEffectView.alpha = 0.0;
    
    
    [self.view addSubview:self.blurEffectView];
    
    
    // Vibrancy effect
    UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
    [vibrancyEffectView setFrame:self.blurView.bounds];
    
    
    //Attributes to use
    CGFloat heightForPlayLabel =[[UIScreen mainScreen] bounds].size.height/2 -35;
    CGFloat widthForPlayLabel = [[UIScreen mainScreen] bounds].size.width/2;
    
    
    // Label for vibrant text
    self.playLabel = [[UILabel alloc] init];
    [self.playLabel setText:@"Play"];
    [self.playLabel setFont:[UIFont systemFontOfSize:72.0f]];
    [self.playLabel sizeToFit];
    [self.playLabel setCenter: CGPointMake(widthForPlayLabel, heightForPlayLabel)];
    
    //Make the play label Tappable
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.playLabel addGestureRecognizer:tapGestureRecognizer];
    self.playLabel.userInteractionEnabled = YES;
    
    
    //Attributes to use
    CGFloat heightOfIphone =[[UIScreen mainScreen] bounds].size.height/2 + 74;
    CGFloat widthOfIphone = [[UIScreen mainScreen] bounds].size.width/2;
    
    self.cancelLabel = [[UILabel alloc] init];
    [self.cancelLabel setText:@"Cancel"];
    [self.cancelLabel setFont:[UIFont systemFontOfSize:40.0f]];
    [self.cancelLabel sizeToFit];
    [self.cancelLabel setCenter:CGPointMake(widthOfIphone, heightOfIphone)];
    
    UITapGestureRecognizer *tapGestureRecognizerForCancel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelLabelTapped)];
    tapGestureRecognizerForCancel.numberOfTapsRequired = 1;
    [self.cancelLabel addGestureRecognizer:tapGestureRecognizerForCancel];
    self.cancelLabel.userInteractionEnabled = YES;
    
    // Add labels to the vibrancy view
    [[vibrancyEffectView contentView] addSubview:self.playLabel];
    [[vibrancyEffectView contentView] addSubview:self.cancelLabel];
    
    // Add the vibrancy view to the blur view
    [[self.blurEffectView contentView] addSubview:vibrancyEffectView];
    
    [UIView animateWithDuration:0.7 animations:^{
        self.blurEffectView.alpha = 1.0;
    }];
    
    [self fadeInFourImagesIntoBlurView:self.blurEffectView];
}

- (void)fadeInFourImagesIntoBlurView:(UIVisualEffectView *)view {
    
    self.gameImageOne.hidden = NO;
    self.gameImageTwo.hidden = NO;
    self.gameImageThree.hidden = NO;
    self.gameImageFour.hidden = NO;
    
    self.gameImageOne.alpha = 0.0;
    self.gameImageTwo.alpha = 0.0;
    self.gameImageThree.alpha = 0.0;
    self.gameImageFour.alpha = 0.0;
    
    NSMutableArray *photosOfPeopleChosen = [[NSMutableArray alloc] init];
    
    for (Person *person in self.fourPeopleChosen ) {
        
        [photosOfPeopleChosen addObject:person.thumbnailImage];
        
    }
    self.gameImageOne.image = photosOfPeopleChosen[0];
    self.gameImageTwo.image = photosOfPeopleChosen[1];
    self.gameImageThree.image = photosOfPeopleChosen[2];
    self.gameImageFour.image = photosOfPeopleChosen[3];
    
    [self setUpGameSelectedImages:self.gameImageOne];
    [self setUpGameSelectedImages:self.gameImageTwo];
    [self setUpGameSelectedImages:self.gameImageThree];
    [self setUpGameSelectedImages:self.gameImageFour];
    
    //Add images chosen to the blur view
    [[view contentView] addSubview:self.gameImageOne];
    [[view contentView] addSubview:self.gameImageTwo];
    [[view contentView] addSubview:self.gameImageThree];
    [[view contentView] addSubview:self.gameImageFour];
    
    [UIView animateWithDuration:2.0 animations:^{
        
        
        self.gameImageOne.alpha = 1.0;
        self.gameImageTwo.alpha = 1.0;
        self.gameImageThree.alpha = 1.0;
        self.gameImageFour.alpha = 1.0;
        
    }];
    
}

- (void)labelTapped {
    
    [self performSegueWithIdentifier:@"gameTime" sender:self];
}

- (void)cancelLabelTapped {
    
    UIStoryboard *mainSB = self.storyboard;
    UINavigationController *initialVC = [mainSB instantiateInitialViewController];
    [[UIApplication sharedApplication].delegate.window setRootViewController:initialVC];
}

- (void)setUpGameSelectedImages:(UIImageView *)image {
    
    image.layer.borderWidth = 1.5;
    image.layer.borderColor = [ColorHelper randomColor];
    image.layer.cornerRadius = 42.5;
    image.layer.masksToBounds = YES;
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    MatchAQuoteToAPersonViewController *newVC = segue.destinationViewController;
    newVC.fourChosenPeople = self.fourPeopleChosen;
}


@end
