//
//  UIView+SYHotSearch.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/10/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIView+SYHotSearch.h"

@implementation UIView (SYHotSearch)

- (void)setSYHotSearch_x:(CGFloat)SYHotSearch_x
{
    CGRect frame = self.frame;
    frame.origin.x = SYHotSearch_x;
    self.frame = frame;
}

- (CGFloat)SYHotSearch_x
{
    return self.SYHotSearch_origin.x;
}

- (void)setSYHotSearch_centerX:(CGFloat)SYHotSearch_centerX
{
    CGPoint center = self.center;
    center.x = SYHotSearch_centerX;
    self.center = center;
}

- (CGFloat)SYHotSearch_centerX
{
    return self.center.x;
}

-(void)setSYHotSearch_centerY:(CGFloat)SYHotSearch_centerY
{
    CGPoint center = self.center;
    center.y = SYHotSearch_centerY;
    self.center = center;
}

- (CGFloat)SYHotSearch_centerY
{
    return self.center.y;
}

- (void)setSYHotSearch_y:(CGFloat)SYHotSearch_y
{
    CGRect frame = self.frame;
    frame.origin.y = SYHotSearch_y;
    self.frame = frame;
}

- (CGFloat)SYHotSearch_y
{
    return self.frame.origin.y;
}

- (void)setSYHotSearch_size:(CGSize)SYHotSearch_size
{
    CGRect frame = self.frame;
    frame.size = SYHotSearch_size;
    self.frame = frame;
}

- (CGSize)SYHotSearch_size
{
    return self.frame.size;
}

- (void)setSYHotSearch_height:(CGFloat)SYHotSearch_height
{
    CGRect frame = self.frame;
    frame.size.height = SYHotSearch_height;
    self.frame = frame;
}

- (CGFloat)SYHotSearch_height
{
    return self.frame.size.height;
}

- (void)setSYHotSearch_width:(CGFloat)SYHotSearch_width
{
    CGRect frame = self.frame;
    frame.size.width = SYHotSearch_width;
    self.frame = frame;
}

- (CGFloat)SYHotSearch_width
{
    return self.frame.size.width;
}

- (void)setSYHotSearch_origin:(CGPoint)SYHotSearch_origin
{
    CGRect frame = self.frame;
    frame.origin = SYHotSearch_origin;
    self.frame = frame;
}

- (CGPoint)SYHotSearch_origin
{
    return self.frame.origin;
}

/** 设置锚点 */
- (CGPoint)SYHotSearchAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint oldOrigin = view.frame.origin;
    view.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = view.frame.origin;
    
    CGPoint transition;
    transition.x = newOrigin.x - oldOrigin.x;
    transition.y = newOrigin.y - oldOrigin.y;
    
    view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y);
    return self.layer.anchorPoint;
}

/** 根据手势触摸点修改相应的锚点，就是沿着触摸点做相应的手势操作 */
- (CGPoint)SYHotSearchAnchorPointBaseOnGestureRecognizer:(UIGestureRecognizer *)gr
{
    // 手势为空 直接返回
    if (!gr)
    {
        return CGPointMake(0.5, 0.5);
    }
    
    // 创建锚点
    CGPoint anchorPoint;
    if ([gr isKindOfClass:[UIPinchGestureRecognizer class]])
    {
        // 捏合手势
        if (gr.numberOfTouches == 2)
        {
            // 当触摸开始时，获取两个触摸点
            CGPoint point1 = [gr locationOfTouch:0 inView:gr.view];
            CGPoint point2 = [gr locationOfTouch:1 inView:gr.view];
            anchorPoint.x = (point1.x + point2.x) / 2 / gr.view.SYHotSearch_width;
            anchorPoint.y = (point1.y + point2.y) / 2 / gr.view.SYHotSearch_height;
        }
    }
    else if ([gr isKindOfClass:[UITapGestureRecognizer class]])
    {
        // 点击手势
        // 获取触摸点
        CGPoint point = [gr locationOfTouch:0 inView:gr.view];
        
        CGFloat angle = acosf(gr.view.transform.a);
        if (ABS(asinf(gr.view.transform.b) + M_PI_2) < 0.01)
        {
            angle += M_PI;
        }
        CGFloat width = gr.view.SYHotSearch_width;
        CGFloat height = gr.view.SYHotSearch_height;
        if (ABS(angle - M_PI_2) <= 0.01 || ABS(angle - M_PI_2 * 3) <= 0.01)
        {
            // 旋转角为90°
            // width 和 height 对换
            width = gr.view.SYHotSearch_height;
            height = gr.view.SYHotSearch_width;
        }
        // 如果旋转了
        anchorPoint.x = point.x / width;
        anchorPoint.y = point.y / height;
    };
    return [self SYHotSearchAnchorPoint:anchorPoint forView:self];
}

@end
