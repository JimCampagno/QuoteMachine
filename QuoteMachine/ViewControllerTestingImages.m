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

    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.dataStore.quotesReadyForGame count];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    

    UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
    PersonCollectionViewCell *cellToUse = (PersonCollectionViewCell *)datasetCell;
    
    NSLog(@"You selected %@", cellToUse.name);
    
    cellToUse.imageView.layer.borderWidth = 2.5;
    cellToUse.imageView.layer.borderColor = [UIColor greenColor].CGColor;
    
    [UIView animateKeyframesWithDuration:0.6
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
                                  
                                  cellToUse.imageView.transform = CGAffineTransformMakeScale(0.6, 0.6);
                                  
                                  [UIView addKeyframeWithRelativeStartTime:0.0
                                                          relativeDuration:1 / 3.0
                                                                animations:^{
                                                                    
                                                                    cellToUse.imageView.transform =
                                                                    CGAffineTransformMakeRotation(
                                                                                                  M_PI + (M_PI / 4));
                                                                }];
                                  
                                  [UIView addKeyframeWithRelativeStartTime:1 / 3.0
                                                          relativeDuration:1 / 3.0
                                                                animations:^{
                                                                    
                                                                    cellToUse.imageView.transform =
                                                                    CGAffineTransformMakeRotation(
                                                                                                  M_PI - (M_PI / 4));
                                                                }];
                                  
                                  [UIView addKeyframeWithRelativeStartTime:2 / 3.0
                                                          relativeDuration:1 / 3.0
                                                                animations:^{
                                                                    
                                                                    cellToUse.imageView.transform =
                                                                    CGAffineTransformMakeRotation(0);
                                                                }];
                              }
                              completion:^(BOOL finished) {
                                  
                                  cellToUse.imageView.layer.borderWidth = 1.5;
                                  
                              }];

    
}


-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
//    UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:indexPath];
//    datasetCell.backgroundColor = [UIColor redColor]; // Default color
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

@end
