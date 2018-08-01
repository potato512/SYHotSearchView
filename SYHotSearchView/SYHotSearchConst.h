//
//  SYHotSearchConst.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/10/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+SYHotSearch.h"
#import "UIColor+SYHotSearch.h"
#import "UIImage+SYHotSearch.h"


/// 默认间距
UIKIT_EXTERN CGFloat   const SYHotSearchOrigin;
/// 默认高度
UIKIT_EXTERN CGFloat   const SYHotSearchHeight;
/// 默认实例化最多标签数量
UIKIT_EXTERN NSInteger const SYHotSearchCountMax;
/// 按钮tag值
UIKIT_EXTERN NSInteger const SYHotSearchButtonTag;
/// 九宫格数量
UIKIT_EXTERN NSInteger const SYHotSearchCountRow;
/// 按钮默认高度
UIKIT_EXTERN CGFloat   const SYHotSearchButtonHeight;


/// 颜色
#define SYHotSearchColor(r,g,b) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:1.0]
#define SYHotSearchRandomColor  SYHotSearchColor(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))


/// 日志输出
#ifdef DEBUG
#define SYHotSearchLog(...) NSLog(__VA_ARGS__)
#else
#define SYHotSearchLog(...)
#endif


/// 屏幕宽高
#define SYHotSearchScreenWidth [UIScreen mainScreen].bounds.size.width
#define SYHotSearchScreenHeight [UIScreen mainScreen].bounds.size.height
/// 屏幕Size
#define SYHotSearchScreenSize CGSizeMake(SYHotSearchScreenWidth, SYHotSearchScreenHeight)





