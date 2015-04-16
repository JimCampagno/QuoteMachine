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
    
    self.imageView.layer.borderWidth = 1.0;
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

@end