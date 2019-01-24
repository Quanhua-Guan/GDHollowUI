//
//  GDViewController.m
//  GDHollowUI
//
//  Created by xinmuheart@163.com on 01/23/2019.
//  Copyright (c) 2019 xinmuheart@163.com. All rights reserved.
//

#import "GDViewController.h"
#import <GDHollowUI/GDHollowButton.h>
#import <GDHollowUI/GDHollowLabel.h>

@interface GDViewController ()

@property (weak, nonatomic) IBOutlet GDHollowButton *button;
@property (weak, nonatomic) IBOutlet GDHollowLabel *label;

@end

@implementation GDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _button.titleLabel.adjustsFontSizeToFitWidth = YES;
    _button.titleLabel.minimumScaleFactor = 0.1;
    _button.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    
    [_button setTitle:@"Button Hollow" forState:UIControlStateNormal];
    _button.titleAlignment = NSTextAlignmentRight;
    
    _label.text = @"Label Hollow";
    
    // mothin effect
    NSNumber *min = @(-30.0);
    NSNumber *max = @(30.0);
    
    UIInterpolatingMotionEffect *xMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"layer.transform.translation.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xMotion.minimumRelativeValue = min;
    xMotion.maximumRelativeValue = max;
    
    UIInterpolatingMotionEffect *yMotion = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"layer.transform.translation.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yMotion.minimumRelativeValue = min;
    yMotion.maximumRelativeValue = max;
    
    UIMotionEffectGroup *motionEffectGroup = [[UIMotionEffectGroup alloc] init];
    motionEffectGroup.motionEffects = @[xMotion, yMotion];
    
    [_button addMotionEffect:motionEffectGroup];
    [_label addMotionEffect:motionEffectGroup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
