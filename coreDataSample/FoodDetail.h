//
//  FoodDetail.h
//  coreDataSample
//
//  Created by Vicky Mathneja on 19/09/13.
//  Copyright (c) 2013 LPU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class StaffRecord;

@interface FoodDetail : NSManagedObject

@property (nonatomic, retain) NSNumber * foodid;
@property (nonatomic, retain) NSString * foonItem;
@property (nonatomic, retain) NSString * payment;
@property (nonatomic, retain) NSString * amt;
@property (nonatomic, retain) StaffRecord *staffID;

@end
