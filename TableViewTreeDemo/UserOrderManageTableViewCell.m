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

- (void)renderCellWithDataModel:(WSTableviewDataModel *)dataModel {
    CouponCardType cardType = dataModel.cardType;
    self.couponTagLabel.text = dataModel.cardTagTitle;
    self.rightPriceLabel.text = dataModel.cardPrice;
    self.couponEndDateLabel.text = dataModel.timeEndStr;
    self.rightTagImageView.image = [self couponTagImageView:dataModel.tagType];
    self.leftCouponDescriptionLabel.text = dataModel.cardDescContent;
    self.couponCardBackImageView.image = [self cardBackImageWithCardType:cardType];
    self.expandImageView.hidden = dataModel.detailContent.length == 0 ? YES : NO;
    self.couponTagLabel.textColor = [self getTagTextColorWithCardType:cardType];
}


- (UIColor *)getTagTextColorWithCardType:(CouponCardType)cardType {
    
    UIColor *color = [UIColor purpleColor];
    
    switch (cardType) {
        case CouponTypePrice:
            color = [UIColor purpleColor];
            break;
        case CouponTypeDiscount:
            color = [UIColor colorWithRed:21 / 255.0f green:126 / 255.0f blue:224 / 255.0f alpha:1.0f];
            break;
        case CouponTypePriceUsed:
            color = [UIColor colorWithRed:65 / 255.0f green:65 / 255.0f blue:65 / 255.0f alpha:1.0f];
            break;
        case CouponTypePriceOlded:
            color = [UIColor colorWithRed:65 / 255.0f green:65 / 255.0f blue:65 / 255.0f alpha:1.0f];
            break;
        case CouponTypeDiscountUsed:
            color = [UIColor colorWithRed:65 / 255.0f green:65 / 255.0f blue:65 / 255.0f alpha:1.0f];
            break;
        case CouponTypeDiscountOlded:
            color = [UIColor colorWithRed:65 / 255.0f green:65 / 255.0f blue:65 / 255.0f alpha:1.0f];
            break;
        default:
            break;
    }
    return color;
}


- (UIImage *)cardBackImageWithCardType:(CouponCardType)cardType {
    UIImage *image = [UIImage imageNamed:@"coupon_purple_back_image"];
    
    switch (cardType) {
        case CouponTypePrice:
            image = [UIImage imageNamed:@"coupon_purple_back_image"];
            break;
        case CouponTypeDiscount:
            image = [UIImage imageNamed:@"coupon_blue_back_image"];
            break;
        case CouponTypePriceUsed:
            image = [UIImage imageNamed:@"coupon_gray_back_image"];
            break;
        case CouponTypePriceOlded:
            image = [UIImage imageNamed:@"coupon_gray_back_image"];
            break;
        case CouponTypeDiscountUsed:
            image = [UIImage imageNamed:@"coupon_gray_back_image"];
            break;
        case CouponTypeDiscountOlded:
            image = [UIImage imageNamed:@"coupon_gray_back_image"];
            break;
        default:
            break;
    }
    return image;
}


- (UIImage *)couponTagImageView:(CouponTagType)tagType {
    UIImage *image = [UIImage imageNamed:@""];
    switch (tagType) {
        case CouponTagTypeNormal:
            image = [UIImage imageNamed:@""];
            break;
        case CouponTagTypeUsed:
            image = [UIImage imageNamed:@"coupon_right_tag_used_image"];
            break;
        case CouponTagTypeOlded:
            image = [UIImage imageNamed:@"coupon_right_tag_olded_image"];
            break;
        default:
            break;
    }
    return image;
}

@end
