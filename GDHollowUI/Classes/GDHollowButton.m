//
//  GDHollowButton.m
//  GDHollowUI
//
//  Created by Guan on 2019/1/23.
//

#import "GDHollowButton.h"

@interface GDHollowButton ()

@end

@implementation GDHollowButton {
    UIColor *buttonRealBackgroundColor;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.layer.cornerRadius = 5.0f;
    self.titleLabel.hidden = YES;
    self.backgroundColor = [UIColor whiteColor];
    [self setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
}

- (UIColor *)backgroundColor {
    return buttonRealBackgroundColor;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor {
    super.backgroundColor = [UIColor clearColor];
    buttonRealBackgroundColor = backgroundColor;
    [self setNeedsDisplay];
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self setNeedsDisplay];
}

- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state {
    [super setAttributedTitle:title forState:state];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, YES);
    
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1, -1);
    UILabel *label = self.titleLabel;
    
    if (![label.attributedText isEqual:self.currentAttributedTitle]) {
        label.attributedText = self.currentAttributedTitle;
    }
    
    if (![label.text isEqual:self.currentTitle]) {
        label.text = self.currentTitle;
        label.textColor = [UIColor whiteColor];
    }
    
    label.hidden = NO;
    label.alpha = 1;
    label.frame = self.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    
    [label.layer drawInContext:context];
    
    [self setTitleColor:UIColor.clearColor forState:UIControlStateNormal];
    self.titleLabel.backgroundColor = UIColor.clearColor;
    
    CGContextRestoreGState(context);
    
    CGImageRef maskImageRef = CGBitmapContextCreateImage(context);
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskImageRef),
                                        CGImageGetHeight(maskImageRef),
                                        CGImageGetBitsPerComponent(maskImageRef),
                                        CGImageGetBitsPerPixel(maskImageRef),
                                        CGImageGetBytesPerRow(maskImageRef),
                                        CGImageGetDataProvider(maskImageRef), NULL, false);
    CGImageRelease(maskImageRef);
    
    CGContextClearRect(context, rect);
    
    CGContextClipToMask(context, rect, mask);
    CGImageRelease(mask);
    
    [buttonRealBackgroundColor setFill];
    CGContextFillRect(context, rect);
}

@end
