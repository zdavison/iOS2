//
//  SecondViewController.m
//  Segues
//
//  Created by Zachary Davison on 21/04/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStoryboardSegue*)segueForUnwindingToViewController:(UIViewController *)toViewController
                                     fromViewController:(UIViewController *)fromViewController
                                             identifier:(NSString *)identifier{
  
  return [[UIStoryboardSegue alloc] initWithIdentifier:@"" source:fromViewController destination:toViewController];
  
}

- (IBAction)unwindToViewController:(UIStoryboardSegue*)sender{
  [self removeFromParentViewController];
  [self.view removeFromSuperview];
}

@end
