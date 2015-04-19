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

@interface ViewControllerTestingImages ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray * fourPeopleChosen;
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
        self.firstImage.layer.borderColor = [ColorHelper randomColor];
        self.firstImage.layer.borderWidth = 2.0;
    }
    else if (!self.secondImage.image) {
        
        self.secondImage.image = person.thumbnailImage;
        self.secondImage.layer.borderColor = [ColorHelper randomColor];
        self.secondImage.layer.borderWidth = 2.0;
    }
    else if (!self.thirdImage.image) {
        
        self.thirdImage.image = person.thumbnailImage;
        self.thirdImage.layer.borderColor = [ColorHelper randomColor];
        self.thirdImage.layer.borderWidth = 2.0;
    }
    else if (!self.fourthImage.image) {
        
        self.fourthImage.image = person.thumbnailImage;
        self.fourthImage.layer.borderColor = [ColorHelper randomColor];
        self.fourthImage.layer.borderWidth = 2.0;
    }
}

- (void)removeImageFromTopViewWithPerson:(Person *)person {
    
    if (self.firstImage.image == person.thumbnailImage) {
        
        self.firstImage.image = nil;
        self.firstImage.layer.borderColor = [UIColor grayColor].CGColor;
        self.firstImage.layer.borderWidth = 0.5;
        
    }
    else if (self.secondImage.image == person.thumbnailImage) {
        self.secondImage.image = nil;
        self.secondImage.layer.borderColor = [UIColor grayColor].CGColor;
        self.secondImage.layer.borderWidth = 0.5;
    }
    else if (self.thirdImage.image == person.thumbnailImage) {
        self.thirdImage.image = nil;
        self.thirdImage.layer.borderColor = [UIColor grayColor].CGColor;
        self.thirdImage.layer.borderWidth = 0.5;
    }
    else if (self.fourthImage.image == person.thumbnailImage) {
        self.fourthImage.image = nil;
        self.fourthImage.layer.borderColor = [UIColor grayColor].CGColor;
        self.fourthImage.layer.borderWidth = 0.5;
    }
}

- (void)blurOutTopImages {
    
    // Blur effect
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    [self.blurEffectView setFrame:self.blurView.bounds];
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
    
    
    
    self.gameImageOne.hidden = NO;
    self.gameImageTwo.hidden = NO;
    self.gameImageThree.hidden = NO;
    self.gameImageFour.hidden = NO;
    
    
    NSMutableArray *photosOfPeopleChosen = [[NSMutableArray alloc] init];
    
    for (Person *person in self.fourPeopleChosen ) {
        
        [photosOfPeopleChosen addObject:person.thumbnailImage];
        
    }
    
    
    [self setUpConstraintsForGameChosenImages:self.gameImageOne];
    
    self.gameImageOne.image = photosOfPeopleChosen[0];
    self.gameImageTwo.image = photosOfPeopleChosen[1];
    self.gameImageThree.image = photosOfPeopleChosen[2];
    self.gameImageFour.image = photosOfPeopleChosen[3];
    
    
    
    [self setUpGameSelectedImages:self.gameImageOne];
    [self setUpGameSelectedImages:self.gameImageTwo];
    [self setUpGameSelectedImages:self.gameImageThree];
    [self setUpGameSelectedImages:self.gameImageFour];
    
    
    [[self.blurEffectView contentView] addSubview:self.gameImageOne];
    [[self.blurEffectView contentView] addSubview:self.gameImageTwo];
    [[self.blurEffectView contentView] addSubview:self.gameImageThree];
    [[self.blurEffectView contentView] addSubview:self.gameImageFour];
    
    
}

- (void)labelTapped {
    
    NSLog(@"Play Label Tapped!");
}

- (void)cancelLabelTapped {
    
    [self.blurEffectView removeFromSuperview];
    
    [self.fourPeopleChosen removeAllObjects];
    
    [self.collectionView reloadData];
    
    self.firstImage.image = nil;
    self.secondImage.image = nil;
    self.thirdImage.image = nil;
    self.fourthImage.image = nil;
    
    NSLog(@"Cancel Label Tapped!");
    
}

- (void)setUpGameSelectedImages:(UIImageView *)image {
    
    image.layer.borderWidth = 1.5;
    image.layer.borderColor = [ColorHelper randomColor];
    image.layer.cornerRadius = 42.5;
    image.layer.masksToBounds = YES;
    
}

- (void)setUpConstraintsForGameChosenImages:(UIImageView *)image {
    
    [image removeConstraints:image.constraints];
    image.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *alignCenterX =
    [NSLayoutConstraint constraintWithItem:image
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
     
                                    toItem:self.blurEffectView
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:0.25
     
                                  constant:0.0];
    [self.view addConstraint:alignCenterX];
    
    NSLayoutConstraint *alignCenterY =
    [NSLayoutConstraint constraintWithItem:image
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
     
                                    toItem:self.blurEffectView
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.6
     
                                  constant:0.0];
    [self.view addConstraint:alignCenterY];
    
    
    
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
