//
//  SYHotSearchView.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/10/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "SYHotSearchView.h"
#import "SYHotSearchConst.h"

@interface SYHotSearchView ()

@property (nonatomic, assign, readonly) CGFloat widthNinePatch;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIImageView *titleImageView;

@property (nonatomic, strong) NSMutableArray *hotSearchButtons;

@end

@implementation SYHotSearchView

#pragma mark - 实例化

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initDefault];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initDefault];
        [self setUI];
    }
    
    return self;
}

//- (void)setFrame:(CGRect)frame
//{
//    self.frame = frame;
//    [self setUI];
//}

#pragma mark - 视图

- (void)setUI
{
    [self.titleView addSubview:self.titleImageView];
    [self.titleView addSubview:self.hotSearchLabel];
    [self addSubview:self.titleView];
    
    [self.hotSearchButtons removeAllObjects];
    
    for (NSInteger number = 0; number < SYHotSearchCountMax; number++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        button.frame = CGRectZero;
        button.tag = (number + SYHotSearchButtonTag);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.hotSearchButtons addObject:button];
    }
}

- (void)initDefault
{
    self.titleView.backgroundColor = [UIColor clearColor];
    self.titleImageView.backgroundColor = [UIColor clearColor];
    
    self.showHotSearchLabel = NO;
   
    self.hotSearchLabel.font = [UIFont systemFontOfSize:12.0];
    self.hotSearchLabel.textColor = [UIColor blackColor];
    self.hotSearchLabel.textAlignment = NSTextAlignmentLeft;
    
    self.hotSearchImage = nil;
    
    self.isHotSearchStyleNinePatch = YES;
    
    self.isHotSearchSort = NO;
    
    self.hotSearchBorderColor = [UIColor lightGrayColor];
    self.hotSearchCornerRadius = 5.0;
    self.hotSearchBorderWidth = 0.5;
    
    self.hotSearchTextFont = [UIFont systemFontOfSize:12.0];
    self.hotSearchTextNormalColor = [UIColor blackColor];
    
    self.hotSearchTextNormalBackgroundColors = nil;
    self.hotSearchTextHighlightBackgroundColors = nil;
}

#pragma mark - 刷新视图

// 头视图标签（标题、图标）
- (void)reloadDataHotSearchTitle
{
    if (self.showHotSearchLabel)
    {
        self.titleView.hidden = NO;
        self.titleView.frame = CGRectMake(0.0, 0.0, CGRectGetWidth(self.bounds), SYHotSearchHeight);
        self.titleView.backgroundColor = self.hotSearchLabel.backgroundColor;
        
        CGFloat originXImage = 0.0;
        CGFloat originXLabel = SYHotSearchOrigin;
        CGFloat widthLabel = (CGRectGetWidth(self.titleView.bounds) - SYHotSearchOrigin * 2);
        
        if (self.hotSearchImage)
        {
            self.titleImageView.hidden = NO;
            self.titleImageView.image = self.hotSearchImage;
            
            if (self.hotSearchLabel.textAlignment == NSTextAlignmentLeft)
            {
                originXImage = SYHotSearchOrigin;
                originXLabel = (CGRectGetMinX(self.titleImageView.frame) + CGRectGetWidth(self.titleImageView.bounds) + SYHotSearchOrigin);
                widthLabel = (CGRectGetWidth(self.titleView.bounds) - self.hotSearchLabel.SYHotSearch_x - SYHotSearchOrigin);
            }
            else
            {
                CGSize sizeLabel = [self.hotSearchLabel.text sizeWithAttributes:@{NSFontAttributeName:self.hotSearchLabel.font}];
                CGFloat widthTotal = (CGRectGetWidth(self.titleImageView.bounds) + sizeLabel.width + SYHotSearchOrigin);
                widthTotal = (widthTotal >= CGRectGetWidth(self.titleView.bounds) ? (CGRectGetWidth(self.titleView.bounds) - SYHotSearchOrigin * 2) : widthTotal);
                
                if (self.hotSearchLabel.textAlignment == NSTextAlignmentCenter)
                {
                    CGFloat originCenter = (CGRectGetWidth(self.titleView.bounds) - widthTotal) / 2;
                    
                    originXImage = originCenter;
                    originXLabel = (originXImage + CGRectGetWidth(self.titleImageView.bounds) + SYHotSearchOrigin);
                    widthLabel = (widthTotal - SYHotSearchOrigin - CGRectGetWidth(self.titleImageView.bounds));
                }
                else if (self.hotSearchLabel.textAlignment == NSTextAlignmentRight)
                {
                    widthLabel = (widthTotal - SYHotSearchOrigin - CGRectGetWidth(self.titleImageView.bounds));
                    originXLabel = (CGRectGetWidth(self.titleView.bounds) - SYHotSearchOrigin - widthLabel);
                    
                    originXImage = (originXLabel - CGRectGetWidth(self.titleImageView.bounds) - SYHotSearchOrigin);
                }
            }
        }
        else
        {
            self.titleImageView.hidden = YES;
            self.titleImageView.image = nil;
        }
        
        self.titleImageView.SYHotSearch_x = originXImage;
        self.hotSearchLabel.SYHotSearch_x = originXLabel;
        self.hotSearchLabel.SYHotSearch_width = widthLabel;
    }
    else
    {
        self.titleView.hidden = YES;
        self.titleView.frame = CGRectZero;
    }
}

// 搜索热词视图按钮标题
- (void)reloadDataHotSearchContentTitle
{
    for (NSInteger index = 0; index < self.hotSearchWords.count; index++)
    {
        UIButton *button = [self.hotSearchButtons objectAtIndex:index];
        // 标题
        NSString *title = [self.hotSearchWords objectAtIndex:index];
        if (self.isHotSearchSort)
        {
            // 排序时
            title = [NSString stringWithFormat:@"%@ %@", @(index + 1), title];
        }
        [button setTitle:title forState:UIControlStateNormal];
        
        // 标题样式
        button.titleLabel.font = self.hotSearchTextFont;
        [button setTitleColor:self.hotSearchTextNormalColor forState:UIControlStateNormal];
        if (self.hotSearchTextHighlightColor)
        {
            [button setTitleColor:self.hotSearchTextHighlightColor forState:UIControlStateHighlighted];
        }
        // 背景色
        UIImage *normalImage = [self backgroundImageWithIndex:index colors:self.hotSearchTextNormalBackgroundColors];
        [button setBackgroundImage:normalImage forState:UIControlStateNormal];
        UIImage *highlightImage = [self backgroundImageWithIndex:index colors:self.hotSearchTextHighlightBackgroundColors];
        [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
        
        if (!self.isHotSearchStyleNinePatch)
        {
            // 非九宫格时，自适应宽高
            CGSize sizeButton = [button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
            button.SYHotSearch_width = sizeButton.width + 20.0;
            button.SYHotSearch_height = sizeButton.height + 14.0;
        }
    }
}

// 搜索热词视图九宫格样式
- (void)reloadDataHotSearchContentStyleNinePatch:(CGFloat)originTop
{
    // 九宫格
    for (NSInteger index = 0; index < self.hotSearchWords.count; index++)
    {
        UIButton *button = [self.hotSearchButtons objectAtIndex:index];
        
        CGFloat width = self.widthNinePatch;
        NSInteger row = self.hotSearchWords.count / SYHotSearchCountRow;
        row += (self.hotSearchWords.count % SYHotSearchCountRow == 0 ? 0 : 1);
        
        CGFloat originX = (index % SYHotSearchCountRow * width);
        CGFloat originY = (index / SYHotSearchCountRow * SYHotSearchButtonHeight + originTop);
        button.frame = CGRectMake(originX, originY, width, SYHotSearchButtonHeight);
        
        NSLog(@"index = %@, value = %@, frame = %@", @(index), button.titleLabel.text, NSStringFromCGRect(button.frame));
    }
}

// 搜索热词视图自适应样式
- (void)reloadDataHotSearchContentStyleAuto:(CGFloat)originTop
{
    // 计算位置
    CGFloat currentX = SYHotSearchOrigin;
    CGFloat currentY = originTop + SYHotSearchOrigin;
    
    for (NSInteger index = 0; index < self.hotSearchWords.count; index++)
    {
        UIButton *button = [self.hotSearchButtons objectAtIndex:index];
        
        // 边框样式
        button.layer.borderColor = self.hotSearchBorderColor.CGColor;
        button.layer.cornerRadius = self.hotSearchCornerRadius;
        button.layer.masksToBounds = YES;
        button.layer.borderWidth = self.hotSearchBorderWidth;
     
        // 当搜索字数过多，宽度为contentView的宽度
        if (button.SYHotSearch_width > self.SYHotSearch_width)
        {
            button.SYHotSearch_width = self.SYHotSearch_width;
        }
        
        // 当前按钮坐标
        button.SYHotSearch_x = currentX;
        button.SYHotSearch_y = currentY;
        
        // 判断下一个button是否要换行
        NSInteger nextIndex = (index >= self.hotSearchWords.count - 1 ? index : index + 1);
        UIButton *nextButton = [self.hotSearchButtons objectAtIndex:nextIndex];
        if ((button.SYHotSearch_x + button.SYHotSearch_width + SYHotSearchOrigin + nextButton.SYHotSearch_width + SYHotSearchOrigin) > self.SYHotSearch_width)
        {
            // 得换行
            currentX = SYHotSearchOrigin;
            currentY = button.SYHotSearch_y + button.SYHotSearch_height + SYHotSearchOrigin;
        }
        else
        {
            // 不换行
            currentX = button.SYHotSearch_x + button.SYHotSearch_width + SYHotSearchOrigin;
            currentY = button.SYHotSearch_y;
        }
    }
}

// 搜索热词视图
- (void)reloadDataHotSearchContent:(CGFloat)originTop
{
    // 热词视图
    // 1 隐藏所有热词搜索按钮
    for (UIButton *button in self.hotSearchButtons)
    {
        button.frame = CGRectZero;
    }
    
    // 2 重置并显示热词搜索按钮（按实际数量）
    [self reloadDataHotSearchContentTitle];
    
    // 3 调整布局 显示样式
    if (self.isHotSearchStyleNinePatch)
    {
        // 九宫格
        [self reloadDataHotSearchContentStyleNinePatch:originTop];
    }
    else
    {
        // 根据字符自适应
        [self reloadDataHotSearchContentStyleAuto:originTop];
    }
    
    // 重置主视图高
    UIButton *lastButton = [self.hotSearchButtons objectAtIndex:(self.hotSearchWords.count - 1)];
    self.SYHotSearch_height = lastButton.SYHotSearch_y + lastButton.SYHotSearch_height + (self.isHotSearchStyleNinePatch ? 0.0 : SYHotSearchOrigin);
}

// 按钮背景颜色图标
- (UIImage *)backgroundImageWithIndex:(NSInteger)index colors:(NSArray *)colorArray
{
    UIColor *color = [UIColor clearColor];
    if (colorArray && colorArray.count - 1 >= index)
    {
        color = [colorArray objectAtIndex:index];
    }
    UIImage *image = [UIImage imageWithColor:color size:CGSizeMake(1.0, 1.0)];
    return image;
}

// 刷新数据，重置视图
- (void)reloadData
{
    if (!self.hotSearchWords || 0 == self.hotSearchWords.count)
    {
        return;
    }
    
    // 头视图标签（标题、图标）
    [self reloadDataHotSearchTitle];
    
    CGFloat originYBegin = CGRectGetMinY(self.titleView.frame) + CGRectGetHeight(self.titleView.frame);
    
    // 搜索热词视图
    [self reloadDataHotSearchContent:originYBegin];
}

#pragma mark - 事件

- (void)buttonClick:(UIButton *)button
{
    if (self.hotSearchTextClick)
    {
        NSInteger index = button.tag - SYHotSearchButtonTag;
        NSString *text = [self.hotSearchWords objectAtIndex:index];
        self.hotSearchTextClick(text);
    }
}

#pragma mark - 私有方法

#pragma mark - setter

- (CGFloat)widthNinePatch
{
    return (CGRectGetWidth(self.bounds) / SYHotSearchCountRow);
}

#pragma mark - getter

- (UIView *)titleView
{
    if (_titleView == nil)
    {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(self.bounds), SYHotSearchHeight)];
    }
    
    return _titleView;
}

- (UIImageView *)titleImageView
{
    if (_titleImageView == nil)
    {
        _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SYHotSearchOrigin, SYHotSearchOrigin, (SYHotSearchHeight - SYHotSearchOrigin * 2), (SYHotSearchHeight - SYHotSearchOrigin * 2))];
        _titleImageView.backgroundColor = [UIColor clearColor];
        _titleImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _titleImageView;
}

- (UILabel *)hotSearchLabel
{
    if (_hotSearchLabel == nil)
    {
        _hotSearchLabel = [[UILabel alloc] initWithFrame:CGRectMake(SYHotSearchOrigin, 0.0, (CGRectGetWidth(self.titleView.bounds) - SYHotSearchOrigin * 2), SYHotSearchHeight)];
        _hotSearchLabel.backgroundColor = [UIColor clearColor];
    }
    
    return _hotSearchLabel;
}

- (NSMutableArray *)hotSearchButtons
{
    if (_hotSearchButtons == nil)
    {
        _hotSearchButtons = [[NSMutableArray alloc] init];
    }
    
    return _hotSearchButtons;
}


@end
