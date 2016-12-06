//
//  UserOrderManageTableViewCell.h
//  TableViewTreeDemo
//
//  Created by admin on 16/10/14.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserOrderManageTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *expandImageView;

@property (strong, nonatomic) IBOutlet UIView *bottomHolderView;

@property (nonatomic, assign, getter = isExpandable) BOOL expandable;
@property (nonatomic, assign, getter = isExpanded) BOOL expanded;

@property (strong, nonatomic) IBOutlet UIView *lineView;

- (void)accessoryViewAnimation;

@end
