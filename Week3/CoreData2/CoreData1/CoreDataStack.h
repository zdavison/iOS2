//
//  CoreData.h
//  CoreData1
//
//  Created by Zachary Davison on 02/03/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreData;

@interface CoreDataStack : NSObject

@property (nonatomic, readonly) NSManagedObjectContext        *managedObjectContext;
@property (nonatomic, readonly) NSPersistentStoreCoordinator  *persistentStoreCoordinator;
@property (nonatomic, readonly) NSManagedObjectModel          *managedObjectModel;

+ (instancetype)sharedInstance;

- (void)save;

@end
