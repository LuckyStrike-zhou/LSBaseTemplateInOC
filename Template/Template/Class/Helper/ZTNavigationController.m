//
//  ZTNavigationController.m
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import "ZTNavigationController.h"
#import "UIImage+Image.h"

@interface ZTNavigationController ()

@end

@implementation ZTNavigationController

//+ (void)initialize{
//    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
//
//    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
//    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
//    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
//
//    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
//    dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
//    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
//
//    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
//    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationBar.barTintColor = MAIN_COLOR;
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self removeLine];
}

- (void)removeLine{
    
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:MAIN_COLOR] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [[UIImage alloc] init];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
