//
//  ViewController.m
//  DemoHotSearch
//
//  Created by zhangshaoyu on 16/10/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "ViewController.h"
#import "HotSearchVC.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"搜索热词视图";
    

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"hotSearch" style:UIBarButtonItemStyleDone target:self action:@selector(buttonClick:)];
    
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


- (void)buttonClick:(UIBarButtonItem *)button
{
    HotSearchVC *nextVC = [[HotSearchVC alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}


@end
