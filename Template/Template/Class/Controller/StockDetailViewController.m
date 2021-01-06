//
//  StockDetailViewController.m
//  Template
//
//  Created by Liujia on 2020/12/30.
//  Copyright © 2020 7m. All rights reserved.
//

#import "StockDetailViewController.h"
#import "YYKline.h"

@interface StockDetailViewController ()

/**
 *  K线图View
 */
@property (nonatomic, strong) YYKlineView *kLineView;


@end

@implementation StockDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [NSString stringWithFormat:@"%@(%@)",self.model.cn_name,[self.model.stockid uppercaseString]];
    
    UIButton *btn = BUTTON;
    [btn setImage:UIImageNamed(@"Favoritestarrate") forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(collectBtnClick:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    
    self.kLineView = [YYKlineView new];
    [self.view addSubview:self.kLineView];
    self.kLineView.linePainter = YYCandlePainter.class;
    self.kLineView.indicator1Painter = YYMAPainter.class;
    self.kLineView.indicator2Painter = YYMACDPainter.class;
    
    [self.kLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.equalTo(self.view);//.multipliedBy(1/2.);
    }];
    [self requestChartData];
    
    UILabel *nameLab = LABEL;
    nameLab.text = self.model.cn_name;
    [self.view addSubview:nameLab];
    [nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.kLineView.mas_bottom).offset(30);
    }];
    
    UILabel *codeLab = LABEL;
    codeLab.text = [self.model.stockid uppercaseString];
    [self.view addSubview:codeLab];
    [codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLab.mas_right);
        make.bottom.equalTo(nameLab);
    }];
}

- (void)collectBtnClick:(UIButton*)sender{
    [sender setImage:UIImageNamed(@"favorite") forState:UIControlStateNormal];
}

- (void)requestChartData{
    NSString *url = @"https://h5-market.niuyan.com/web/v1/ticker/kline?exchange_id=zb&base_symbol=USDT&quote_symbol=QC&lan=zh-cn&size=500&interval=1h";
    WS;
    [[ZTNetwork sharedInstance] GET:url parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        YYKlineRootModel *groupModel = [YYKlineRootModel objectWithArray:responseObject[@"data"][@"data"]];
        weakSelf.kLineView.rootModel = groupModel;
        [weakSelf.kLineView reDraw];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}



@end
