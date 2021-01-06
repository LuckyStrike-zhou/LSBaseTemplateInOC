//
//  QAViewController.m
//  Template
//
//  Created by Liujia on 2020/12/31.
//  Copyright © 2020 7m. All rights reserved.
//

#import "QAViewController.h"
#import "QATableViewCell.h"
#import "QAModel.h"

static NSString *qATableViewCell = @"QATableViewCell";

@interface QAViewController ()

@end

@implementation QAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tbView registerClass:[QATableViewCell class] forCellReuseIdentifier:qATableViewCell];
    [self setupRefreshHeader];
    [self.tbView.mj_header beginRefreshing];
}

- (void)setupTestData{}

- (void)refreshTBViewData{
    WS;
    [[ZTNetwork sharedInstance] requestURL:@"QA" WithComplateBlock:^(BOOL isSuc, id  _Nullable response, NSError * _Nullable error) {
        if (!isSuc) {
            return;
        }
        [weakSelf.dataSource removeAllObjects];
        for (NSDictionary *dic in response) {
            QAModel *model = [QAModel mj_objectWithKeyValues:dic];
            [self.dataSource addObject:model];
        }
        [weakSelf.tbView reloadData];
        [weakSelf.tbView.mj_header endRefreshing];
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QATableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:qATableViewCell];
    [cell configWithModel:self.dataSource[indexPath.row]];
    return cell;
}


@end
