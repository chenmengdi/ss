//
//  YGProportionView.m
//  比例
//
//  Created by zccl2 on 16/1/11.
//  Copyright © 2016年 Wyg. All rights reserved.
//

#import "YGProportionView.h"

#define lineWidth 10
#define kImageWH 50
#define kViewW self.bounds.size.width
#define kViewH self.bounds.size.height

@interface YGProportionView ()
{
    UILabel *_progressLabel;
    CGFloat _progress;
    CGFloat _redprogress;
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
        _layer.frame = CGRectMake(145, 0, 10, 10);
//        _layer.anchorPoint = CGPointMake( self.frame.size.width/2, self.frame.size.height/2);
        [_layer setBackgroundColor:[UIColor greenColor].CGColor];
        [self.layer addSublayer:_layer];
//        _layer.transform = CATransform3DRotate(_layer.transform, M_PI*0.91/50, 0, 0, 0);
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
//                                                            radius:self.bounds.size.width/2-lineWidth/2-20
//                                                        startAngle:M_PI
//                                                          endAngle:M_PI*2
//                                                         clockwise:YES];
//        CGMutablePathRef path = CGPathCreateWithRoundedRect(<#CGRect rect#>, <#CGFloat cornerWidth#>, <#CGFloat cornerHeight#>, <#const CGAffineTransform * _Nullable transform#>);
//        CGPathMoveToPoint(path, nil, kViewW/2, kImageWH/2);
//        CGPathAddCurveToPoint(path, nil, kViewW/2-200, kViewH/3, kViewW/2+360, kViewH*2/3, kViewW/2-20, kViewH);
        CGMutablePathRef path = CGPathCreateMutable();
        //2.b.2把圆的绘图信息添加到路径里
        CGPathAddEllipseInRect(path, NULL, CGRectMake(140, 0, 150, 150));
//        CGAffineTransform transform = CGAffineTransformMakeTranslation(50, 50);
//        //创建CGMutablePathRef
//        CGMutablePathRef path = CGPathCreateMutable();
//        CGPathAddArc(path, &transform, 50, 50, 50, 0, 1.5 * M_PI, NO);
//        CGPathMoveToPoint(path, &transform, 50, 0);
//        CGPathAddLineToPoint(path, &transform, 50, 50);
//        CGPathAddLineToPoint(path, &transform, 100, 50);
        animation.path = path;
        [_layer addAnimation:animation forKey:nil];
    }
    return self;
}

- (void)setProgress:(CGFloat)progress redProgress:(CGFloat)redprogress{
    /**< 赋值*/
    _progress = progress;
    _redprogress = redprogress;
//    _layer.transform = CATransform3DRotate(_layer.transform, M_PI*0.91/50, 0, 0, 1);
    /**< 设置_progressLabel的显示内容*/
    [_progressLabel setText:[NSString stringWithFormat:@"%.f%%",progress*100]];
    
    
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    /**< 画圆*/
    UIBezierPath *backpath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
                                                            radius:self.bounds.size.width/2-lineWidth/2-20
                                                        startAngle:0
                                                          endAngle:M_PI*2
                                                         clockwise:YES];
    /**< 路径宽度*/
    [backpath setLineWidth:lineWidth];
    /**< 画笔颜色*/
    [[UIColor blackColor] setStroke];
    [backpath stroke];
    /**< 画圆*/
    UIBezierPath *forepath1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
                                                             radius:self.bounds.size.width/2-lineWidth/2-10
                                                         startAngle:M_PI
                                                           endAngle:M_PI+M_PI*_redprogress
                                                          clockwise:YES];
    /**< 路径宽度*/
    [forepath1 setLineWidth:2];
    /**< 画笔颜色*/
    [[UIColor redColor] setStroke];
    [forepath1 stroke];
        /**< 画圆*/
        UIBezierPath *forepath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
                                                                radius:self.bounds.size.width/2-lineWidth/2
                                                            startAngle:M_PI
                                                              endAngle:M_PI+M_PI*_progress
                                                             clockwise:YES];
        /**< 路径宽度*/
        [forepath setLineWidth:2];
        /**< 画笔颜色*/
        [[UIColor greenColor] setStroke];
        [forepath stroke];
}

@end
