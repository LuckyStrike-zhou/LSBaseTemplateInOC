//
//  BaseDemoViewController.m
//  LSSampleInOC
//
//  Created by Apple on 2017/11/28.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "BaseDemoViewController.h"

@interface BaseDemoViewController ()

@end

@implementation BaseDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}
- (IBAction)changeStatus:(id)sender {
    [self changeStatusBarStyle:UIStatusBarStyleLightContent statusBarHidden:YES changeStatusBarAnimated:YES];
}
- (IBAction)changeExtend:(id)sender {
    [self setIsExtendLayout:YES];
}
- (IBAction)removeNavLine:(id)sender {
    [self removeNavgationBarLine];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
