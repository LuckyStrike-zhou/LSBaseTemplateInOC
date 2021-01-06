//
//  HotStockCell.m
//  Template
//
//  Created by Liujia on 2020/12/31.
//  Copyright © 2020 7m. All rights reserved.
//

#import "HotStockCell.h"

@implementation HotStockCell

- (void)setup{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIView *shadow = [UIView new];
//    [shadow setRadius:4];
    shadow.backgroundColor = [UIColor whiteColor];
    
    shadow.layer.cornerRadius = 10.;
    shadow.layer.shadowColor = [UIColor blackColor].CGColor;
    shadow.layer.shadowOffset = CGSizeMake(0, 0);
    shadow.layer.shadowOpacity = 0.3;
    shadow.layer.shadowRadius = 5.;
    
    [self.contentView addSubview:shadow];
    [shadow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@0);
        make.left.mas_equalTo(20);
        make.right.bottom.mas_equalTo(-20);
    }];
    
    self.nameLab = LABEL;
    [shadow addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(5);
    }];
    
    self.codeLab = LABEL;
    [shadow addSubview:self.codeLab];
    [self.codeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_right);
        make.bottom.equalTo(self.nameLab);
    }];
    
    UILabel *pnLab = LABEL;
    pnLab.text = @"最新价格";
    [shadow addSubview:pnLab];
    [pnLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(shadow).multipliedBy(1/2.);
//        make.left.mas_equalTo(SCREEN_WIDTH/4.);
        make.top.equalTo(self.nameLab.mas_bottom).offset(10);
    }];
    
    self.priceLab = LABEL;
    [shadow addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(pnLab);
        make.top.equalTo(pnLab.mas_bottom).offset(10);
        make.bottom.equalTo(shadow).offset(-30);
    }];
    
    UILabel *zdfnLab = LABEL;
    zdfnLab.text = @"涨跌幅";
    [shadow addSubview:zdfnLab];
    [zdfnLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(shadow).multipliedBy(3/2.);
//        make.left.mas_equalTo(SCREEN_WIDTH/4.*3);
        make.top.equalTo(self.nameLab.mas_bottom).offset(10);
    }];
    
    self.zdfLab = LABEL;
    [shadow addSubview:self.zdfLab];
    [self.zdfLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(zdfnLab);
        make.top.equalTo(zdfnLab.mas_bottom).offset(10);
    }];
    
    UIButton *btn = [UIButton moreBtn];
    [btn addTarget:self action:@selector(moreBtnClick)];
    [shadow addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(8);
        make.right.mas_equalTo(-30);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(20);
    }];
    
    self.nameLab.textColor = [UIColor darkGrayColor];
    self.codeLab.textColor = [UIColor darkGrayColor];
    self.priceLab.textColor = [UIColor redColor];
    self.zdfLab.textColor = [UIColor redColor];
    pnLab.textColor = [UIColor darkGrayColor];
    zdfnLab.textColor = [UIColor darkGrayColor];
    
    self.nameLab.font = FONTBOLD(14);
    self.codeLab.font = FONT(11);
    self.priceLab.font = FONT(13);
    self.zdfLab.font = FONT(13);
    pnLab.font = FONTBOLD(14);
    zdfnLab.font = FONTBOLD(14);
    
    
}

- (void)configWithModel:(id)model{
    self.nameLab.text = @"招商银行";
    self.codeLab.text = @"(SH68392)";
    self.priceLab.text = @"773";
    self.zdfLab.text = @"24%";
}

- (void)moreBtnClick{
    if (self.cBlock) {
        self.cBlock();
    }
}

@end
