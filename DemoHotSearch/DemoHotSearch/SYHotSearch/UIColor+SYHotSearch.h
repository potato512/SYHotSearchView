//
//  UIColor+SYHotSearch.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/10/26.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SYHotSearch)

/** 根据16进制字符串返回对应颜色 */
+ (UIColor *)SYHotSearchColorWithHexString:(NSString *)hexString;

/** 根据16进制字符串返回对应颜色 带透明参数 */
+ (UIColor *)SYHotSearchColorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
