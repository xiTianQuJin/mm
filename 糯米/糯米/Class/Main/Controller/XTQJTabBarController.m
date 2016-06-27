//
//  XTQJTabBarController.m
//  糯米
//
//  Created by tarena41 on 16/6/23.
//  Copyright © 2016年 tarena41. All rights reserved.
//

#import "XTQJTabBarController.h"
#import "XTQJNavitionController.h"
#import "XTQJMeViewController.h"
#import "XTQJHomeViewController.h"
#import "XTQJFeatureViewController.h"
#import "XTQJNearViewController.h"
@interface XTQJTabBarController ()

@end

@implementation XTQJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    XTQJHomeViewController *homeView = [XTQJHomeViewController new];
    XTQJNearViewController *nearView = [XTQJNearViewController new];
    XTQJFeatureViewController *featureView = [XTQJFeatureViewController new];
    XTQJMeViewController *meView = [XTQJMeViewController new];
    nearView.title = @"附近";
    featureView.title = @"精选品牌";
    homeView.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"icon_tab_shouye_normal"] selectedImage:[UIImage imageNamed:@"icon_tab_shouye_highlight"]];
    nearView.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"附近" image:[UIImage imageNamed:@"icon_tab_fujin_normal"] selectedImage:[UIImage imageNamed:@"icon_tab_fujin_highlight"]];
    featureView.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"精品" image:[UIImage imageNamed:@"tab_icon_selection_normal"] selectedImage:[UIImage imageNamed:@"tab_icon_selection_highlight"]];
    meView.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"icon_tab_wode_normal"] selectedImage:[UIImage imageNamed:@"icon_tab_wode_normal"]];
    [self addChildViewController:[[XTQJNavitionController alloc]initWithRootViewController:homeView]];
    [self addChildViewController:[[XTQJNavitionController alloc]initWithRootViewController:nearView]];
    [self addChildViewController:[[XTQJNavitionController alloc]initWithRootViewController:featureView]];
    [self addChildViewController:[[XTQJNavitionController alloc]initWithRootViewController:meView]];
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
