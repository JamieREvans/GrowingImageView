//
//  GIVViewController.m
//  GrowingImageView
//
//  Created by JamieREvans on 07/30/2015.
//  Copyright (c) 2015 JamieREvans. All rights reserved.
//

#import "GIVViewController.h"
#import "GrowingImageView.h"

@interface GIVViewController ()

@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) GrowingImageView *growingImageView;

@end

@implementation GIVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.scrollView setAlwaysBounceVertical:YES];
    [self.view addSubview:self.scrollView];

    self.growingImageView = [[GrowingImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(self.view.frame), 180.0)];
    [self.growingImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.growingImageView setGrowthType:GrowthTypeHybrid];
    [self.growingImageView setImage:[UIImage imageNamed:@"ikpnbmQ"]];
    [self.scrollView addSubview:self.growingImageView];

    [self.scrollView setDelegate:self.growingImageView];
}

@end
