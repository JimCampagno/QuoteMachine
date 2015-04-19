//
//  PersonCollectionViewCell.m
//  QuoteMachine
//
//  Created by Jim Campagno on 4/16/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "PersonCollectionViewCell.h"

@implementation PersonCollectionViewCell


- (void)fixTheWordWrapWithLabel {
    
    self.name.numberOfLines = 0;
    self.name.lineBreakMode = NSLineBreakByWordWrapping;
}

- (void)setupImageToBeDisplayedInCell {
    
    self.imageView.layer.borderWidth = 0.90;
    self.imageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.imageView.layer.cornerRadius = 40;
    self.imageView.layer.masksToBounds = YES;
}

- (void)fillInCellForDisplayWithName:(NSString *)name andPhoto:(UIImage *)image {
    
    [self fixTheWordWrapWithLabel];
    [self setupImageToBeDisplayedInCell];
    
    self.name.text = name;
    self.imageView.image = image;
}

- (void)animateCellWhenSelected {
    
    [UIView animateWithDuration:0.095
                     animations:^{
                         
                         self.imageView.transform = CGAffineTransformMakeScale(0.85, 0.85);
                         
                     }
                     completion:^(BOOL finished){
                         
                         [UIView animateWithDuration:0.095
                                          animations:^{
                                              
                                              self.imageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                              
                                          }
                                          completion:^ (BOOL finished) {
                                              
                                          }];
                     }];
    
}

- (void)animateWhenAddedToArray {
    
    [UIView animateWithDuration:0.095
                     animations:^{
                         
                         self.imageView.transform = CGAffineTransformMakeScale(0.85, 0.85);
                         
                     }
                     completion:^(BOOL finished){
                         
                         [UIView animateWithDuration:0.095
                                          animations:^{
                                              
                                              self.imageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                              self.imageView.layer.borderWidth = 3.5;
                                              self.imageView.layer.borderColor = [UIColor greenColor].CGColor;
                                              
                                          }
                                          completion:^ (BOOL finished) {
                                              
                                          }];
                     }];

}

- (void)animateWhenRemovedFromArray {
    
    [UIView animateWithDuration:0.095
                     animations:^{
                         
                         self.imageView.transform = CGAffineTransformMakeScale(0.90, 0.90);
                         
                     }
                     completion:^(BOOL finished){
                         
                         [UIView animateWithDuration:0.095
                                          animations:^{
                                              
                                              self.imageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                                              self.imageView.layer.borderWidth = 1.0;
                                              self.imageView.layer.borderColor = [UIColor grayColor].CGColor;
                                              
                                          }
                                          completion:^ (BOOL finished) {
                                              
                                              
                                          }];
                     }];

}

- (void)setUpPropertiesOfCellOnReuseWhenSelected {
    
    self.imageView.layer.borderWidth = 2.75;
    self.imageView.layer.borderColor = [UIColor greenColor].CGColor;
    
}

@end