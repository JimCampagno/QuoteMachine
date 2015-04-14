//
//  initialCreationOfGame.m
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "CreatePeople.h"
#import "Person.h"
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

+ (void)createQuotes:(Person *)person
          withQuote1:(NSString *)quote1
              Quote2:(NSString *)quote2
              Quote3:(NSString *)quote3
           MOContext:(NSManagedObjectContext *)context {
    
    Quotes *quoteOfPerson1 =
    [NSEntityDescription insertNewObjectForEntityForName:@"Quotes"
                                  inManagedObjectContext:context];
    Quotes *quoteOfPerson2 =
    [NSEntityDescription insertNewObjectForEntityForName:@"Quotes"
                                  inManagedObjectContext:context];
    Quotes *quoteOfPerson3 =
    [NSEntityDescription insertNewObjectForEntityForName:@"Quotes"
                                  inManagedObjectContext:context];
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

- (void)createQuotesForPerson:(Person *)person
                   withQuote1:(NSString *)quote1
                   withQuote2:(NSString *)quote2
                   withQuote3:(NSString *)quote3 {
    
    Quotes *quoteOfPerson1 = [NSEntityDescription
                              insertNewObjectForEntityForName:@"Quotes"
                              inManagedObjectContext:self.dataStoreForCreate
                              .managedObjectContext];
    Quotes *quoteOfPerson2 = [NSEntityDescription
                              insertNewObjectForEntityForName:@"Quotes"
                              inManagedObjectContext:self.dataStoreForCreate
                              .managedObjectContext];
    Quotes *quoteOfPerson3 = [NSEntityDescription
                              insertNewObjectForEntityForName:@"Quotes"
                              inManagedObjectContext:self.dataStoreForCreate
                              .managedObjectContext];
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

+ (void)createPerson:(Person *)person
            WithName:(NSString *)name
        FieldOfStudy:(NSString *)fos
             Summary:(NSString *)summary
      ThumbnailImage:(UIImage *)image
        ProfileImage:(UIImage *)profImage {
    
    person.name = name;
    person.fieldOfStudy = fos;
    person.summary = summary;
    person.thumbnailImage = image;
    person.profilePicture = profImage;
    
}

+ (void)createAllOfTheVariousPeopleWithContext:(NSManagedObjectContext *)context {
    
    [CreatePeople setNeilDegrasseTysonWithMOC:context];
    [CreatePeople setSuperMarioWithMOC:context];
    [CreatePeople setMitchHedbergWithMOC:context];
    [CreatePeople setFinnTheHumanWithMOC:context];
    [CreatePeople setLarryDavidWithMOC:context];
    [CreatePeople setBillNyeWithMOC:context];
    [CreatePeople setCarlSaganWithMOC:context];
    [CreatePeople setisaacNewtonWithMOC:context];
    [CreatePeople setTinaFeyWithMOC:context];
    [CreatePeople setAmyPoehlerWithMOC:context];
    [CreatePeople setHomerSimpsonWithMOC:context];
    [CreatePeople setEricCartmanWithMOC:context];
}


+ (void)setNeilDegrasseTysonWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *neil = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:neil
                  WithName:@"Neil deGrasse Tyson"
              FieldOfStudy:@"Science"
                   Summary:@"Neil deGrasse Tyson is an American astrophysicist, cosmologist, author, and science communicator. Since 1996, he has been the Frederick P. Rose Director of the Hayden Planetarium at the Rose Center for Earth and Space in New York City."
            ThumbnailImage:[UIImage imageNamed:@"Neil deGrasse Tyson"]
              ProfileImage:[UIImage imageNamed:@"neilDegrasseTysonProfilePicture"]];
    
    [CreatePeople createQuotes:neil
                    withQuote1:@"We are part of this universe; we are in this universe, but perhaps more important than both of those facts, is that the universe is in us"
                        Quote2:@"The only way you can invent tomorrow is if you break out of the enclosure that the school system has provided for you by the exams written by people who are trained in another generation."
                        Quote3:@"I said that if an alien came to visit, I'd be embarrassed to tell them that we fight wars to pull fossil fuels out of the ground to run our transportation. They'd be like, 'What?'"
                     MOContext:moContext];
}

+ (void)setSuperMarioWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *mario = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:mario
                      WithName:@"Mario"
                  FieldOfStudy:@"Gaming"
                       Summary:@"Mario is a fictional character in the Mario video game franchise, created by Nintendo's Japanese video game designer, Shigeru Miyamoto."
                ThumbnailImage:[UIImage imageNamed:@"Mario"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:mario
                    withQuote1:@"It's a-me, Mario!"
                        Quote2:@"Here I go!"
                        Quote3:@"Mama Mia!"
                     MOContext:moContext];
}

+ (void)setMitchHedbergWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *mitch = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:mitch
                      WithName:@"Mitch Hedberg"
                  FieldOfStudy:@"Comedy"
                       Summary:@"Mitchell Lee Hedberg was an American stand-up comedian known for his surreal humor and unconventional comedic delivery. His comedy typically featured short, sometimes one-line jokes mixed with absurd elements and non sequiturs."
                ThumbnailImage:[UIImage imageNamed:@"Mitch Hedberg"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:mitch
                    withQuote1:@"An escalator can never break: it can only become stairs. You should never see an Escalator Temporarily Out Of Order sign, just Escalator Temporarily Stairs. Sorry for the convenience."
                        Quote2:@"Rice is great if you're really hungry and want to eat two thousand of something."
                        Quote3:@"I don't have a girlfriend. But I do know a woman who'd be mad at me for saying that."
                     MOContext:moContext];
}

+ (void)setFinnTheHumanWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *finn = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:finn
                      WithName:@"Finn The Human"
                  FieldOfStudy:@"Cartoon"
                       Summary:@"Finn is a 15-year-old human. He is roughly five feet tall and is missing several teeth due to his habit of biting trees and rocks among other things.  Finn is, along with Jake the Dog, the main character of the American animated television series Adventure Time created by Pendleton Ward."
                ThumbnailImage:[UIImage imageNamed:@"Finn The Human"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:finn
                    withQuote1:@"Everything small is just a smaller version of something big!"
                        Quote2:@"Man, you're letting your brain dial turn your fear volume up."
                        Quote3:@"Imagination is for turbo-nerds who can't handle how kick-butt reality is!."
                     MOContext:moContext];
}


+ (void)setLarryDavidWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *larry = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:larry
                      WithName:@"Larry David"
                  FieldOfStudy:@"Comedy"
                       Summary:@"Lawrence Gene Larry David is an American comedian, writer, actor, and television producer. He was the co-creator, with Jerry Seinfeld, of the television series Seinfeld, and was its head writer and executive producer from 1989 to 1996."
                ThumbnailImage:[UIImage imageNamed:@"Larry David"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:larry
                    withQuote1:@"Anyone can be confident with a full head of hair. But a confident bald man - there's your diamond in the rough."
                        Quote2:@"Trying on pants is one of the most humiliating things a man can suffer that doesn't involve a woman."
                        Quote3:@"I tend to stay with the panic. I embrace the panic."
                     MOContext:moContext];
}

+ (void)setBillNyeWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *billNye = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:billNye
                      WithName:@"Bill Nye"
                  FieldOfStudy:@"Science"
                       Summary:@"William Sanford Bill Nye (born November 27, 1955), popularly known as Bill Nye the Science Guy, is an American science educator, comedian, television host, actor, writer, scientist, and former mechanical engineer, best known as the host of the Disney/PBS children's science show Bill Nye the Science Guy (1993–98) and for his many subsequent appearances in popular media as a science educator."
                ThumbnailImage:[UIImage imageNamed:@"Bill Nye"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:billNye
                    withQuote1:@"Everybody who's a physician, who makes vaccines, who wants to find the cure for cancer. Everybody who wants to do any medical good for humankind got the passion for that before he or she was 10."
                        Quote2:@"Hard to find anything lovelier than a tree. They grow at right angles to a tangent of the nominal sphere of the Earth."
                        Quote3:@"To leave the world better than you found it, sometimes you have to pick up other people’s trash."
                     MOContext:moContext];
    
}

+ (void)setCarlSaganWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *carl = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:carl
                      WithName:@"Carl Sagan"
                  FieldOfStudy:@"Science"
                       Summary:@"Carl Edward Sagan was an American astronomer, cosmologist, astrophysicist, astrobiologist, author, science popularizer, and science communicator in astronomy and other natural sciences."
                ThumbnailImage:[UIImage imageNamed:@"Carl Sagan"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:carl
                    withQuote1:@"Somewhere, something incredible is waiting to be known."
                        Quote2:@"The nitrogen in our DNA, the calcium in our teeth, the iron in our blood, the carbon in our apple pies were made in the interiors of collapsing stars. We are made of starstuff."
                        Quote3:@"If you wish to make an apple pie from scratch, you must first invent the universe."
                     MOContext:moContext];
}

+ (void)setisaacNewtonWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *issac = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:issac
                      WithName:@"Isaac Newton"
                  FieldOfStudy:@"Science"
                       Summary:@"Sir Isaac Newton PRS MP was an English physicist and mathematician who is widely recognised as one of the most influential scientists of all time and as a key figure in the scientific revolution"
                ThumbnailImage:[UIImage imageNamed:@"Isaac Newton"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:issac
                    withQuote1:@"If I have seen further it is by standing on the shoulders of Giants."
                        Quote2:@"I do not know what I may appear to the world, but to myself I seem to have been only like a boy playing on the sea-shore, and diverting myself in now and then finding a smoother pebble or a prettier shell than ordinary, whilst the great ocean of truth lay all undiscovered before me"
                        Quote3:@"Nature is pleased with simplicity. And nature is no dummy"
                     MOContext:moContext];

}

+ (void)setTinaFeyWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *tina = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:tina
                      WithName:@"Tina Fey"
                  FieldOfStudy:@"Comedy"
                       Summary:@"Elizabeth Stamatina Tina Fey is an American actress, comedian, writer, and producer. She is best known for her work on the NBC sketch comedy series Saturday Night Live (1998–2006), the critically acclaimed NBC comedy series 30 Rock (2006–2013), and films such as Mean Girls (2004), Baby Mama (2008), Date Night (2010), and Muppets Most Wanted (2014)."
                ThumbnailImage:[UIImage imageNamed:@"Tina Fey"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:tina
                    withQuote1:@"You could put a blond wig on a hot-water heater and some dude would try to f*** it"
                        Quote2:@"I feel about Photoshop the way some people feel about abortion. It is appalling and a tragic reflection on the moral decay of our society…unless I need it, in which case, everybody be cool"
                        Quote3:@"My ability to turn good news into anxiety is rivaled only by my ability to turn anxiety into chin acne."
                     MOContext:moContext];

}

+ (void)setAmyPoehlerWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *amy = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:amy
                      WithName:@"Amy Poehler"
                  FieldOfStudy:@"Comedy"
                       Summary:@"Amy Meredith Poehler is an American actress, comedian, voice artist, director, producer and writer. She was raised in Burlington, Massachusetts, graduated from Boston College in 1993 and moved to Chicago, Illinois to study improv at The Second City and ImprovOlympic. In 1996, she moved to New York City after becoming part of the improvisational comedy troupe Upright Citizens Brigade, which later developed into an eponymous television show that aired on Comedy Central for three seasons. Poehler was also one of the founding members of the Upright Citizens Brigade Theatre in 1999. She is a 15-time Emmy Award nominee."
                ThumbnailImage:[UIImage imageNamed:@"Amy Poehler"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:amy
                    withQuote1:@"I think we should stop asking people in their twenties what they “want to do” and start asking them what they don’t want to do."
                        Quote2:@"Telling me to relax or smile when I’m angry is like bringing a birthday cake into an ape sanctuary. You’re just asking to get your nose and genitals bitten off."
                        Quote3:@"if you can dance and be free and not embarrassed you can rule the world"
                     MOContext:moContext];
    
}

+ (void)setHomerSimpsonWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *homer = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:homer
                      WithName:@"Homer Simpson"
                  FieldOfStudy:@"Cartoon"
                       Summary:@"Homer Jay Simpson is a fictional character in the animated television series The Simpsons as the patriarch of the eponymous family. He is voiced by Dan Castellaneta and first appeared on television, along with the rest of his family, in The Tracey Ullman Show short Good Night on April 19, 1987. Homer was created and designed by cartoonist Matt Groening while he was waiting in the lobby of James L. Brooks' office. Groening had been called to pitch a series of shorts based on his comic strip Life in Hell but instead decided to create a new set of characters. He named the character after his father, Homer Groening. After appearing for three seasons on The Tracey Ullman Show, the Simpson family got their own series on Fox that debuted December 17, 1989."
                ThumbnailImage:[UIImage imageNamed:@"Homer Simpson"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:homer
                    withQuote1:@"I didn't lie, I was writing fiction with my mouth"
                        Quote2:@"You can't keep blaming yourself. Just blame yourself once, and move on"
                        Quote3:@"You tried your best and you failed miserably. The lesson is 'never try."
                     MOContext:moContext];
    

}

+ (void)setEricCartmanWithMOC:(NSManagedObjectContext *)moContext {
    
    Person *eric = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:moContext];
    
    [CreatePeople createPerson:eric
                      WithName:@"Eric Cartman"
                  FieldOfStudy:@"Cartoon"
                       Summary:@"Eric Theodore Cartman is a main character in the animated television series South Park, created by Matt Stone and Trey Parker, and voiced by Trey Parker. Cartman, generally referred to by his surname, is one of four central characters in South Park, in addition to Stan Marsh, Kyle Broflovski, and Kenny McCormick. Cartman first appeared, originally named Kenny, in prototypical form in a 1992 animated short Jesus vs. Frosty, and a 1995 animated short Jesus vs. Santa, and first appeared on television in the pilot episode of South Park, Cartman Gets an Anal Probe, on August 13, 1997."
                ThumbnailImage:[UIImage imageNamed:@"Eric Cartman"]
                  ProfileImage:nil];
    
    [CreatePeople createQuotes:eric
                    withQuote1:@"Hippies.  They're everywhere.  They wanna save the earth, but all they do is smoke pot and smell bad."
                        Quote2:@"Real guitars are for old people."
                        Quote3:@"Love is like taking a dump."
                     MOContext:moContext];
    
}

- (void)setMichaelJordan:(Person *)person {
    
    person.name = @"Michael Jordan";
    person.fieldOfStudy = @"Sports";
    person.summary = @"Michael Jeffrey Jordan, also known by his initials, MJ, is an American former professional basketball player, entrepreneur, and principal owner and chairman of the Charlotte Hornets.";
//    person.thumbnailImage = [UIImage imageNamed:@"michaelJordan"];

    
    NSString *quote1 = @"My attitude is that if you push me towards something that you think is a weakness, then I will turn that perceived weakness into a strength";
    NSString *quote2 = @"I can accept failure, everyone fails at something. But I can't accept not trying.";
    NSString *quote3 = @"Some people want it to happen, some wish it would happen, and others make it happen.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

    
    
}

- (void)setMuhammadAli:(Person *)person {
    
    person.name = @"Muhammad Ali";
    person.fieldOfStudy = @"Sports";
    person.summary = @"Muhammad Ali is an American former professional boxer, generally considered among the greatest heavyweights in the sport's history.";
//    person.thumbnailImage = [UIImage imageNamed:@"muhammadAli"];

    
    NSString *quote1 = @"Don't count the days, make the days count.";
    NSString *quote2 = @"To be a great champion you must believe you are the best. If you’re not, pretend you are";
    NSString *quote3 = @"Often it isn't the mountains ahead that wear you out, it's the little pebble in your shoe.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

    
    
}

- (void)setStuartScott:(Person *)person {
    
    person.name = @"Stuart Scott";
    person.fieldOfStudy = @"Sports";
    person.summary = @"Stuart Orlando Scott was an American sportscaster and anchor on ESPN, most notably on the network's SportsCenter.";
//    person.thumbnailImage = [UIImage imageNamed:@"stuartScott"];

    
    NSString *quote1 = @"As cool as the other side of the pillow.";
    NSString *quote2 = @"Don't downgrade your dream just to fit your reality. Upgrade your conviction to match your destiny.";
    NSString *quote3 = @"This whole fight, this journey thing is not a solo venture. This is something that requires support.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

}

- (void)setVinceLombardi:(Person *)person {
    
    person.name = @"Vince Lombardi";
    person.fieldOfStudy = @"Sports";
    person.summary = @"Vincent Thomas Vince Lombardi (June 11, 1913– September 3, 1970),[1] was an American football player, coach, and executive. He is best known as the head coach of the Green Bay Packers during the 1960s, where he led the team to three straight and five total National Football League championships in seven years, including winning the first two Super Bowls following the 1966 and 1967 NFL seasons. Lombardi is considered by many to be one of the best and most successful coaches in NFL history.[2] The National Football League's Super Bowl trophy is named in his honor. He was enshrined in the Pro Football Hall of Fame in 1971.";
//    person.thumbnailImage = [UIImage imageNamed:@"vinceLombardi"];

    
    NSString *quote1 = @"The difference between a successful person and others is not a lack of strength, not a lack of knowledge, but rather a lack in will.";
    NSString *quote2 = @"The real glory is being knocked to your knees and then coming back. That's real glory. Thats the essence of it.";
    NSString *quote3 = @"The man on top of the mountain didn't fall there.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

}


- (void)setJaneGoodall:(Person *)person {
    
    person.name = @"Jane Goodall";
    person.fieldOfStudy = @"Science";
    person.summary = @"Dame Jane Morris Goodall, DBE is an English primatologist, ethologist, anthropologist, and UN Messenger of Peace.";
//    person.thumbnailImage = [UIImage imageNamed:@"janeGoodall"];

    
    NSString *quote1 = @"What you do makes a difference, and you have to decide what kind of difference you want to make.";
    NSString *quote2 = @"We have the choice to use the gift of our life to make the world a better place--or not to bother";
    NSString *quote3 = @"Change happens by listening and then starting a dialogue with the people who are doing something you don't believe is right. ";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];

    
}

- (void)setAnitaBorg:(Person *)person {
    
    person.name = @"Anita Borg";
    person.fieldOfStudy = @"Science";
    person.summary = @"Anita Borg was an American computer scientist. She founded the Institute for Women and Technology and the Grace Hopper Celebration of Women in Computing. She was born Anita Borg Naffz in Chicago, Illinois.";
//    person.thumbnailImage = [UIImage imageNamed:@"anitaBorg"];

    
    NSString *quote1 = @"If we want technology to serve society rather than enslave it, we have to build systems accessible to all people - be they male or female.";
    NSString *quote2 = @"Keep an active fantasy life about what you can do and what your possibilities are. Have principles and work towards them, but be patient with yourself when you can't change the whole world. You can't do it all by yourself";
    NSString *quote3 = @"Don't underestimate yourself, but learn to know yourself. Learn to understand your strengths and believe in yourself. Be rationally optimistic. Optimism is a wonderful thing, it gets you where you're going";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];
}

- (void)setBarbaraMcClintock:(Person *)person {
    
    person.name = @"Barbara McClintock";
    person.fieldOfStudy = @"Science";
    person.summary = @"Barbara McClintock, was an American scientist and one of the world's most distinguished cytogeneticists, who won the 1983 Nobel laureate in Physiology or Medicine. McClintock received her PhD in botany from Cornell University in 1927.";
//    person.thumbnailImage = [UIImage imageNamed:@"barbaraMcClintock"];

    
    NSString *quote1 = @"If you know you are on the right track, if you have this inner knowledge, then nobody can turn you off... no matter what they say.";
    NSString *quote2 = @"Every time I walk on grass, I feel sorry because I know the grass is screaming at me.";
    NSString *quote3 = @"I was just so interested in what I was doing I could hardly wait to get up in the morning and get at it. One of my friends, a geneticist, said I was a child, because only children can't wait to get up in the morning to get at what they want to do.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];


    
}

- (void)setMarieCurie:(Person *)person {
    
    person.name = @"Marie Curie";
    person.fieldOfStudy = @"Science";
    person.summary = @"Marie Skłodowska-Curie was a Polish and naturalized-French physicist and chemist who conducted pioneering research on radioactivity. She was the first woman to win a Nobel Prize, the first person and only woman to win twice, the only person to win twice in multiple sciences, and was part of the Curie family legacy of five Nobel Prizes. She was also the first woman to become a professor at the University of Paris, and in 1995 became the first woman to be entombed on her own merits in the Panthéon in Paris.";
//    person.thumbnailImage = [UIImage imageNamed:@"marieCurie"];

    
    NSString *quote1 = @"After all, science is essentially international, and it is only through lack of the historical sense that national qualities have been attributed to it.";
    NSString *quote2 = @"Be less curious about people and more curious about ideas.";
    NSString *quote3 = @"Life is not easy for any of us, but what of that? We must have perseverance and above all confidence in ourselves. We must believe that we are gifted in something, and that this thing, at whatever cost, must be attained.";
    
    [self createQuotesForPerson:person withQuote1:quote1 withQuote2:quote2 withQuote3:quote3];
    
}
























@end
