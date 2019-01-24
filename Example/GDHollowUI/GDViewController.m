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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
