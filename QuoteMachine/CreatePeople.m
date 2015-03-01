//
//  initialCreationOfGame.m
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "CreatePeople.h"
#import "Person+Methods.h"
#import "Quotes.h"
#import <UIKit/UIKit.h>
#import "QuoteDataStore.h"
#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>


@interface CreatePeople ()

@property (strong, nonatomic) QuoteDataStore *dataStoreForCreate;

@end


@implementation CreatePeople


- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.dataStoreForCreate = [QuoteDataStore sharedDataStore];
    }
    return self;
}

- (void)setNeilDegrasseTyson:(Person *)person {
    
    person.name = @"Neil deGrasse Tyson";
    person.fieldOfStudy = @"Science";
    person.summary = @"Neil deGrasse Tyson is an American astrophysicist, cosmologist, author, and science communicator. Since 1996, he has been the Frederick P. Rose Director of the Hayden Planetarium at the Rose Center for Earth and Space in New York City.";
    person.thumbnailImage = [UIImage imageNamed:@"neilDegrasseTyson"];
    person.profilePicture = [UIImage imageNamed:@"neilDegrasseTysonProfilePicture"];
    
    Quotes *neilQuote1 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    Quotes *neilQuote2 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    Quotes *neilQuote3 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];

    neilQuote1.quote = @"Hello, my favorite number is 1";
    neilQuote2.person = person;
    neilQuote2.quote = @"What is your problem man?!!!";
    neilQuote2.person = person;
    neilQuote3.quote = @"I love WATER, WHAT DO YOU LOVE";
    neilQuote3.person = person;
    
    [person addQuotesObject:neilQuote1];
    [person addQuotesObject:neilQuote2];
    [person addQuotesObject:neilQuote3];
}


- (void)setSuperMario:(Person *)person {
    
    person.name = @"Mario";
    person.fieldOfStudy = @"Gaming";
    person.summary = @"Mario is a fictional character in the Mario video game franchise, created by Nintendo's Japanese video game designer, Shigeru Miyamoto.";
    // No thumnailimage set yet
    // No profilepicture set yet
    
    Quotes *marioQuote1 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    Quotes *marioQuote2 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    Quotes *marioQuote3 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    
    marioQuote1.quote = @"It's a-me, Mario!";
    marioQuote2.quote = @"Here I go!";
    marioQuote3.quote = @"Mama Mia!";
    marioQuote1.person = person;
    marioQuote2.person = person;
    marioQuote3.person = person;

    [person addQuotesObject:marioQuote1];
    [person addQuotesObject:marioQuote2];
    [person addQuotesObject:marioQuote3];
}


- (void)setMitchHedberg:(Person *)person {
    
    person.name = @"Mitch Hedberg";
    person.fieldOfStudy = @"Comedy";
    person.summary = @"Mitchell Lee Hedberg was an American stand-up comedian known for his surreal humor and unconventional comedic delivery. His comedy typically featured short, sometimes one-line jokes mixed with absurd elements and non sequiturs.";
    // No thumnailimage set yet
    // No profilepicture set yet
    
    Quotes *mitchQuote1 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    Quotes *mitchQuote2 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    Quotes *mitchQuote3 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    
    mitchQuote1.quote = @"An escalator can never break: it can only become stairs. You should never see an Escalator Temporarily Out Of Order sign, just Escalator Temporarily Stairs. Sorry for the convenience.";
    mitchQuote2.quote = @"Rice is great if you're really hungry and want to eat two thousand of something.";
    mitchQuote3.quote = @"I don't have a girlfriend. But I do know a woman who'd be mad at me for saying that.";
    mitchQuote1.person = person;
    mitchQuote2.person = person;
    mitchQuote3.person = person;
    
    [person addQuotesObject:mitchQuote1];
    [person addQuotesObject:mitchQuote2];
    [person addQuotesObject:mitchQuote3];
}



@end
