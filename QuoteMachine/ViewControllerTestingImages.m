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
        self.firstImage.layer.borderColor = [ColorHelper randomColor].CGColor;
        self.firstImage.layer.borderWidth = 2.0;
    }
    else if (!self.secondImage.image) {
        
        self.secondImage.image = person.thumbnailImage;
        self.secondImage.layer.borderColor = [ColorHelper randomColor].CGColor;
        self.secondImage.layer.borderWidth = 2.0;
    }
    else if (!self.thirdImage.image) {
        
        self.thirdImage.image = person.thumbnailImage;
        self.thirdImage.layer.borderColor = [ColorHelper randomColor].CGColor;
        self.thirdImage.layer.borderWidth = 2.0;
    }
    else if (!self.fourthImage.image) {
        
        self.fourthImage.image = person.thumbnailImage;
        self.fourthImage.layer.borderColor = [ColorHelper randomColor].CGColor;
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
    
    // Label for vibrant text
    self.playLabel = [[UILabel alloc] init];
    [self.playLabel setText:@"Play"];
    [self.playLabel setFont:[UIFont systemFontOfSize:72.0f]];
    [self.playLabel sizeToFit];
    [self.playLabel setCenter: self.blurView.center];
    
    //Make the play label Tappable
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.playLabel addGestureRecognizer:tapGestureRecognizer];
    self.playLabel.userInteractionEnabled = YES;
    
    // Add label to the vibrancy view
    [[vibrancyEffectView contentView] addSubview:self.playLabel];
    
    // Add the vibrancy view to the blur view
    [[self.blurEffectView contentView] addSubview:vibrancyEffectView];
    
}

- (void)labelTapped {
    
    
    NSLog(@"TAPPED IT!");
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
