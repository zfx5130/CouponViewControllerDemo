//
//  WSTableviewDataModel.h
//  WSTableviewTree
//
//  Created by senwang on 15/4/22.
//  Copyright (c) 2015年 senwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    //价格
    CouponTypePrice = 0,
    //折扣
    CouponTypeDiscount,
    //折扣 已使用
    CouponTypePriceUsed,
    //价格 已使用
    CouponTypeDiscountUsed,
    //价格 已过期
    CouponTypePriceOlded,
    //折扣 已过期
    CouponTypeDiscountOlded,
    
} CouponCardType;


typedef enum : NSUInteger {
    //可使用
    CouponTagTypeNormal = 0,
    //已使用
    CouponTagTypeUsed ,
    //已过期
    CouponTagTypeOlded,
    
} CouponTagType;


@interface WSTableviewDataModel : NSObject

@property (nonatomic,strong)NSMutableArray *secondLevelArrM;

@property (nonatomic, assign)BOOL shouldExpandSubRows;

@property (nonatomic, assign)BOOL expandable;


//测试数据

@property (assign, nonatomic) CouponCardType cardType;
@property (copy, nonatomic) NSString *cardTagTitle;
@property (assign, nonatomic) CouponTagType tagType;

@property (copy, nonatomic) NSString *cardDescContent;
@property (copy, nonatomic) NSString *timeEndStr;
@property (copy, nonatomic) NSString *cardPrice;

@property (copy, nonatomic) NSString *detailContent;

- (void)object_add_toSecondLevelArrM:(id)obj;
- (id)object_get_fromSecondLevelArrMWithIndex:(NSInteger)index;

- (void)setCheckedSecondLevel:(BOOL)checked withSubRow:(NSInteger)subRow;
- (BOOL)isCheckedSubRow:(NSInteger)subRow;


@end
