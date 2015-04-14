//
//  ViewControllerTestingImages.m
//  QuoteMachine
//
//  Created by Jim Campagno on 4/13/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import "ViewControllerTestingImages.h"
#import "Person.h"

@interface ViewControllerTestingImages ()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewControllerTestingImages

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataStore = [QuoteDataStore sharedDataStore];
    
    [self.dataStore fetchData];
    
    NSFetchRequest *personQuoteRequest =
    [[NSFetchRequest alloc] initWithEntityName:@"Person"];
    self.dataStore.quotesReadyForGame = [self.dataStore.managedObjectContext
                                         executeFetchRequest:personQuoteRequest
                                         error:nil];
    
    
    for (Person *person in self.dataStore.quotesReadyForGame) {
        
        if ([person.name isEqualToString:@"Neil deGrasse Tyson"]) {
            
            NSLog(@"Found you");
            
            NSLog(@"%@", person.fieldOfStudy);
            self.image.image = person.profilePicture;
            
            
            break;
        }
    
    }
    
    
    
//    self.image.image = [UIImage imageNamed:@"Amy Poehler"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
