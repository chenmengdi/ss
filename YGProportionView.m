//
//  YGProportionView.m
//  比例
//
//  Created by zccl2 on 16/1/11.
//  Copyright © 2016年 Wyg. All rights reserved.
//

#import "YGProportionView.h"

#define lineWidth 10

@interface YGProportionView ()
{
    UILabel *_progressLabel;
    CGFloat _progress;
    CALayer *_layer;
}
@end

@implementation YGProportionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        _progressLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [_progressLabel setTextAlignment:NSTextAlignmentCenter];
        [_progressLabel setBackgroundColor:[UIColor clearColor]];
        [_progressLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [self addSubview:_progressLabel];
        
        _layer = [CALayer layer];
        _layer.bounds = CGRectMake(0, 0, 2, self.bounds.size.width/2-5);
        _layer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2);
        _layer.anchorPoint = CGPointMake( 0.5, 0.8);
        [_layer setBackgroundColor:[UIColor greenColor].CGColor];
        [self.layer addSublayer:_layer];
        _layer.transform = CATransform3DRotate(_layer.transform, M_PI*3/2, 0, 0, 1);
    }
    return self;
}

- (void)setProgress:(CGFloat)progress {
    /**< 赋值*/
    _progress =progress;
    _layer.transform = CATransform3DRotate(_layer.transform, M_PI*0.91/50, 0, 0, 1);
    /**< 设置_progressLabel的显示内容*/
    [_progressLabel setText:[NSString stringWithFormat:@"%.f%%",progress*100]];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    /**< 画圆*/
    UIBezierPath *backpath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
                                                            radius:self.bounds.size.width/2-lineWidth/2
                                                        startAngle:M_PI
                                                          endAngle:M_PI*2
                                                         clockwise:YES];
    /**< 路径宽度*/
    [backpath setLineWidth:lineWidth];
    /**< 画笔颜色*/
    [[UIColor redColor] setStroke];
    [backpath stroke];
        /**< 画圆*/
        UIBezierPath *forepath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
                                                                radius:self.bounds.size.width/2-lineWidth/2
                                                            startAngle:M_PI
                                                              endAngle:M_PI+M_PI*_progress
                                                             clockwise:YES];
        /**< 路径宽度*/
        [forepath setLineWidth:lineWidth];
        /**< 画笔颜色*/
        [[UIColor greenColor] setStroke];
        [forepath stroke];
}

@end
