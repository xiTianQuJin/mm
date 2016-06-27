//
//  XTQJHomeViewController.m
//  糯米
//
//  Created by tarena41 on 16/6/23.
//  Copyright © 2016年 tarena41. All rights reserved.
//

#import "XTQJHomeViewController.h"
#import "XTQJCategory.h"
#import "XTQJCollectionViewCell.h"
#import "XTQJWebManager.h"
#import "UIImageView+AFNetworking.h"
@interface XTQJHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSArray *categoryArray;
@property (nonatomic, strong) NSArray *bannersArray;
@end
#define HomePath @"http://app.nuomi.com/naserver/home/homepage?appid=ios&bduss=FaRnFNSWpwbTZBaXAtYWdXaWd0TktDU2UzdmN4eDdXVW8tWG1LNTJBZFliNU5YQVFBQUFBJCQAAAAAAAAAAAEAAABwwHqUZ2fLvMPctO9rZm8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFjia1dY4mtXcG&channel=com_dot_apple&cityid=300210000&compId=index&compV=5.0.3&compbig=1&cuid=061ab3da172844259ae10fd44e84cab3709aec84&device=iPhone&ha=5&lbsidfa=194BB58B-2926-4AD2-B488-5F4BA61EB6DC&locate_city_id=300210000&location=22.648260%2C114.210130&logpage=Home&net=wifi&os=9.3&page_type=component&power=0.88&sheight=1136&sign=80877c43bdf9a405480cd0f725df5507&swidth=640&terminal_type=ios&timestamp=1466827095191&tn=ios&uuid=061ab3da172844259ae10fd44e84cab3709aec84&v=6.6.2&wifi=%5B%7B%22mac%22%3A%22b8%3A09%3A8a%3Add%3A85%3A29%22%2C%22sig%22%3A99%2C%22ssid%22%3A%22%E6%97%A5%E6%97%A5%E6%97%A5%E6%97%A5%E6%97%A5%22%7D%5D&wifi_conn=%7B%22mac%22%3A%22b8%3A09%3A8a%3Add%3A85%3A29%22%2C%22sig%22%3A99%2C%22ssid%22%3A%22%E6%97%A5%E6%97%A5%E6%97%A5%E6%97%A5%E6%97%A5%22%7D"

#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
static const CGFloat itemWidth = 60;
static const CGFloat interItemSpace = 10;
static const CGFloat topBottomInset = 15;
@implementation XTQJHomeViewController
-(void)viewWillAppear:(BOOL)animated{
    [XTQJWebManager GetBannersRequestWithPath:HomePath andCallback:^(id obj) {
        self.bannersArray = obj;
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    [self setUpHeadView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.navigationController.navigationBar.alpha = 0;
    self.tableView.tableHeaderView = self.headView;
    self.automaticallyAdjustsScrollViewInsets = YES;
    UIImage *image = [[UIImage alloc]init];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"深圳" style:UIBarButtonItemStyleDone target:self action:@selector(selectedCity)];
    UIBarButtonItem *rightFirstBar = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_nav_cart_normal.png"] style:UIBarButtonItemStyleDone target:self action:@selector(goToCart)];
    UIBarButtonItem *rightScecondBar = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_nav_saoyisao_normal.png"] style:UIBarButtonItemStyleDone target:self action:@selector(PayForAndScan)];
    self.navigationItem.leftBarButtonItems = @[rightFirstBar,rightScecondBar];
  }
-(void)selectedCity{
    
}
-(void)goToCart{
    
}
-(void)PayForAndScan{
    
}
-(void)setUpHeadView{
    [self setUpScrollerView];
    [self setUpPageView];
    [self setUpButton];
    [self setUpCollectionView];
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, self.scrollView.bounds.size.height+self.button.bounds.size.height+self.collectionView.bounds.size.height+30)];
    self.headView.backgroundColor = [UIColor clearColor];
    [self.headView addSubview:self.scrollView];
    [self.headView addSubview:self.pageView];
    [self.headView addSubview:self.button];
    [self.headView addSubview:self.collectionView];
    [self.headView addSubview:self.pageControl];
}
-(void)setUpPageView{
    self.pageView = [[UIPageControl alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH/2, 70, 20, 20)];
    self.pageView.numberOfPages = 5;
    self.pageView.currentPage = 0;
    self.pageView.pageIndicatorTintColor = [UIColor redColor];
    self.pageView.currentPageIndicatorTintColor = [UIColor whiteColor];
}
-(void)setUpCollectionView{
    [XTQJWebManager GetCategoryRequestWithPath:HomePath andCallback:^(id obj) {
        self.categoryArray = obj;
        [self.collectionView reloadData];
    }];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.itemSize = CGSizeMake(itemWidth, itemWidth);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 180, kSCREEN_WIDTH, itemWidth*2+2*topBottomInset+interItemSpace) collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    [self.collectionView registerNib:[UINib nibWithNibName:@"XTQJCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"item"];
    self.collectionView.backgroundColor = [UIColor clearColor];
//    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(kSCREEN_WIDTH/2, self.scrollView.bounds.size.height+self.button.bounds.size.height+self.collectionView.bounds.size.height, 20, 20)];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
 
}
-(void)setUpButton{
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(0, 100, kSCREEN_WIDTH, 80);
    [XTQJWebManager GetNuomiBigNewBannerRequestWithPath:HomePath andCallback:^(id obj) {
        [self.button setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:obj]]] forState:UIControlStateNormal];
    }];
    
}
-(void)setUpScrollerView{
    NSLog(@"%@",[NSThread currentThread]);
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 100)];
    self.scrollView.contentSize = CGSizeMake(kSCREEN_WIDTH*5, 100);
    self.scrollView.pagingEnabled=YES;
    self.scrollView.bounces=NO;
    self.scrollView.backgroundColor = [UIColor purpleColor];
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
       for (int i=0; i<5; i++) {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(self.scrollView.frame.size.width*i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        imageView.userInteractionEnabled=YES;
        imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.bannersArray[i]]]]];
        [self.scrollView  addSubview:imageView];
    }
   
}
-(void)nextImage{
    self.pageView.currentPage=(self.scrollView.contentOffset.x+0.5*self.scrollView.frame.size.width)/self.scrollView.frame.size.width;
    NSInteger n=self.pageView.currentPage;
    if (n==4) {
        n=0;
    }else{
        n=self.pageView.currentPage+1;
    }
    CGFloat offsetX=n*self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
-(void)setUpTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int pageValue = scrollView.contentOffset.x/scrollView.frame.size.width +0.5;
    self.pageControl.currentPage = pageValue;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.categoryArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XTQJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    XTQJCategory *category = self.categoryArray[indexPath.item];
    cell.category = category;
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"????");
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return kSCREEN_WIDTH/5-itemWidth;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return interItemSpace;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(topBottomInset, kSCREEN_WIDTH/8-itemWidth/2, topBottomInset, topBottomInset);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 5;
            break;
        default:
            return 1;
            break;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    if (indexPath.section == 0) {
//        switch (indexPath.row) {
//            case 0:
//                cell =
//                break;
//                
//            default:
//                break;
//        }
//    }
    return cell;
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
