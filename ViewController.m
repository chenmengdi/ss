//
//  ViewController.m
//  比例
//
//  Created by zccl2 on 16/1/11.
//  Copyright © 2016年 Wyg. All rights reserved.
//

#import "ViewController.h"
#import "YGProportionView.h"

@interface ViewController ()
{
    YGProportionView *_proportionView;
    
    CGFloat _progress;
    NSTimer *_timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _proportionView = [[YGProportionView alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
    _proportionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_proportionView];
    
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.07                                                  target:self selector:@selector(getTime) userInfo:nil repeats:YES];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)getTime {
    if (_progress >= 0.9) {
        [_timer setFireDate:[NSDate distantFuture]];
    } else {
        _progress = _progress + 0.9/50;
        [_proportionView setProgress:_progress];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
