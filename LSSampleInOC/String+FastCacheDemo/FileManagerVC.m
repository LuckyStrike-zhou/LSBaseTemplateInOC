//
//  FileManagerVC.m
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/21.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "FileManagerVC.h"
#import "AppMacro.h"
#import "UtilsMacro.h"
#import "NSString+FileManager.h"

@interface FileManagerVC ()

@end

@implementation FileManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = C_WHITE;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    [self.view addSubview:label];
    label.center = label.superview.center;
    label.text = @"LOOK AT LOG";
    label.font = [UIFont boldSystemFontOfSize:24];
    label.textAlignment = NSTextAlignmentCenter;
    
    NSLog(@"%@",NSHomeDirectory());
    
    NSData *data = UIImagePNGRepresentation(IMAGE_NAMED(@"luckystrike"));
    NSString *dataFolderPath = [[NSString FastDocument] folderFC:@"DataFolder"];
    NSString *dataFilePath = [dataFolderPath fileFC:@"ImageData"];
    
    NSDictionary *dic = @{@"姓名":@"张三",@"年龄":@25};
    NSString *dicFolderPath = [[NSString FastTmp] folderFC:@"DicFolder"];
    NSString *dicFilePath = [dicFolderPath fileFC:@"InfoDic"];
    
//    [dataFilePath saveFC:data];
//    [dicFilePath saveFC:dic];
    NSLog(@"%f",[dataFolderPath sizeFC]);
    NSLog(@"%f",[dicFilePath sizeFC]);
    
    NSLog(@"%@",[dataFolderPath contentsFC]);
    NSLog(@"%f",[dataFilePath lastedFC]);
    
    
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
