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
#warning button not set yet
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
#warning button not set yet

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
#warning button not set yet

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


- (void)setLarryDavid:(Person *)person {
    
    person.name = @"Larry David";
    person.fieldOfStudy = @"Comedy";
    person.summary = @"Lawrence Gene Larry David is an American comedian, writer, actor, and television producer. He was the co-creator, with Jerry Seinfeld, of the television series Seinfeld, and was its head writer and executive producer from 1989 to 1996.";
    //No thumbnailimage set yet
    //no profilepicture set yet

    NSString *quote1 = @"Anyone can be confident with a full head of hair. But a confident bald man - there's your diamond in the rough.";
    NSString *quote2 = @"Trying on pants is one of the most humiliating things a man can suffer that doesn't involve a woman.";
    NSString *quote3 = @"I tend to stay with the panic. I embrace the panic.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];
    
}

- (void)setBillNye:(Person *)person {
    
    person.name = @"Bill Nye";
    person.fieldOfStudy = @"Science";
    person.summary = @"William Sanford Bill Nye (born November 27, 1955), popularly known as Bill Nye the Science Guy, is an American science educator, comedian, television host, actor, writer, scientist, and former mechanical engineer, best known as the host of the Disney/PBS children's science show Bill Nye the Science Guy (1993–98) and for his many subsequent appearances in popular media as a science educator.";
    //No thumbnailimage set yet
    //no profilepicture set yet
    
    NSString *quote1 = @"Everybody who's a physician, who makes vaccines, who wants to find the cure for cancer. Everybody who wants to do any medical good for humankind got the passion for that before he or she was 10.";
    NSString *quote2 = @"Hard to find anything lovelier than a tree. They grow at right angles to a tangent of the nominal sphere of the Earth.";
    NSString *quote3 = @"To leave the world better than you found it, sometimes you have to pick up other people’s trash.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];
    
}

- (void)setCarlSagan:(Person *)person {
    
    person.name = @"Carl Sagan";
    person.fieldOfStudy = @"Science";
    person.summary = @"Carl Edward Sagan was an American astronomer, cosmologist, astrophysicist, astrobiologist, author, science popularizer, and science communicator in astronomy and other natural sciences.";
    
    NSString *quote1 = @"Somewhere, something incredible is waiting to be known.";
    NSString *quote2 = @"The nitrogen in our DNA, the calcium in our teeth, the iron in our blood, the carbon in our apple pies were made in the interiors of collapsing stars. We are made of starstuff.";
    NSString *quote3 = @"If you wish to make an apple pie from scratch, you must first invent the universe.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

    
}

- (void)setisaacNewton:(Person *)person {
    
    person.name = @"Isaac Newton";
    person.fieldOfStudy = @"Science";
    person.summary = @"Sir Isaac Newton PRS MP was an English physicist and mathematician who is widely recognised as one of the most influential scientists of all time and as a key figure in the scientific revolution";
    
    NSString *quote1 = @"If I have seen further it is by standing on the shoulders of Giants.";
    NSString *quote2 = @"I do not know what I may appear to the world, but to myself I seem to have been only like a boy playing on the sea-shore, and diverting myself in now and then finding a smoother pebble or a prettier shell than ordinary, whilst the great ocean of truth lay all undiscovered before me";
    NSString *quote3 = @"Nature is pleased with simplicity. And nature is no dummy";
    
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];
    
}

- (void)setTinaFey:(Person *)person {
    
    person.name = @"Tina Fey";
    person.fieldOfStudy = @"Comedy";
    person.summary = @"Elizabeth Stamatina Tina Fey is an American actress, comedian, writer, and producer. She is best known for her work on the NBC sketch comedy series Saturday Night Live (1998–2006), the critically acclaimed NBC comedy series 30 Rock (2006–2013), and films such as Mean Girls (2004), Baby Mama (2008), Date Night (2010), and Muppets Most Wanted (2014).";
    
    NSString *quote1 = @"You could put a blond wig on a hot-water heater and some dude would try to f*** it";
    NSString *quote2 = @"I feel about Photoshop the way some people feel about abortion. It is appalling and a tragic reflection on the moral decay of our society…unless I need it, in which case, everybody be cool";
    NSString *quote3 = @"My ability to turn good news into anxiety is rivaled only by my ability to turn anxiety into chin acne.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];


}

- (void)setAmyPoehler:(Person *)person {
    
    person.name = @"Amy Poehler";
    person.fieldOfStudy = @"Comedy";
    person.summary = @"Amy Meredith Poehler is an American actress, comedian, voice artist, director, producer and writer. She was raised in Burlington, Massachusetts, graduated from Boston College in 1993 and moved to Chicago, Illinois to study improv at The Second City and ImprovOlympic. In 1996, she moved to New York City after becoming part of the improvisational comedy troupe Upright Citizens Brigade, which later developed into an eponymous television show that aired on Comedy Central for three seasons. Poehler was also one of the founding members of the Upright Citizens Brigade Theatre in 1999. She is a 15-time Emmy Award nominee.";
    
    NSString *quote1 = @"I think we should stop asking people in their twenties what they “want to do” and start asking them what they don’t want to do.";
    NSString *quote2 = @"Telling me to relax or smile when I’m angry is like bringing a birthday cake into an ape sanctuary. You’re just asking to get your nose and genitals bitten off.";
    NSString *quote3 = @"if you can dance and be free and not embarrassed you can rule the world";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

}

- (void)setHomerSimpson:(Person *)person {
    
    person.name = @"Homer Simpson";
    person.fieldOfStudy = @"Cartoon";
    person.summary = @"Homer Jay Simpson is a fictional character in the animated television series The Simpsons as the patriarch of the eponymous family. He is voiced by Dan Castellaneta and first appeared on television, along with the rest of his family, in The Tracey Ullman Show short Good Night on April 19, 1987. Homer was created and designed by cartoonist Matt Groening while he was waiting in the lobby of James L. Brooks' office. Groening had been called to pitch a series of shorts based on his comic strip Life in Hell but instead decided to create a new set of characters. He named the character after his father, Homer Groening. After appearing for three seasons on The Tracey Ullman Show, the Simpson family got their own series on Fox that debuted December 17, 1989.";
    
    NSString *quote1 = @"I didn't lie, I was writing fiction with my mouth";
    NSString *quote2 = @"You can't keep blaming yourself. Just blame yourself once, and move on";
    NSString *quote3 = @"You tried your best and you failed miserably. The lesson is 'never try.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];
    
}

- (void)setEricCartman:(Person *)person {
    
    person.name = @"Eric Cartman";
    person.fieldOfStudy = @"Cartoon";
    person.summary = @"Eric Theodore Cartman is a main character in the animated television series South Park, created by Matt Stone and Trey Parker, and voiced by Trey Parker. Cartman, generally referred to by his surname, is one of four central characters in South Park, in addition to Stan Marsh, Kyle Broflovski, and Kenny McCormick. Cartman first appeared, originally named Kenny, in prototypical form in a 1992 animated short Jesus vs. Frosty, and a 1995 animated short Jesus vs. Santa, and first appeared on television in the pilot episode of South Park, Cartman Gets an Anal Probe, on August 13, 1997.";
    
    NSString *quote1 = @"Hippies.  They're everywhere.  They wanna save the earth, but all they do is smoke pot and smell bad.";
    NSString *quote2 = @"Real guitars are for old people.";
    NSString *quote3 = @"Love is like taking a dump.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

}

- (void)setMichaelJordan:(Person *)person {
    
    person.name = @"Michael Jordan";
    person.fieldOfStudy = @"Sports";
    person.summary = @"Michael Jeffrey Jordan, also known by his initials, MJ, is an American former professional basketball player, entrepreneur, and principal owner and chairman of the Charlotte Hornets.";
    
    NSString *quote1 = @"My attitude is that if you push me towards something that you think is a weakness, then I will turn that perceived weakness into a strength";
    NSString *quote2 = @"I can accept failure, everyone fails at something. But I can't accept not trying.";
    NSString *quote3 = @"Some people want it to happen, some wish it would happen, and others make it happen.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

    
    
}

- (void)setMuhammadAli:(Person *)person {
    
    person.name = @"Muhammad Ali";
    person.fieldOfStudy = @"Sports";
    person.summary = @"Muhammad Ali is an American former professional boxer, generally considered among the greatest heavyweights in the sport's history.";
    
    NSString *quote1 = @"Don't count the days, make the days count.";
    NSString *quote2 = @"To be a great champion you must believe you are the best. If you’re not, pretend you are";
    NSString *quote3 = @"Often it isn't the mountains ahead that wear you out, it's the little pebble in your shoe.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

    
    
}

- (void)setStuartScott:(Person *)person {
    
    person.name = @"Stuart Scott";
    person.fieldOfStudy = @"Sports";
    person.summary = @"Stuart Orlando Scott was an American sportscaster and anchor on ESPN, most notably on the network's SportsCenter.";
    
    NSString *quote1 = @"As cool as the other side of the pillow.";
    NSString *quote2 = @"Don't downgrade your dream just to fit your reality. Upgrade your conviction to match your destiny.";
    NSString *quote3 = @"This whole fight, this journey thing is not a solo venture. This is something that requires support.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

}

- (void)setVinceLombardi:(Person *)person {
    
    person.name = @"Vince Lombardi";
    person.fieldOfStudy = @"Sports";
    person.summary = @"Vincent Thomas Vince Lombardi (June 11, 1913– September 3, 1970),[1] was an American football player, coach, and executive. He is best known as the head coach of the Green Bay Packers during the 1960s, where he led the team to three straight and five total National Football League championships in seven years, including winning the first two Super Bowls following the 1966 and 1967 NFL seasons. Lombardi is considered by many to be one of the best and most successful coaches in NFL history.[2] The National Football League's Super Bowl trophy is named in his honor. He was enshrined in the Pro Football Hall of Fame in 1971.";
    
    NSString *quote1 = @"The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will.";
    NSString *quote2 = @"The real glory is being knocked to your knees and then coming back. That's real glory. Thats the essence of it.";
    NSString *quote3 = @"The man on top of the mountain didn't fall there.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

}


- (void)setJaneGoodall:(Person *)person {
    
    person.name = @"Jane Goodall";
    person.fieldOfStudy = @"Mixed";
    person.summary = @"Dame Jane Morris Goodall, DBE is an English primatologist, ethologist, anthropologist, and UN Messenger of Peace.";
    
    NSString *quote1 = @"What you do makes a difference, and you have to decide what kind of difference you want to make.";
    NSString *quote2 = @"We have the choice to use the gift of our life to make the world a better place--or not to bother";
    NSString *quote3 = @"Change happens by listening and then starting a dialogue with the people who are doing something you don't believe is right. ";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

    
}

- (void)setAnitaBorg:(Person *)person {
    
    person.name = @"Anita Borg";
    person.fieldOfStudy = @"Mixed";
    person.summary = @"Anita Borg was an American computer scientist. She founded the Institute for Women and Technology and the Grace Hopper Celebration of Women in Computing. She was born Anita Borg Naffz in Chicago, Illinois.";
    
//    NSString *quote1 = @"If we want technology to serve society rather than enslave it, we have to build systems accessible to all people - be they male or female.";
    
    
    
    
    
}




















@end
