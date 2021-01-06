//
//  MarketCell.m
//  Template
//
//  Created by Liujia on 2020/12/31.
//  Copyright © 2020 7m. All rights reserved.
//

#import "MarketCell.h"
#import "MarketModel.h"

@implementation MarketCell

- (void)setup{
    CGFloat margin = 15;
    self.lab1 = [self createLabelWithFontSize:14];
    [self.contentView addSubview:self.lab1];
    
    [self.lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(margin);
        make.bottom.equalTo(self.contentView.mas_centerY);
    }];
    
    self.lab2 = [self createLabelWithFontSize:10];
    [self.contentView addSubview:self.lab2];
    
    [self.lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lab1);
        make.top.equalTo(self.lab1.mas_bottom).offset(margin/2);
    }];
    
    self.lab3 = [self createLabelWithFontSize:14];
    [self.contentView addSubview:self.lab3];
    
    [self.lab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
    
    self.lab4 = [self createLabelWithFontSize:14];
    self.lab4.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.lab4];
    self.lab4.textColor = [UIColor whiteColor];
    self.lab4.clipsToBounds = YES;
    self.lab4.layer.cornerRadius = 3;
    [self.lab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-margin);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(self.lab4.mas_height).multipliedBy(2.5);
        make.height.mas_equalTo(25);
    }];
}

- (void)configWithModel:(id)model{
    if (![model isKindOfClass:[MarketModel class]]) {
        return;
    }
    
    MarketModel *newModel = (MarketModel*)model;
    
    self.lab1.text = newModel.cn_name;
    self.lab2.text = [newModel.stockid uppercaseString];
    self.lab3.text = [NSString stringWithFormat:@"%.2f",[newModel.price floatValue]];
    self.lab4.text = [NSString stringWithFormat:@" %@ ",newModel.chg];
    
    self.lab4.backgroundColor = ![newModel.chg containsString:@"-"] ? [UIColor colorWithRed:0.98 green:0.22 blue:0.26 alpha:1.00] : [UIColor colorWithRed:0.00 green:0.70 blue:0.41 alpha:1.00];    
}

- (UILabel*)createLabelWithFontSize:(CGFloat)size{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    lab.font = [UIFont systemFontOfSize:size];
    return lab;
}



@end
