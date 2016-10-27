//
//  UIView+SYHotSearch.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/10/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SYHotSearch)

@property (nonatomic, assign) CGFloat SYHotSearch_x;
@property (nonatomic, assign) CGFloat SYHotSearch_y;
@property (nonatomic, assign) CGFloat SYHotSearch_centerX;
@property (nonatomic, assign) CGFloat SYHotSearch_centerY;
@property (nonatomic, assign) CGFloat SYHotSearch_width;
@property (nonatomic, assign) CGFloat SYHotSearch_height;
@property (nonatomic, assign) CGSize  SYHotSearch_size;
@property (nonatomic, assign) CGPoint SYHotSearch_origin;

/** 设置锚点 */
- (CGPoint)SYHotSearchAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view;

/** 根据手势触摸点修改相应的锚点，就是沿着触摸点对self做相应的手势操作 */
- (CGPoint)SYHotSearchAnchorPointBaseOnGestureRecognizer:(UIGestureRecognizer *)gr;

@end
