//
//  QATableViewCell.m
//  Template
//
//  Created by Liujia on 2020/12/31.
//  Copyright © 2020 7m. All rights reserved.
//

#import "QATableViewCell.h"
#import "QAModel.h"

@implementation QATableViewCell

- (void)setup{
    UIImageView *icon = IMAGEVIEW;
    icon.image = UIImageNamed(@"wen");
    [self.contentView addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.width.equalTo(icon.mas_height);
    }];
    
    UILabel *askLab = LABEL;
    askLab.font = FONT(14);
    askLab.textColor = [UIColor darkGrayColor];
    askLab.numberOfLines = 3;
    [self.contentView addSubview:askLab];
    [askLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(icon);
        make.left.equalTo(icon.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(-15);
    }];
    self.askLab = askLab;
    
    UILabel *stockLab = LABEL;
    stockLab.font = FONT(12);
    stockLab.textColor = [UIColor whiteColor];
    stockLab.backgroundColor = UIColorFromRGB(0x949cdf);
    [stockLab setRadius:3];
    [self.contentView addSubview:stockLab];
    [stockLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(askLab.mas_bottom).offset(5);
        make.left.equalTo(askLab);
    }];
    self.stock = stockLab;
    
    UILabel *timeLab = LABEL;
    timeLab.font = FONT(12);
    timeLab.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:timeLab];
    [timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(-15);
        make.top.equalTo(stockLab.mas_bottom).offset(10);
    }];
    self.timeLab = timeLab;
}

- (void)configWithModel:(id)model{
    if (![model isKindOfClass:[QAModel class]]) {
        return;
    }
    
    QAModel *newModel = (QAModel*)model;
    self.askLab.text = [newModel.question stringByReplacingOccurrencesOfString:@"董秘" withString:@""];
    self.stock.text = [NSString stringWithFormat:@"#%@",newModel.codeName];
    self.timeLab.text = newModel.questiondate;
}

@end
