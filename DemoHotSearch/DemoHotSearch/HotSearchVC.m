//
//  HotSearchVC.m
//  DemoHotSearch
//
//  Created by zhangshaoyu on 16/10/27.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "HotSearchVC.h"
#import "SYHotSearch.h"

@interface HotSearchVC ()

@end

@implementation HotSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"自定义搜索热词视图";
    
    [self setNinePachView];
    [self setView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (void)setNinePachView
{
    SYHotSearchView *hotView = [[SYHotSearchView alloc] initWithFrame:CGRectMake(0.0, 10.0, CGRectGetWidth(self.view.bounds), 40.0)];
    // 添加到父视图
    [self.view addSubview:hotView];
    hotView.backgroundColor = SYHotSearchRandomColor;
    // 显示热词搜索标题
    hotView.showHotSearchLabel = NO;
    hotView.hotSearchLabel.textAlignment = NSTextAlignmentCenter;
    hotView.hotSearchLabel.text = @"热门搜索词";
    hotView.hotSearchLabel.font = [UIFont systemFontOfSize:20.0];
    hotView.hotSearchLabel.textColor = SYHotSearchRandomColor;
    hotView.hotSearchLabel.backgroundColor = SYHotSearchRandomColor;
    hotView.hotSearchImage = [UIImage imageNamed:@"normalImage"];
    // 热词显示样式是否九宫格
    hotView.isHotSearchStyleNinePatch = YES;
    // 热词边框样式
    hotView.hotSearchBorderColor = SYHotSearchRandomColor;
    hotView.hotSearchCornerRadius = 10.0;
    hotView.hotSearchBorderWidth = 1.0;
    // 热词排序
    hotView.isHotSearchSort = NO;
    // 热词字体颜色
    hotView.hotSearchTextNormalColor = SYHotSearchRandomColor;
    hotView.hotSearchTextHighlightColor = SYHotSearchRandomColor;
    // 热词背景颜色
    hotView.hotSearchTextNormalBackgroundColors = @[SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor];
    hotView.hotSearchTextHighlightBackgroundColors = @[SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor];
    // 数据源
    hotView.hotSearchWords = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    // 选择点击回调
    hotView.hotSearchTextClick = ^(NSString *text){
        [[[UIAlertView alloc] initWithTitle:nil message:text delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了", nil] show];
    };
    // 刷新数据
    [hotView reloadData];
}

- (void)setView
{
    SYHotSearchView *hotView = [[SYHotSearchView alloc] initWithFrame:CGRectMake(0.0, 200.0, CGRectGetWidth(self.view.bounds), 40.0)];
    // 添加到父视图
    [self.view addSubview:hotView];
    hotView.backgroundColor = SYHotSearchRandomColor;
    // 显示热词搜索标题
    hotView.showHotSearchLabel = YES;
    hotView.hotSearchLabel.textAlignment = NSTextAlignmentCenter;
    hotView.hotSearchLabel.text = @"热门搜索词";
    hotView.hotSearchLabel.font = [UIFont systemFontOfSize:20.0];
    hotView.hotSearchLabel.textColor = SYHotSearchRandomColor;
    hotView.hotSearchLabel.backgroundColor = SYHotSearchRandomColor;
    hotView.hotSearchImage = [UIImage imageNamed:@"normalImage"];
    // 热词显示样式是否九宫格
    hotView.isHotSearchStyleNinePatch = NO;
    // 热词边框样式
    hotView.hotSearchBorderColor = SYHotSearchRandomColor;
    hotView.hotSearchCornerRadius = 10.0;
    hotView.hotSearchBorderWidth = 1.0;
    // 热词排序
    hotView.isHotSearchSort = YES;
    // 热词字体颜色
    hotView.hotSearchTextNormalColor = SYHotSearchRandomColor;
    hotView.hotSearchTextHighlightColor = SYHotSearchRandomColor;
    // 热词背景颜色
    hotView.hotSearchTextNormalBackgroundColors = @[SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor];
    hotView.hotSearchTextHighlightBackgroundColors = @[SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor,SYHotSearchRandomColor];
    // 数据源
    hotView.hotSearchWords = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    // 选择点击回调
    hotView.hotSearchTextClick = ^(NSString *text){
        [[[UIAlertView alloc] initWithTitle:nil message:text delegate:nil cancelButtonTitle:nil otherButtonTitles:@"知道了", nil] show];
    };
    // 刷新数据
    [hotView reloadData];
}

@end
