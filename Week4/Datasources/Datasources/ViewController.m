//
//  ViewController.m
//  Datasources
//
//  Created by Zachary Davison on 10/03/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import "ViewController.h"
#import "DefaultsViewModel.h"
#import "FileViewModel.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) id<DataSource> viewModel;

@end

@implementation ViewController

- (void)viewDidLoad{
  
  _viewModel = [[DefaultsViewModel alloc] init];
  _tableView.dataSource = _viewModel;
  
}

- (IBAction)saveButtonPressed:(id)sender{
  
  NSString *newObject = _textField.text;
  [_viewModel addObject:newObject];
  [_viewModel save];
  [_tableView reloadData];
}

@end
