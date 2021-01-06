//
//  ProfileViewController.m
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import "ProfileViewController.h"
#import "AccountCell.h"


static NSString * accountCell = @"AccountCell";

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2.)];
    bg.backgroundColor = MAIN_COLOR;
    [self.view addSubview:bg];
    [self.view bringSubviewToFront:self.tbView];
    
    [self.tbView registerClass:[AccountCell class] forCellReuseIdentifier:accountCell];
    
//    self.tbView.frame = CGRectMake(SCREEN_WIDTH/8, self.navY, SCREEN_WIDTH/4.*3, SCREEN_WIDTH);
    [self.tbView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(SCREEN_WIDTH/10.);
        make.bottom.right.mas_equalTo(-SCREEN_WIDTH/10.);
    }];
    
    self.tbView.backgroundColor = [UIColor whiteColor];
    [self.tbView setRadius:10];
//    self.tbView.scrollEnabled = NO;
//    self.tbView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else if (section == 2){
        return 4;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        AccountCell *cell = [tableView dequeueReusableCellWithIdentifier:accountCell];
        return cell;
    }
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"热股收藏";
            cell.imageView.image = UIImageNamed(@"Favoritestarrate");
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"我的问答";
            cell.imageView.image = UIImageNamed(@"tradealert");
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"意见反馈";
            cell.imageView.image = UIImageNamed(@"customer-service");
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"关于我们";
            cell.imageView.image = UIImageNamed(@"more");
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"清楚缓存";
            cell.imageView.image = UIImageNamed(@"ashbin");
        }else if (indexPath.row == 3){
            cell.textLabel.text = @"注销";
            cell.imageView.image = UIImageNamed(@"prompt");
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

@end
