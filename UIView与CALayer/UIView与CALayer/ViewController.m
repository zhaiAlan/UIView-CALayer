//
//  ViewController.m
//  UIView与CALayer
//
//  Created by Alan on 5/7/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import "ViewController.h"
#import "XZView.h"

@interface ViewController ()
@property (nonatomic, strong) XZView *customView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.customView];
    NSLog(@"123");

    // Do any additional setup after loading the view.
}
- (XZView *)customView{
    if (!_customView) {
        _customView = [XZView new];
        _customView.frame = CGRectMake(100, 100, 200, 200);
        _customView.backgroundColor = [UIColor blackColor];
    }
    return _customView;
}

@end
