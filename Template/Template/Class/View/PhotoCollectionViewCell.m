//
//  PhotoCollectionViewCell.m
//  Template
//
//  Created by Liujia on 2020/12/30.
//  Copyright © 2020 7m. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.img = IMAGEVIEW;
    [self.contentView addSubview:self.img];
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(10);
        make.right.bottom.equalTo(self.contentView).offset(-10);
    }];
    self.img.image = UIImageNamed(@"AddImageOutlined");
    
    self.closeBtn = BUTTON;
    [self.closeBtn setNormalTitle:nil titleColor:nil img:UIImageNamed(@"close-bold")];
    [self.closeBtn addTarget:self action:@selector(btnClick)];
    [self.contentView addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.contentView);
    }];
    self.closeBtn.hidden = YES;
}

- (void)btnClick{
    if (self.rBlock) {
        self.rBlock();
    }
}

- (void)configWithImg:(UIImage*)img{
    self.img.image = img;
    if (![img isEqual:UIImageNamed(@"AddImageOutlined")]) {
        self.closeBtn.hidden = NO;
    }
}


@end
