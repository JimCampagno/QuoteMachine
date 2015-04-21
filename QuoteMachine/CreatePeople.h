//
//  initialCreationOfGame.h
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "QuoteDataStore.h"
#import <UIKit/UIKit.h>

@class Person;
@class Quotes;

@interface CreatePeople : NSObject

//CreateAllPeopleAtOnce
+ (void)createAllOfTheVariousPeopleWithContext:(NSManagedObjectContext *)context;

@end
