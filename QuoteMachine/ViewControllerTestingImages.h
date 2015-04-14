//
//  ViewControllerTestingImages.h
//  QuoteMachine
//
//  Created by Jim Campagno on 4/13/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuoteDataStore.h"

@interface ViewControllerTestingImages : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) QuoteDataStore *dataStore;

@end
