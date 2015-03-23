//
//  DefaultsViewModel.m
//  Datasources
//
//  Created by Zachary Davison on 10/03/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import "DefaultsViewModel.h"

@implementation DefaultsViewModel

- (NSArray*)objects{
  NSArray *objects = [[NSUserDefaults standardUserDefaults] objectForKey:@"DefaultsViewModelDataKey"];
  return objects ?: [NSArray array];
}

- (void)save{
  [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)addObject:(NSString*)object{
  NSArray *newArray = [[self objects] arrayByAddingObject:object];
  [[NSUserDefaults standardUserDefaults] setObject:newArray forKey:@"DefaultsViewModelDataKey"];
  [self save];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [self objects].count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  cell.textLabel.text   = [self objects][indexPath.row];
  return cell;
}

@end
