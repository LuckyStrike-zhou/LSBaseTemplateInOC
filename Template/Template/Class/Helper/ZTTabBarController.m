//
//  ZTTabBarController.m
//  Template
//
//  Created by Liujia on 2020/12/28.
//  Copyright © 2020 7m. All rights reserved.
//

#import "ZTTabBarController.h"
#import "PostViewController.h"
#import "ProfileViewController.h"

#import "StockDetailViewController.h"

@interface ZTTabBarController ()<UITabBarControllerDelegate, CustomTabBarDelegate>

/** <#注释#>  */
@property (nonatomic,strong) ZTTabBar *customTabBar;

@end

@implementation ZTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZTTabBar *tabBar = [[ZTTabBar alloc] init];
    //取消tabBar的透明效果
    tabBar.translucent = NO;
    // 设置tabBar的代理
    tabBar.myDelegate = self;
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    [self setValue:tabBar forKey:@"tabBar"];
    self.customTabBar = tabBar;
    
    [self tabBarControllerAddChildViewController];
//    self.tabBar.barTintColor = [UIColor greenColor];
}
# pragma mark - 添加子类的数据
- (void)tabBarControllerAddChildViewController
{
//    NSArray *classControllers = [NSArray array];
//    classControllers = @[@"Demo1ViewController", @"Demo2ViewController", @"Demo4ViewController", @"Demo5ViewController"];
//    NSArray *titles = @[@"首页", @"附近", @"聊天", @"我的"];
//    NSArray *normalImages = @[@"home_normal", @"mycity_normal", @"message_normal", @"account_normal"];
//    NSArray *selectImages = @[@"home_highlight", @"mycity_highlight", @"message_highlight", @"account_highlight"];
    
    
    NSArray *classControllers = [NSArray array];
    classControllers = @[@"HomeViewController", @"MarketViewController", @"QAViewController", @"ProfileViewController"];
    NSArray *titles = @[@"首页", @"行情", @"问答", @"我的"];
    NSArray *normalImages = @[@"home_normal", @"message_normal", @"mycity_normal", @"account_normal"];
    NSArray *selectImages = @[@"home_highlight", @"message_highlight", @"mycity_highlight", @"account_highlight"];
    
    [self TabbarControllerAddSubViewsControllers:classControllers addTitleArray:titles addNormalImagesArray:normalImages addSelectImageArray:selectImages];
}


# pragma mark - 初始化Tabbar里面的元素
- (void)TabbarControllerAddSubViewsControllers:(NSArray *)classControllersArray addTitleArray:(NSArray *)titleArray addNormalImagesArray:(NSArray *)normalImagesArray addSelectImageArray:(NSArray *)selectImageArray
{
    NSMutableArray *conArr = [NSMutableArray array];
    
    for (int i = 0; i < classControllersArray.count; i++) {
        
        Class cts = NSClassFromString(classControllersArray[i]);
        UIViewController *vc = [[cts alloc] init];
        ZTNavigationController *naVC = [[ZTNavigationController alloc] initWithRootViewController:vc];
        [conArr addObject:naVC];
        
        UIImage *normalImage = [[UIImage imageNamed:normalImagesArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectImage = [[UIImage imageNamed:selectImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleArray[i] image:normalImage selectedImage:selectImage];
        vc.tabBarItem.tag = i;
        vc.title = titleArray[i];

    }
    
    self.viewControllers = conArr;
    self.tabBar.tintColor = [UIColor colorWithRed:255.0/255 green:204.0/255 blue:13.0/255 alpha:1];
    self.tabBar.translucent = NO;
    
    self.delegate = self;
}

#pragma TaoBaoCustomTabBar
/**
 *  点击了加号按钮
 */
- (void)tabBarDidClickPlusButton:(ZTTabBar *)tabBar
{
    /**
     definesPresentationContext这一属性决定了那个父控制器的View，
     将会以优先于UIModalPresentationCurrentContext这种呈现方式来展现自己的View。
     如果没有父控制器设置这一属性，那么展示的控制器将会是根视图控制器
     
     modalPresentationStyle可以设置模态是否隐藏
     
     */
    
    tabBar.plusButton.selected = YES;
    
    PostViewController *vc = [PostViewController new];
//    LoginViewController *vc = [LoginViewController new];
//    self.definesPresentationContext = YES;//把当前控制器当做背景
    vc.view.backgroundColor = [UIColor whiteColor];
//    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:vc animated:YES completion:nil];
}

# pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    self.customTabBar.plusButton.selected = NO;
    return YES;
}

@end
