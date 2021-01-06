//
//  LoginViewController.m
//  Template
//
//  Created by Liujia on 2020/12/30.
//  Copyright © 2020 7m. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImageView *iconImg = IMAGEVIEW;
    iconImg.image = UIImageNamed(@"AppIcon");
    [self.view addSubview:iconImg];
    [iconImg setRadius:10];
    [iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(SCREEN_WIDTH/8.);
        make.height.equalTo(iconImg.mas_width);
        make.width.mas_equalTo(80);
    }];

    UILabel *welcomeLab = LABEL;
    welcomeLab.text = @"欢迎注册";
    [self.view addSubview:welcomeLab];
    [welcomeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImg.mas_bottom).offset(80);
        make.left.mas_equalTo(SCREEN_WIDTH/8.);
    }];
    
    UITextField *userTF = [UITextField new];
    [self.view addSubview:userTF];
    userTF.leftView = [[UIImageView alloc] initWithImage:UIImageNamed(@"mobile-phone")];
    userTF.leftViewMode = UITextFieldViewModeAlways;
    [userTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
//        make.top.mas_equalTo(SCREEN_HEIGHT/4.);
        make.top.equalTo(welcomeLab.mas_bottom).offset(40);
        make.width.mas_equalTo(SCREEN_WIDTH/4.*3);
    }];
    UIView *line1 = [UIView new];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userTF).offset(25);
        make.right.bottom.equalTo(userTF);
        make.height.mas_equalTo(0.5);
    }];
    
    UITextField *passwTF = [UITextField new];
    [self.view addSubview:passwTF];
    passwTF.leftView = [[UIImageView alloc] initWithImage:UIImageNamed(@"lock")];
    passwTF.leftViewMode = UITextFieldViewModeAlways;
    [passwTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(userTF.mas_bottom).offset(30);
        make.width.mas_equalTo(SCREEN_WIDTH/4.*3);
    }];
    UIView *line2 = [UIView new];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(passwTF).offset(25);
        make.right.bottom.equalTo(passwTF);
        make.height.mas_equalTo(0.5);
    }];
    
    
    UIButton *loginBtn = BUTTON;
    loginBtn.backgroundColor = MAIN_COLOR;
    [loginBtn setNormalTitle:@"提交" titleColor:[UIColor whiteColor] img:nil];
    [loginBtn setHignlightTitle:@"提交" titleColor:[UIColor lightGrayColor] img:nil];
    [loginBtn setRadius:5];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(passwTF.mas_bottom).offset(60);
        make.width.mas_equalTo(SCREEN_WIDTH/4.*3);
        make.height.mas_equalTo(40);
    }];
    
    
    UIButton *proBtn = BUTTON;
    [proBtn setNormalTitle:@"未注册用户首次登陆自动注册\n注册即代表已同意用户协议" titleColor:[UIColor blueColor] img:nil];
    proBtn.titleLabel.font = FONT(12);
    proBtn.titleLabel.numberOfLines = 0;
    proBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:proBtn];
    [proBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(loginBtn.mas_bottom).offset(10);
        make.width.equalTo(loginBtn).multipliedBy(3/4.);
    }];
}

@end
