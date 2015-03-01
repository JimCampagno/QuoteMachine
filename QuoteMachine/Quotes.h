//
//  Quotes.h
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Quotes : NSManagedObject

@property (nonatomic, retain) NSString * quote;
@property (nonatomic, retain) Person *person;

@end
