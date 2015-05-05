//
//  ViewController.m
//  Notifications
//
//  Created by Zachary Davison on 21/04/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  
  UILocalNotification *completelyDifferentNotification = [[UILocalNotification alloc] init];
  completelyDifferentNotification.alertTitle  = @"Message received";
  completelyDifferentNotification.alertBody   = @"This is my message";
  completelyDifferentNotification.alertAction = @"Got it";
  completelyDifferentNotification.fireDate    = [NSDate dateWithTimeIntervalSinceNow:86400];
  
  [[UIApplication sharedApplication] scheduleLocalNotification:completelyDifferentNotification];
  
}

@end
