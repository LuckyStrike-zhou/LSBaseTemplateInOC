//
//  BaseViewController.m
//  LSSampleInOC
//
//  Created by LuckyStrike on 2017/11/16.
//  Copyright © 2017年 LuckyStrike. All rights reserved.
//

#import "LSBaseViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface LSBaseViewController ()

@end

@implementation LSBaseViewController

#pragma mark -- SYSTEM

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    LSBaseViewController *viewController = [super allocWithZone:zone];
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

- (void)blankNavBackButton {
    UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
    backbutton.title = @"";
    self.navigationItem.backBarButtonItem = backbutton;
    
    if (@available(iOS 11, *)) {
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200, 0)
                                                             forBarMetrics:UIBarMetricsDefault];
    } else {
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                             forBarMetrics:UIBarMetricsDefault];
    }
}

-(void)showToastMsg:(NSString *)message Duration:(float)duration {
    
    if ([XYString isBlankString:message]) {
        return;
    }
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    UIView *showview = [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    
    CGSize LabelSize = [message boundingRectWithSize:CGSizeMake(FrameSCREEN_WIDTH-60, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} context:nil].size;
    
    label.frame = CGRectMake(10, 10, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:16];
    label.numberOfLines = 0; //
    
    [showview addSubview:label];
    showview.frame = CGRectMake((FrameSCREEN_WIDTH - LabelSize.width)/2-10, FrameSCREEN_HEIGHT/2-50, LabelSize.width+20, LabelSize.height+20);
    
    //    [UIView animateWithDuration:duration animations:^{
    //        showview.alpha = 0;
    //    } completion:^(BOOL finished) {
    //        [showview removeFromSuperview];
    //    }];
    
    //    window.userInteractionEnabled = NO;
    
    // 第一步：将view宽高缩至无限小（点）
    showview.transform = CGAffineTransformScale(CGAffineTransformIdentity,
                                                0.9, 0.9);
    [UIView animateWithDuration:0.2 animations:^{
        // 第二步： 以动画的形式将view慢慢放大至原始大小的1.2倍
        showview.transform =
        CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            // 第三步： 以动画的形式将view恢复至原始大小
            showview.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration / 2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [UIView animateWithDuration:0.2 animations:^{
                    
                    // 第一步： 以动画的形式将view慢慢放大至原始大小的1.2倍
                    showview.transform =
                    CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
                    
                } completion:^(BOOL finished) {
                    
                    [UIView animateWithDuration:0.2 animations:^{
                        
                        // 第二步： 以动画的形式将view缩小至原来的1/1000分之1倍
                        showview.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
                        
                    } completion:^(BOOL finished) {
                        
                        // 第三步： 移除
                        [showview removeFromSuperview];
                        
                        //                            window.userInteractionEnabled = YES;
                        
                    }];
                    
                }];
                
            });
            
        }];
        
    }];
    
}
@end
