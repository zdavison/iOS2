//
//  FileViewModel.m
//  Datasources
//
//  Created by Zachary Davison on 10/03/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import "FileViewModel.h"

@interface FileViewModel()

@property (nonatomic, strong) NSMutableArray *objects;

@end

@implementation FileViewModel

- (id)init{
  self = [super init];
  if (!self) { return nil; }
  
  NSString *dataFilePath = [self dataFilePath];
  _objects = [NSMutableArray arrayWithContentsOfFile:dataFilePath] ?: [NSMutableArray array];
  
  return self;
}

- (NSString*)dataFilePath{
  NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).lastObject;
  NSString *dataFilePath = [documentsPath stringByAppendingPathComponent:@"data.plist"];
  return dataFilePath;
}

- (void)save{
  NSString *dataFilePath = [self dataFilePath];
  [_objects writeToFile:dataFilePath atomically:YES];
}

- (void)addObject:(NSString*)object{
  [_objects addObject:object];
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
