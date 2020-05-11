//
//  XZView.m
//  UIView与CALayer
//
//  Created by Alan on 5/7/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import "XZView.h"
#import "XZLayer.h"

@implementation XZView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    // Drawing code， 绘制的操作， BackingStore(额外的存储区域产于的) -- GPU
    NSLog(@"%s",__func__);
}

+ (Class)layerClass{
    NSLog(@"%s",__func__);

    return [XZLayer class];
}

//实现代理
- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    [self layoutSubviews];
}
//
-(void)layoutSubviews{
    [super layoutSubviews];
}
//创建一个上下文
-(CGContextRef)createContext
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.layer.opaque, self.layer.contentsScale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    return context;
    
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    //绘制操作,绘制完成是设置到context上下文中
    [[UIColor redColor]set];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(self.bounds.size.width/2 -20,self.bounds.size.height /2 -20 , 40, 40)];
    CGContextAddPath(ctx, path.CGPath);
    CGContextFillPath(ctx);
    
}
-(void)displayLayer:(CALayer *)layer
{
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    layer.contents = (__bridge id _Nullable)(image.CGImage);
}

- (void)closeContext{
    //绘制完成后关闭上下文
    UIGraphicsEndImageContext();
}
@end
