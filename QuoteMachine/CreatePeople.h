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

- (instancetype)init;

//CreateAllPeopleAtOnce
+ (void)createAllOfTheVariousPeopleWithContext:(NSManagedObjectContext *)context;

//Scientists
+ (void)setNeilDegrasseTysonWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setBillNyeWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setCarlSaganWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setisaacNewtonWithMOC:(NSManagedObjectContext *)moContext;

//Cartoon Characters
+ (void)setSuperMarioWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setFinnTheHumanWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setHomerSimpsonWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setEricCartmanWithMOC:(NSManagedObjectContext *)moContext;

//Comedians
+ (void)setMitchHedbergWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setLarryDavidWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setTinaFeyWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setAmyPoehlerWithMOC:(NSManagedObjectContext *)moContext;

//Sports figures
- (void)setMichaelJordan:(Person *)person;
- (void)setMuhammadAli:(Person *)person;
- (void)setStuartScott:(Person *)person;
- (void)setVinceLombardi:(Person *)person;

//More Scientists
- (void)setJaneGoodall:(Person *)person;
- (void)setAnitaBorg:(Person *)person;
- (void)setBarbaraMcClintock:(Person *)person;
- (void)setMarieCurie:(Person *)person;

@end
