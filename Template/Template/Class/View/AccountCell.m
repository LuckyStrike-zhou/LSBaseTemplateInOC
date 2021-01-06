//
//  AccountCell.m
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import "AccountCell.h"

@interface AccountCell()

@end

@implementation AccountCell

- (void)setup{
    
    
    self.iconImg = [[UIImageView alloc] initWithImage:UIImageNamed(@"userIcon")];
    [self.contentView addSubview:self.iconImg];
    [self.iconImg setRadius:50];
    
    self.titleLab = [UILabel new];
    [self.contentView addSubview:self.titleLab];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.iconImg.contentMode = UIViewContentModeScaleAspectFill;
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.mas_equalTo(@10);
        make.width.equalTo(self.iconImg.mas_height);
        make.height.mas_equalTo(@100);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImg.mas_bottom).offset(10);
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    self.titleLab.font = FONT(14);
    self.titleLab.text = @"166213324";
}

@end
