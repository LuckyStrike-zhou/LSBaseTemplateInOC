//
//  MarketViewController.m
//  Template
//
//  Created by Liujia on 2020/12/31.
//  Copyright © 2020 7m. All rights reserved.
//

#import "MarketViewController.h"
#import "MarketCell.h"
#import "StockDetailViewController.h"
#import "MarketModel.h"

static NSString * marketCell = @"MarketCell";

@interface MarketViewController ()

@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tbView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tbView registerClass:[MarketCell class] forCellReuseIdentifier:marketCell];
    [self setupRefreshHeader];
    [self.tbView.mj_header beginRefreshing];
}

- (void)setupTestData{}

- (void)refreshTBViewData{
    WS;
    [[ZTNetwork sharedInstance] requestURL:HOTSTOCK_URL WithComplateBlock:^(BOOL isSuc, id  _Nullable response, NSError * _Nullable error) {
        if (!isSuc) {
            return;
        }
        [weakSelf.dataSource removeAllObjects];
        for (NSDictionary *dic in response) {
            NSString *dataKey = [dic objectForKey:@"stockid"];
            NSDictionary *dataDic = [dic objectForKey:dataKey];
            NSMutableDictionary *newDic = [NSMutableDictionary new];
            [newDic addEntriesFromDictionary:dic];
            [newDic addEntriesFromDictionary:dataDic];
            
            NSDictionary *tagsDic = [dic objectForKey:@"themes"];
            [newDic setObject:tagsDic.allValues forKey:@"tags"];
            
            MarketModel *model = [MarketModel mj_objectWithKeyValues:newDic];
            [weakSelf.dataSource addObject:model];
        }
        [weakSelf.tbView reloadData];
        [weakSelf.tbView.mj_header endRefreshing];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MarketCell *cell = [tableView dequeueReusableCellWithIdentifier:marketCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell configWithModel:self.dataSource[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    StockDetailViewController *vc = [StockDetailViewController new];
    vc.model = self.dataSource[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    
    UILabel *lab1 = LABEL;
    lab1.text = @"名称代码";
    lab1.font = FONT(14);
    lab1.textColor = [UIColor darkGrayColor];
    [v addSubview:lab1];
    lab1.frame = CGRectMake(10, 0, 100, 40);
    lab1.textAlignment = NSTextAlignmentLeft;
    
    UILabel *lab2 = LABEL;
    lab2.text = @"最新价格";
    lab2.font = FONT(14);
    lab2.textColor = [UIColor darkGrayColor];
    [v addSubview:lab2];
    lab2.frame = CGRectMake(SCREEN_WIDTH/2.-50, 0, 100, 40);
    lab2.textAlignment = NSTextAlignmentCenter;
    
    UILabel *lab3 = LABEL;
    lab3.text = @"涨跌幅";
    lab3.font = FONT(14);
    lab3.textColor = [UIColor darkGrayColor];
    [v addSubview:lab3];
    lab3.frame = CGRectMake(SCREEN_WIDTH-10-100, 0, 100, 40);
    lab3.textAlignment = NSTextAlignmentRight;
    
    return v;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

@end
