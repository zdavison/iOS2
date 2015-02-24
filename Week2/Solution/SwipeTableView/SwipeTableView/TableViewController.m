//
//  ViewController.m
//  SwipeTableView
//
//  Created by Zachary Davison on 24/02/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import "TableViewController.h"
#import "ZDSwipeTableViewCell.h"

@interface TableViewController () <ZDSwipeTableViewCellDelegate>

@property (nonatomic, strong) NSMutableArray *strings;

@end

@implementation TableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Setup our strings to act as data
  _strings = @[@"A",@"B",@"C"].mutableCopy;
  
  // Register our nib file to tell our tableView to use it for re-use
  UINib *swipeTableViewCellNib = [UINib nibWithNibName:@"ZDSwipeTableViewCell" bundle:nil];
  [self.tableView registerNib:swipeTableViewCellNib forCellReuseIdentifier:@"SwipeTableViewCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return _strings.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  ZDSwipeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"SwipeTableViewCell"];
  cell.delegate               = self;
  cell.titleLabel.text        = _strings[indexPath.row];
  return cell;
}

#pragma mark ZDSwipeTableViewCellDelegate

- (void)swipeTableViewCell:(ZDSwipeTableViewCell *)cell didPressDeleteButton:(UIButton *)button{
  
  // get the indexPath of our cell
  NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
  
  // delete the data actually backing the tableview (important! if you dont do this, tableView checks the consistency of its dataSource and if the numbers dont match up, throws an exception)
  [_strings removeObjectAtIndex:indexPath.row];
  
  // animate the deletion of the rows
  [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
  
}

@end
