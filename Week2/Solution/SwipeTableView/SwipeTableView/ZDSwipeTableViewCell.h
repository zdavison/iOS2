//
//  ZDSwipeTableViewCell.h
//  SwipeTableView
//
//  Created by Zachary Davison on 24/02/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZDSwipeTableViewCellDelegate;

@interface ZDSwipeTableViewCell : UITableViewCell

@property (nonatomic, weak) id<ZDSwipeTableViewCellDelegate> delegate;

@property (nonatomic, weak) IBOutlet UIView   *swipeView;
@property (nonatomic, weak) IBOutlet UIButton *accessoryButton;
@property (nonatomic, weak) IBOutlet UILabel  *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel  *bodyLabel;

@end

@protocol ZDSwipeTableViewCellDelegate <NSObject>

- (void)swipeTableViewCell:(ZDSwipeTableViewCell*)cell didPressDeleteButton:(UIButton*)button;

@end