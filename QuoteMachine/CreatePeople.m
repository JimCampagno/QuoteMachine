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

- (void)createQuotesForPerson:(Person *)person
                   withQuote1:(NSString *)quote1
                   withQuote2:(NSString *)quote2
                   withQuote3:(NSString *)quote3 {
    
    Quotes *quoteOfPerson1 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    Quotes *quoteOfPerson2 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    Quotes *quoteOfPerson3 = [NSEntityDescription insertNewObjectForEntityForName:@"Quotes" inManagedObjectContext:self.dataStoreForCreate.managedObjectContext];
    
    quoteOfPerson1.quote = quote1;
    quoteOfPerson2.quote = quote2;
    quoteOfPerson3.quote = quote3;
    
    quoteOfPerson1.person = person;
    quoteOfPerson2.person = person;
    quoteOfPerson3.person = person;
    
    [person addQuotesObject:quoteOfPerson1];
    [person addQuotesObject:quoteOfPerson2];
    [person addQuotesObject:quoteOfPerson3];
}

- (void)setNeilDegrasseTyson:(Person *)person {
    
    person.name = @"Neil deGrasse Tyson";
    person.fieldOfStudy = @"Science";
    person.summary = @"Neil deGrasse Tyson is an American astrophysicist, cosmologist, author, and science communicator. Since 1996, he has been the Frederick P. Rose Director of the Hayden Planetarium at the Rose Center for Earth and Space in New York City.";
    person.thumbnailImage = [UIImage imageNamed:@"neilDegrasseTyson"];
    person.profilePicture = [UIImage imageNamed:@"neilDegrasseTysonProfilePicture"];
    
    NSString *neilQuote1 = @"We are part of this universe; we are in this universe, but perhaps more important than both of those facts, is that the universe is in us";
    NSString *neilQuote2 = @"The only way you can invent tomorrow is if you break out of the enclosure that the school system has provided for you by the exams written by people who are trained in another generation.";
    NSString *neilQuote3 = @"I said that if an alien came to visit, I'd be embarrassed to tell them that we fight wars to pull fossil fuels out of the ground to run our transportation. They'd be like, 'What?'";
    
    [self createQuotesForPerson:person withQuote1:neilQuote1 withQuote2:neilQuote2 withQuote3:neilQuote3];
    
}

- (void)setSuperMario:(Person *)person {
    
    person.name = @"Mario";
    person.fieldOfStudy = @"Gaming";
    person.summary = @"Mario is a fictional character in the Mario video game franchise, created by Nintendo's Japanese video game designer, Shigeru Miyamoto.";
    // No thumnailimage set yet
    // No profilepicture set yet
    
    NSString *marioQuote1 = @"It's a-me, Mario!";
    NSString *marioQuote2 = @"Here I go!";
    NSString *marioQuote3 = @"Mama Mia!";
    
    [self createQuotesForPerson:person withQuote1:marioQuote1 withQuote2:marioQuote2 withQuote3:marioQuote3];
}

- (void)setMitchHedberg:(Person *)person {
    
    person.name = @"Mitch Hedberg";
    person.fieldOfStudy = @"Comedy";
    person.summary = @"Mitchell Lee Hedberg was an American stand-up comedian known for his surreal humor and unconventional comedic delivery. His comedy typically featured short, sometimes one-line jokes mixed with absurd elements and non sequiturs.";
    // No thumnailimage set yet
    // No profilepicture set yet
    
    NSString *mitchQuote1 = @"An escalator can never break: it can only become stairs. You should never see an Escalator Temporarily Out Of Order sign, just Escalator Temporarily Stairs. Sorry for the convenience.";
    NSString *mitchQuote2 = @"Rice is great if you're really hungry and want to eat two thousand of something.";
    NSString *mitchQuote3 = @"I don't have a girlfriend. But I do know a woman who'd be mad at me for saying that.";
    
    [self createQuotesForPerson:person withQuote1:mitchQuote1 withQuote2:mitchQuote2 withQuote3:mitchQuote3];
}

- (void)setFinnTheHuman:(Person *)person {
    
    person.name = @"Finn The Human";
    person.fieldOfStudy = @"Cartoon";
    person.summary = @"Finn is a 15-year-old human. He is roughly five feet tall and is missing several teeth due to his habit of biting trees and rocks among other things.  Finn is, along with Jake the Dog, the main character of the American animated television series Adventure Time created by Pendleton Ward.";
    // No thumnailimage set yet
    // No profilepicture set yet

    NSString *finnQuote1 = @"Everything small is just a smaller version of something big!";
    NSString *finnQuote2 = @"Man, you're letting your brain dial turn your fear volume up.";
    NSString *finnQuote3 = @"Imagination is for turbo-nerds who can't handle how kick-butt reality is!.";
    
    [self createQuotesForPerson:person withQuote1:finnQuote1 withQuote2:finnQuote2 withQuote3:finnQuote3];
}


- (void)setJimCampagno:(Person *)person {
    
    person.name = @"Jim Campagno";
    person.fieldOfStudy = @"iOS Dev.";
    person.summary = @"He's cool, real cool";
    //No thumbnailimage set yet
    //no profilepicture set yet
    
    NSString *quoteByJim1 = (@"Today is a wonderful day!");
    NSString *quoteByJim2 = (@"I like cheeseburgers");
    NSString *quoteByJim3 = (@"Everythings gonna be alright");
    
    [self createQuotesForPerson:person withQuote1:quoteByJim1 withQuote2:quoteByJim2 withQuote3:quoteByJim3];
}





@end
