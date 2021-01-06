//
//  ZTBaseViewController.h
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZTBaseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

/**   */
@property (nonatomic,strong) UITableView *tbView;
/**   */
@property (nonatomic,strong) NSMutableArray *dataSource;

- (void)refreshTBViewData;

- (void)setupRefreshHeader;

- (void)setupTestData;

/** <#注释#>  */
@property (nonatomic,assign) CGFloat navY;

@end

NS_ASSUME_NONNULL_END
