//
//  ZDButton.m
//  Solution
//
//  Created by Zachary Davison on 17/02/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import "ZDButton.h"

#define RGB(r, g, b)                                                           \
[UIColor colorWithRed : r / 255.0 green : g / 255.0 blue : b / 255.0 alpha : 1]
#define RGBA(r, g, b, a)                                                       \
[UIColor colorWithRed : r / 255.0 green : g / 255.0 blue : b / 255.0 alpha : a]

@implementation ZDButton

- (void)awakeFromNib{
  
  // --- Glow
  
  // Turn off our masking so we can draw outside the bounds
  self.layer.masksToBounds = false;
  
  // Round our corners to half the size of the button in order to appear like a circle
  self.layer.cornerRadius = MAX(self.bounds.size.width/2,self.bounds.size.height/2);
  
  // Draw a border the same color as our background to give the illusion of a gap
  self.layer.borderWidth = 2;
  self.layer.borderColor = RGB(251,244,219).CGColor;
  
  // Setup our glowing layer
  CALayer *glowLayer        = [CALayer layer];
  glowLayer.frame           = CGRectInset(self.layer.frame, -10, -10);
  glowLayer.cornerRadius    = MAX(glowLayer.bounds.size.width/2,glowLayer.bounds.size.height/2);
  glowLayer.backgroundColor = [UIColor greenColor].CGColor;
  
  // Add our glowing layer as a sublayer of our superview (eg: underneath us)
  // this is not ideal, if we moved this view, we'd have to remember to move the layer as well
  // we could support this by overriding setFrame:, etc.
  [self.superview.layer insertSublayer:glowLayer below:self.layer];
  
  // Create our fade animation
  CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
  fadeAnimation.fromValue      = @0.4;
  fadeAnimation.toValue        = @0;
  fadeAnimation.repeatCount    = INFINITY;
  fadeAnimation.autoreverses   = true;
  fadeAnimation.duration       = 0.8;
  fadeAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  
  // Create our transform animation
  CABasicAnimation *transformAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
  transformAnimation.fromValue = @1;
  transformAnimation.toValue   = @0.85;
  transformAnimation.repeatCount = INFINITY;
  transformAnimation.autoreverses = true;
  transformAnimation.duration  = 0.8;
  transformAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  
  // Add our animations to the layer
  [glowLayer addAnimation:fadeAnimation forKey:@"fade"];
  [glowLayer addAnimation:transformAnimation forKey:@"transform"];
  
  
  // --- Bounce
  
  // Set up ourselves to receive touch events so we can perform animations
  [self addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
  [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpInside];
  [self addTarget:self action:@selector(touchUp:) forControlEvents:UIControlEventTouchUpOutside];
  
}

- (void)touchDown:(UIButton*)sender{
  
  CABasicAnimation *bounceDownAnimation   = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
  bounceDownAnimation.toValue             = @0.8;
  bounceDownAnimation.fillMode            = kCAFillModeForwards;
  bounceDownAnimation.removedOnCompletion = false;
  bounceDownAnimation.duration            = 0.1;
  bounceDownAnimation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  
  [self.layer addAnimation:bounceDownAnimation forKey:@"bounceDown"];
  
}

- (void)touchUp:(UIButton*)sender{
  
  CABasicAnimation *bounceUpAnimation     = [CABasicAnimation animationWithKeyPath:@"transform"];
  bounceUpAnimation.toValue               = [NSValue valueWithCATransform3D:CATransform3DIdentity];
  bounceUpAnimation.fillMode              = kCAFillModeForwards;
  bounceUpAnimation.removedOnCompletion   = false;
  bounceUpAnimation.duration              = 0.1;
  bounceUpAnimation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

  
  [self.layer addAnimation:bounceUpAnimation forKey:@"bounceUp"];
  
}

@end
