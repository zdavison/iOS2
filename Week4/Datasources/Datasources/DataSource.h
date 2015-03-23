//
//  DataSource.h
//  Datasources
//
//  Created by Zachary Davison on 10/03/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DataSource <UITableViewDataSource>

- (void)addObject:(id)object;
- (void)save;

@end