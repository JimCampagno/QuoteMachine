//
//  PersonCollectionViewCell.h
//  QuoteMachine
//
//  Created by Jim Campagno on 4/16/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *name;

- (void)fixTheWordWrapWithLabel;
- (void)setupImageToBeDisplayedInCell;
- (void)fillInCellForDisplayWithName:(NSString *)name andPhoto:(UIImage *)image;

@end