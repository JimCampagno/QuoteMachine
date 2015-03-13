//
//  GameScreenViewController.h
//  QuoteMachine
//
//  Created by Jim Campagno on 2/26/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuoteDataStore.h"

@interface GameScreenViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSMutableArray *fourPeopleChosen;
@property (strong, nonatomic) QuoteDataStore *dataStore;
@property (strong, nonatomic) NSArray *managedPersonObjects;

@end
