//
//  QuoteDataStore.h
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface QuoteDataStore : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResults;
@property (strong, nonatomic) NSMutableDictionary *quotesReadyForGame;

+ (instancetype)sharedDataStore;
- (instancetype)init;
//- (void)generateTestData;
//- (void)fetchData;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
