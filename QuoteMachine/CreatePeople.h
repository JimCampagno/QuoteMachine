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

//Scientists
- (void)setNeilDegrasseTyson:(Person *)person;
- (void)setBillNye:(Person *)person;
- (void)setCarlSagan:(Person *)person;
- (void)setisaacNewton:(Person *)person;

//Cartoon Characters
- (void)setSuperMario:(Person *)person;
- (void)setFinnTheHuman:(Person *)person;
- (void)setHomerSimpson:(Person *)person;
- (void)setEricCartman:(Person *)person;


//Comedians
- (void)setMitchHedberg:(Person *)person;
- (void)setLarryDavid:(Person *)person;
- (void)setTinaFey:(Person *)person;
- (void)setAmyPoehler:(Person *)person;

//Sports figures
- (void)setMichaelJordan:(Person *)person;
- (void)setMuhammadAli:(Person *)person;
- (void)setStuartScott:(Person *)person;
- (void)setVinceLombardi:(Person *)person;

//Mixed Bag
- (void)setJaneGoodall:(Person *)person;
- (void)setAnitaBorg:(Person *)person;








@end
