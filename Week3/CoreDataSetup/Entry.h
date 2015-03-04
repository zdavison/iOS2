//
//  Entry.h
//  CoreDataSetup
//
//  Created by Zachary Davison on 03/03/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * value;

@end
