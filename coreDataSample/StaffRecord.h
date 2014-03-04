//
//  StaffRecord.h
//  coreDataSample
//
//  Created by Vicky Mathneja on 19/09/13.
//  Copyright (c) 2013 LPU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StaffRecord : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * contactNo;
@property (nonatomic, retain) NSNumber * staffID;
@property (nonatomic, retain) NSString * staffName;
@property (nonatomic, retain) NSSet *foodinfo;
@end

@interface StaffRecord (CoreDataGeneratedAccessors)

- (void)addFoodinfoObject:(NSManagedObject *)value;
- (void)removeFoodinfoObject:(NSManagedObject *)value;
- (void)addFoodinfo:(NSSet *)values;
- (void)removeFoodinfo:(NSSet *)values;

@end
