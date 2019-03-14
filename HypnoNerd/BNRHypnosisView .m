//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Shafiq Shovo on 13/3/19.
//  Copyright © 2019 Shafiq Shovo. All rights reserved.
//

#import "BNRHypnosisView.h"


@interface BNRHypnosisView ()

@property (strong, nonatomic) UIColor *circleColor;

@end



@implementation BNRHypnosisView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [ super initWithFrame: frame];
    if (self)
    {
        self.backgroundColor = [ UIColor clearColor];
        NSLog(@"Hello world");
        self.circleColor = [ UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
  
    
   
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height/ 2.0;
    
    double val1 = bounds.size.height;
    double val2 = bounds.size.width;
    float radius = (hypot(val1, val2)/2.0 );
    UIBezierPath *path = [ [UIBezierPath alloc] init];
    //[ path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI *2  clockwise:YES];
    for (float currentRadius = radius; currentRadius > 0; currentRadius -=20)
    {
        [ path moveToPoint:CGPointMake(center.x+currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];
        
    }
    
    
    [[ UIColor grayColor] setStroke] ;
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [ path stroke];
    CGRect someRect=CGRectMake(140,335, 100, 150);
    UIImage *logoImage = [ UIImage imageNamed:@"shuvo.png"];
    [logoImage drawInRect:someRect];
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched",self);
    float red = (arc4random()%100)/100.0;
    float green = (arc4random()%100) /100.0;
    float blue = (arc4random()%100)/100.0;
    
    UIColor *randomColor = [UIColor colorWithRed: red
green:green
blue:blue
                                           alpha:1.0];
    NSLog(@"%@ I am here",randomColor);
    self.circleColor = randomColor;
    //NSLOG(@"Done so far");
}
- (void) setCircleColor:(UIColor *)circleColor
{
    
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
