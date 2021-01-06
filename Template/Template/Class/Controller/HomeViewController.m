//
//  HomeViewController.m
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import "HomeViewController.h"
#import <JhtMarquee/JhtVerticalMarquee.h>
#import "NewModel.h"
#import "HotStockCell.h"


static NSString * hotStockCell = @"HotStockCell";

@interface HomeViewController ()

/** 跑马灯  */
@property (nonatomic,strong) JhtVerticalMarquee *marquee;

/** <#注释#>  */
@property (nonatomic,strong) NSMutableArray *newsArr;

/** <#注释#>  */
@property (nonatomic,strong) UIView *newsHeader;
@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tbView registerClass:[HotStockCell class] forCellReuseIdentifier:hotStockCell];
    
    [self setupRefreshHeader];
    [self.tbView.mj_header beginRefreshing];
}


- (void)refreshTBViewData{
    WS;
    [[ZTNetwork sharedInstance] requestURL:NEWSURL WithComplateBlock:^(BOOL isSuc, id  _Nullable response, NSError * _Nullable error) {
        if (!isSuc) {
            return;
        }
        NSMutableArray *tmpArr = [NSMutableArray new];
        for (NSDictionary *dic in response) {
            NewModel *model = [NewModel mj_objectWithKeyValues:dic];
            [weakSelf.newsArr addObject:model];
            [tmpArr addObject:model.title];
        }
        weakSelf.marquee.sourceArray = tmpArr;
        [weakSelf.tbView reloadData];
        [weakSelf.tbView.mj_header endRefreshing];
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else if (section == 1){
        return 3;
    }
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        HotStockCell *cell = [tableView dequeueReusableCellWithIdentifier:hotStockCell];
        [cell configWithModel:nil];
        return cell;
    }
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.newsHeader;
    }else if (section == 1){
        UILabel *lab = LABEL;
        lab.text = @"  热股淘金";
        lab.textColor = [UIColor darkTextColor];
        lab.font = FONT1(18);
        return lab;
    }else if (section == 2){
        UILabel *lab = LABEL;
        lab.text = @"  专业指路";
        lab.textColor = [UIColor darkTextColor];
        lab.font = FONT1(18);
        return lab;
    }
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 80;
    }else if (section == 1||section == 2){
        return 40;
    }else{
        return CGFLOAT_MIN;
    }
}

#pragma mark - getter

- (UIView*)newsHeader{
    if (!_newsHeader) {
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
        v.backgroundColor = MAIN_COLOR;
        UIImageView *img = IMAGEVIEW;
        img.frame = CGRectMake(8, 29, 64, 18);
        img.image = UIImageNamed(@"news");
        [v addSubview:img];
        img.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.marquee marqueeOfSettingWithState:MarqueeStart_V];
        [v addSubview:self.marquee];
        self.marquee.frame = CGRectMake(MAX(SCREEN_WIDTH/8., 80), 20, SCREEN_WIDTH/4.*3, 40);
        _newsHeader = v;
    }
    return _newsHeader;
}

- (JhtVerticalMarquee *)marquee{
    if (!_marquee) {
        _marquee = [[JhtVerticalMarquee alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/4.*3, 40)];
//        [_marquee setRadius:20];
        _marquee.textColor = [UIColor whiteColor];
        _marquee.numberOfLines = 1;
        _marquee.textFont = FONT2(14);
    }
    return _marquee;
}

- (NSMutableArray *)newsArr{
    if (!_newsArr) {
        _newsArr = [NSMutableArray new];
    }
    return _newsArr;
}

@end
