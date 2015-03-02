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

    neilQuote1.quote = @"We are part of this universe; we are in this universe, but perhaps more important than both of those facts, is that the universe is in us";
    neilQuote2.person = person;
    neilQuote2.quote = @"The only way you can invent tomorrow is if you break out of the enclosure that the school system has provided for you by the exams written by people who are trained in another generation.";
    neilQuote2.person = person;
    neilQuote3.quote = @"I said that if an alien came to visit, I'd be embarrassed to tell them that we fight wars to pull fossil fuels out of the ground to run our transportation. They'd be like, 'What?'";
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

- (void)setFinnTheHuman:(Person *)person {
    
    person.name = @"Finn The Human";
    person.fieldOfStudy = @"Cartoon";
    person.summary = @"Finn is a 15-year-old human. He is roughly five feet tall and is missing several teeth due to his habit of biting trees and rocks among other things.  Finn is, along with Jake the Dog, the main character of the American animated television series Adventure Time created by Pendleton Ward.";
    // No thumnailimage set yet
    // No profilepicture set yet
    
    Quotes *finnQuote1 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    Quotes *finnQuote2 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    Quotes *finnQuote3 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    
    finnQuote1.quote = @"Everything small is just a smaller version of something big!";
    finnQuote2.quote = @"Man, you're letting your brain dial turn your fear voluem up.";
    finnQuote3.quote = @"Imagination is for turbo-nerds who can't handle how kick-butt reality is!.";
    finnQuote1.person = person;
    finnQuote2.person = person;
    finnQuote3.person = person;
    
    [person addQuotesObject:finnQuote1];
    [person addQuotesObject:finnQuote2];
    [person addQuotesObject:finnQuote3];
}




@end
