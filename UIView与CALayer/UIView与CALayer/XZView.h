//
//  XZView.h
//  UIView与CALayer
//
//  Created by Alan on 5/7/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XZView : UIView
//创建上下文
-(CGContextRef)createContext;
//关闭上下文
- (void)closeContext;

@end

NS_ASSUME_NONNULL_END
