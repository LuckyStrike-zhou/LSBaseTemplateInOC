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
#import "UIMacro.h"

static NSString *const TEST_API = @"https://httpbin.org";

@interface AFNViewController ()

@end

@implementation AFNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = WHITE_COLOR_Macro;
    
    NSDictionary *testDic = @{@"name":@"zhangsan",@"年龄":@25,@"sex":@"man"};
    
    [AFNPackage GetWithURL:TEST_API paraments:testDic progress:nil complate:^(id response, NSError *error) {
        if (error) {
            NSLog(error);
        }else{
            NSLog(((NSDictionary*)response).description);
        }
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
