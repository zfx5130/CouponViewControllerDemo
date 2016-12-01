//
//  UserOrderProductTableViewCell.m
//  TableViewTreeDemo
//
//  Created by admin on 16/10/14.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "UserOrderProductTableViewCell.h"

@implementation UserOrderProductTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.holderView.layer.cornerRadius = 2.0f;
    self.holderView.layer.masksToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
