//
//  AppDelegate.m
//  Notifications
//
//  Created by Zachary Davison on 21/04/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
 
  return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
  [[[UIAlertView alloc] initWithTitle:notification.alertTitle
                              message:notification.alertBody
                             delegate:nil
                    cancelButtonTitle:nil
                    otherButtonTitles:nil] show];
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
  
}

@end
