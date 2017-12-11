//
//  BaseViewController.m
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/16.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "BaseViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark -- SYSTEM

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(viewController)
        [viewController _addSubviews];
        [viewController _bindViewModel];
    }];
    
    [[viewController rac_signalForSelector:@selector(viewWillAppear:)] subscribeNext:^(id x) {
        @strongify(viewController)
        [viewController _setupNavigation];
        [viewController _loadNewData];
    }];
    return viewController;
}

- (void)dealloc {
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --Protocol

- (instancetype)initWithViewModel:(id)viewModel {
    
    if (self = [super init]){
        
    }
    return  self;
}

/** 绑定 */
- (void)_bindViewModel {
    
}
/** 添加控件 */
- (void)_addSubviews {
    
}
/** 设置导航栏 */
- (void)_setupNavigation {
    
}
/** 加载数据 */
- (void)_loadNewData {
    
}

#pragma mark - Orientation
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
    
}
- (BOOL)shouldAutorotate {
    return YES;
    
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
    
}

#pragma mark - Status bar
- (BOOL)prefersStatusBarHidden {
    return NO;
    
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
    
}
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
    
}

#pragma mark -- Helper
- (void)removeNavgationLine:(BOOL)hidden {
    
    UIView *subView = [self.navigationController.navigationBar subviews].firstObject;
    for (UIView *view in subView.subviews) {
        if (CGRectGetHeight([view frame]) <= 1) {
            [view setHidden:hidden];
        }
    }
}

@end
