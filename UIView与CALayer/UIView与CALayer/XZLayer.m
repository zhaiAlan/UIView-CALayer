//
//  XZLayer.m
//  UIView与CALayer
//
//  Created by Alan on 5/7/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import "XZLayer.h"

@implementation XZLayer
//布局计算
- (void)layoutSublayers{
    //判断当前代理是否实现了layoutSublayersOfLayer，如果实现，进行调用
    if (self.delegate && [self.delegate respondsToSelector:@selector(layoutSublayersOfLayer:)]) {
        [self.delegate layoutSublayersOfLayer:self];
    }else//没有实现，调用自己的布局引擎进行布局
    {
        [super layoutSublayers];
    }
}

 /* Reload the content of this layer. Calls the -drawInContext: method
 * then updates the `contents' property of the layer. Typically this is
 * not called directly.
  内部会调用drawInContext 方法
  */
-(void)display{
    CGContextRef context = (__bridge CGContextRef)([self.delegate performSelector:@selector(createContext)]);
    [self drawInContext:context];
    
    //将context layer.content(位图)设置给图片
    [self.delegate displayLayer:self];
    
    //关闭上下文
    [self.delegate performSelector:@selector(closeContext)];
}

@end
