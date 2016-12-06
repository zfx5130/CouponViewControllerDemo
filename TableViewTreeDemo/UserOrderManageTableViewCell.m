//
//  UserOrderManageTableViewCell.m
//  TableViewTreeDemo
//
//  Created by admin on 16/10/14.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "UserOrderManageTableViewCell.h"

#define kIndicatorViewTag -1

@implementation UserOrderManageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.expandable = NO;
    self.expanded = NO;
}

- (void)setSelected:(BOOL)selected
           animated:(BOOL)animated {
    [super setSelected:selected
              animated:animated];
}

- (void)setExpanded:(BOOL)expanded {
    _expanded = expanded;
    [self accessoryViewAnimation];
}

- (void)accessoryViewAnimation {
    [UIView animateWithDuration:0.2 animations:^{
        if (self.isExpanded) {
            self.expandImageView.transform = CGAffineTransformMakeRotation(M_PI);
        } else {
            self.expandImageView.transform = CGAffineTransformMakeRotation(0);
        }
    } completion:^(BOOL finished) {
    }];
}

@end
