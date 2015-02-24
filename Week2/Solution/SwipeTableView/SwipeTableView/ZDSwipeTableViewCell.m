//
//  ZDSwipeTableViewCell.m
//  SwipeTableView
//
//  Created by Zachary Davison on 24/02/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import "ZDSwipeTableViewCell.h"

@interface ZDSwipeTableViewCell()

@end

@implementation ZDSwipeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if(!self) { return nil; }
  
  [self _sharedInit];
  
  return self;
}

- (void)awakeFromNib {
  [self _sharedInit];
}

- (void)_sharedInit {
  
  // Setup our panning gesture (handles whenever we move our finger around)
  UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizerDidDrag:)];
  [self addGestureRecognizer:panGestureRecognizer];
  
}

- (IBAction)deleteButtonPressed:(id)sender{
  [_delegate swipeTableViewCell:self didPressDeleteButton:sender];
}

- (void)gestureRecognizerDidDrag:(UIPanGestureRecognizer*)gestureRecognizer {
  
  
  // Get our translation
  CGPoint translation = [gestureRecognizer translationInView:self];
  CGFloat x     = _swipeView.frame.origin.x + translation.x;
  
  // Clamp our x value to not be able to move further than 0 (eg, not move right)
  x = MIN(x, 0);
  
  // update the x value of our frame
  CGRect newFrame   = _swipeView.frame;
  newFrame.origin.x = x;
  
  // apply our frame
  _swipeView.frame = newFrame;
  
  // reset the translation of the gestureRecognizer so we don't accumulate over time
  [gestureRecognizer setTranslation:CGPointZero inView:self];
  
  // if we've ended...
  if(gestureRecognizer.state == UIGestureRecognizerStateEnded){
    
    // we want to decide if we should close or leave the basement open
    CGFloat targetX = 0;
    if(CGRectGetMaxX(_swipeView.frame) < _accessoryButton.frame.origin.x ){
      targetX = 0 - _accessoryButton.bounds.size.width;
    }
    
    // animate whatever we decided on
    [UIView animateWithDuration:0.3 animations:^{
      CGRect newFrame = _swipeView.frame;
      newFrame.origin.x = targetX;
      _swipeView.frame = newFrame;
    }];
  }
  
}

@end
