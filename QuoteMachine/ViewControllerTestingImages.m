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

@interface ViewControllerTestingImages ()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray * fourPeopleChosen;

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
        
        [cell animateWhenAddedToArray];
    }
    
}

- (void)deselectSpecificCell:(PersonCollectionViewCell *)cell containingPerson:(Person *)personTapped {
    
    
    [self.fourPeopleChosen removeObject:personTapped];
    
    [cell animateWhenRemovedFromArray];
   
}


- (NSMutableArray *)fourPeopleChosen {
    if (!_fourPeopleChosen) {
        _fourPeopleChosen = [[NSMutableArray alloc] init];
    }
    return _fourPeopleChosen;
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
