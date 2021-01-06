//
//  AFNViewController.m
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/22.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "AFNViewController.h"
#import "AFNPackage.h"
#import "LSHelper.h"
#import "AppMacro.h"

static NSString *const TEST_API = @"https://httpbin.org/get";

@interface AFNViewController ()

@end

@implementation AFNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = C_WHITE;
    
    NSDictionary *testDic = @{@"name":@"zhangsan",@"age":@"25",@"sex":@"man"};
    
    [AFNPackage requestWithMethod:RequestMethodGet andUrlString:TEST_API andParameters:testDic andFinished:^(id response, NSError *error) {
        NSLog(@"%@",response);
    }];
    
    
    

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
