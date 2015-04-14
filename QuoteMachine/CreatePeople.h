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
+ (void)setMichaelJordanWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setMuhammadAliWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setStuartScottWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setVinceLombardiWithMOC:(NSManagedObjectContext *)moContext;

//More Scientists
+ (void)setJaneGoodallWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setAnitaBorgWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setBarbaraMcClintockWithMOC:(NSManagedObjectContext *)moContext;
+ (void)setMarieCurieWithMOC:(NSManagedObjectContext *)moContext;

@end
