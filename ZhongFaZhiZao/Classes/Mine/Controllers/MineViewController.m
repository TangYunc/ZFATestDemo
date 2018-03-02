//
//  MineViewController.m
//  ZhongFaZhiZao
//
//  Created by 中发 on 2018/3/1.
//  Copyright © 2018年 中发. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeaderView.h"
#import "MineTableView.h"

@interface MineViewController ()<UIScrollViewDelegate>
// tableView
@property (nonatomic, strong) MineTableView *tableView;
// headerHeight
@property (nonatomic, assign) CGFloat headerHeight;
// headerImageView
@property (nonatomic, strong) UIImageView *headerImageView;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 初始化TableView
    [self setupTableView];

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma mark -初始化TableView

- (void)setupTableView {
    
    // TableView
    self.tableView = [[MineTableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - TabBar_HEIGHT);
    [self.view addSubview:self.tableView];
    
    NSLog(@"宽：%f----高：%f",KWidth_ScaleW,KWidth_ScaleH);
    //header
    self.headerHeight = 291 * KWidth_ScaleH;
    CGRect bounds = CGRectMake(0, 0, kScreenWidth, self.headerHeight);
    MineHeaderView *contentView = [[MineHeaderView alloc] initWithFrame:bounds];
    contentView.backgroundColor = BLUE_COLOR;
    self.tableView.tableHeaderView = contentView;
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
