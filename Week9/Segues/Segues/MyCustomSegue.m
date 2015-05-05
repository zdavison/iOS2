//
//  MyCustomSegue.m
//  Segues
//
//  Created by Zachary Davison on 21/04/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import "MyCustomSegue.h"

@implementation MyCustomSegue

- (void)perform{
  
  UIViewController *from = self.sourceViewController;
  UIViewController *to   = self.destinationViewController;
  
  [from addChildViewController:to];
  [from.view addSubview:to.view];
}

@end
