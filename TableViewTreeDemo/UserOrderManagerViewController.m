//
//  UserOrderManagerViewController.m
//  TableViewTreeDemo
//
//  Created by admin on 16/10/14.
//  Copyright © 2016年 thomas. All rights reserved.
//

#import "UserOrderManagerViewController.h"
#import "UserOrderManageCollectionViewCell.h"
#import "UserOrderManageTableViewCell.h"
#import "UserOrderProductTableViewCell.h"

#import "WSTableviewTree.h"
#import "KTDropdownMenuView.h"

typedef enum : NSUInteger {
    //全部
    UserCouponTypeAll = 0,
    //可使用
    UserCouponTypeAvailable,
    //已使用
    UserCouponTypeUnavailable,
    //已过期
    UserCouponTypeOutOfDate,
} UserOrderType;

@interface UserOrderManagerViewController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
WSTableViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) IBOutlet WSTableView *tableView;

@property (copy, nonatomic) NSArray *titleArrays;

@property (strong, nonatomic) NSIndexPath *selectedIndexPath;

@property (nonatomic, strong)NSMutableArray *dataSourceArrM;

@end

@implementation UserOrderManagerViewController

#pragma mark - Private

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单管理";
    self.navigationController.navigationBar.translucent = NO;
    [self registerCell];
    [self addTitleBarButtonItem];
    [self addData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - private

- (UserOrderType)getOrderTypeWithTitle:(NSString *)title {
    if ([title isEqualToString:@"全部"]) {
        return UserCouponTypeAll;
    } else if ([title isEqualToString:@"可使用"]) {
        return UserCouponTypeAvailable;
    } else if ([title isEqualToString:@"已使用"]) {
        return UserCouponTypeUnavailable;
    } else if ([title isEqualToString:@"已过期"]) {
        return UserCouponTypeOutOfDate;
    }
    return UserCouponTypeAll;
}

- (void)addTitleBarButtonItem {
    UIColor *color = [UIColor colorWithRed:251 / 255.0f green:67 / 255.0f blue:127 / 255.0f alpha:1.0];
    [self.navigationController.navigationBar setBarTintColor:color];
    NSArray *titles = @[@"嘿嘿", @"哈哈", @"呵呵"];
    KTDropdownMenuView *menuView = [[KTDropdownMenuView alloc] initWithFrame:CGRectMake(0, 0,100, 44) titles:titles navigationTitle:@"优惠券"];
    menuView.selectedAtIndex = ^(int index) {
        NSLog(@"selected title:%@", titles[index]);
    };
    menuView.width = 120.0f;
    menuView.cellColor = [UIColor colorWithRed:251 / 255.0f green:67 / 255.0f blue:127 / 255.0f alpha:0.9];
    self.navigationItem.titleView = menuView;
}

- (void)registerCell {
    UINib *nibName = [UINib nibWithNibName:NSStringFromClass([UserOrderManageCollectionViewCell class]) bundle:nil];
    [self.collectionView registerNib:nibName forCellWithReuseIdentifier:NSStringFromClass([UserOrderManageCollectionViewCell class])];
    self.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    UINib *orderManagerNib = [UINib nibWithNibName:NSStringFromClass([UserOrderManageTableViewCell class]) bundle:nil];
    [self.tableView registerNib:orderManagerNib forCellReuseIdentifier:NSStringFromClass([UserOrderManageTableViewCell class])];
    
    UINib *orderProductNib = [UINib nibWithNibName:NSStringFromClass([UserOrderProductTableViewCell class]) bundle:nil];
    [self.tableView registerNib:orderProductNib forCellReuseIdentifier:NSStringFromClass([UserOrderProductTableViewCell class])];

}

- (void)addData {
    
    self.tableView.WSTableViewDelegate = self;
    
    _dataSourceArrM = [NSMutableArray array];
    WSTableviewDataModel *dataModel = [[WSTableviewDataModel alloc] init];
    dataModel.firstLevelStr = @"医院选择";
    dataModel.shouldExpandSubRows = YES;
    [dataModel object_add_toSecondLevelArrM:@"医院大飞哥医院大斯蒂芬按时阿斯蒂芬按时阿斯蒂芬按时阿斯蒂芬按时阿斯斯飞斯蒂芬按时阿斯蒂芬按时阿斯哥医院大飞哥医院大飞哥医院大飞哥医院大飞哥医院大飞哥医院大飞哥医院大飞哥医院大飞哥"];
    [_dataSourceArrM addObject:dataModel];
    
    WSTableviewDataModel *dataModel2 = [[WSTableviewDataModel alloc] init];
    dataModel2.firstLevelStr = @"部位选择";
    dataModel2.shouldExpandSubRows = YES;
    [dataModel2 object_add_toSecondLevelArrM:@"腿大师傅阿斯蒂芬按时阿斯蒂芬斯蒂芬按时阿斯蒂芬按时阿斯按时阿斯斯蒂芬按时阿斯蒂芬按时阿斯蒂芬腿大师傅阿斯蒂芬按时阿斯蒂芬腿大师傅阿斯蒂芬按时阿斯蒂芬"];
    [_dataSourceArrM addObject:dataModel2];
    
    
    WSTableviewDataModel *dataModel3 = [[WSTableviewDataModel alloc] init];
    dataModel3.firstLevelStr = @"部位选择2";
    [dataModel3 object_add_toSecondLevelArrM:@"腿2"];
    dataModel3.expandable = YES;
    [_dataSourceArrM addObject:dataModel3];
    
    WSTableviewDataModel *dataModel4 = [[WSTableviewDataModel alloc] init];
    dataModel4.firstLevelStr = @"部位选择啥打法是否";
    [_dataSourceArrM addObject:dataModel4];
}

#pragma mark - Getters & Setters

- (NSArray *)titleArrays {
    if (!_titleArrays) {
        _titleArrays = @[
                         @"全部",
                         @"可使用",
                         @"已使用",
                         @"已过期"
                         ];
    }
    return _titleArrays;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return self.titleArrays.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UserOrderManageCollectionViewCell *cell =
    [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UserOrderManageCollectionViewCell class])
                                              forIndexPath:indexPath];
    NSString *title = self.titleArrays[indexPath.item];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",title];
    cell.lineView.hidden = ![self.selectedIndexPath isEqual:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(floorf([UIScreen mainScreen].bounds.size.width / self.titleArrays.count) - 1, 45);
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    [collectionView reloadData];
    NSString *title = self.titleArrays[indexPath.item];
    
    UserOrderType type = [self getOrderTypeWithTitle:title];
    NSLog(@"type:::::::%@",@(type));
}


#pragma mark - UITableViewDataSource & UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 20.0f :10.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_dataSourceArrM count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)tableView:(WSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath {
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    return [dataModel.secondLevelArrM count];
}

- (BOOL)tableView:(WSTableView *)tableView shouldExpandSubRowsOfCellAtIndexPath:(NSIndexPath *)indexPath {
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    return dataModel.shouldExpandSubRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    UserOrderManageTableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserOrderManageTableViewCell class])];
    cell.expandable = dataModel.expandable;
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath {
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    UserOrderProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UserOrderProductTableViewCell class])];
    cell.couponLabel.text = [dataModel object_get_fromSecondLevelArrMWithIndex:indexPath.subRow];
    return cell;
}

- (CGFloat)tableView:(WSTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0f;
}

- (CGFloat)tableView:(WSTableView *)tableView heightForSubRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WSTableviewDataModel *dataModel = _dataSourceArrM[indexPath.section];
    dataModel.shouldExpandSubRows = !dataModel.shouldExpandSubRows;
    NSLog(@"Section: %ld, Row:%ld", indexPath.section, indexPath.section);
}

- (void)tableView:(WSTableView *)tableView didSelectSubRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Section: %ld, Row:%ld, Subrow:%ld", indexPath.section, indexPath.section, indexPath.subRow);
}

#pragma mark - handlers

- (void)close {
    [self.tableView collapseCurrentlyExpandedIndexPaths];
}

@end
