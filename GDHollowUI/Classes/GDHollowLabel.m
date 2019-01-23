//
//  GDHollowLabel.m
//  GDHollowUI
//
//  Created by Guan on 2019/1/23.
//

#import "GDHollowLabel.h"


@implementation GDHollowLabel {
    UIColor *_buttonRealBackgroundColor;
    UILabel *_maskLabel;
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
    self.backgroundColor = [UIColor whiteColor];
    _maskLabel = [[UILabel alloc] init];
}

- (UIColor *)backgroundColor {
    return _buttonRealBackgroundColor;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor {
    super.backgroundColor = [UIColor clearColor];
    _buttonRealBackgroundColor = backgroundColor;
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, YES);
    
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1, -1);
    UILabel *label = _maskLabel;
    label.frame = rect;
    label.textAlignment = self.textAlignment;
    label.attributedText = self.attributedText;
    label.font = self.font;
    label.baselineAdjustment = self.baselineAdjustment;
    label.adjustsFontSizeToFitWidth = self.adjustsFontSizeToFitWidth;
    label.minimumScaleFactor = self.minimumScaleFactor;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    
    [label.layer drawInContext:context];
    
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
    
    [_buttonRealBackgroundColor setFill];
    CGContextFillRect(context, rect);
}

@end
