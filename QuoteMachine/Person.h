//
//  Person.h
//  QuoteMachine
//
//  Created by Jim Campagno on 3/1/15.
//  Copyright (c) 2015 Jim Campagno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Quotes;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * fieldOfStudy;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) id thumbnailImage;
@property (nonatomic, retain) id profilePicture;
@property (nonatomic, retain) NSSet *quotes;

@end


@interface Person (CoreDataGeneratedAccessors)

- (void)addQuotesObject:(Quotes *)value;
- (void)removeQuotesObject:(Quotes *)value;
- (void)addQuotes:(NSSet *)values;
- (void)removeQuotes:(NSSet *)values;

@end
