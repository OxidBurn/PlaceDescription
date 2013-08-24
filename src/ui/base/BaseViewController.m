//
//  BaseViewController.m
//  HTML Manager
//
//  Created by Chaban Nickolay on 3/19/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id) init
{
    self = [super init];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
	
}

- (void) loadView
{
    [super loadView];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) toInterfaceOrientation
{
    return YES;
}

- (BOOL) shouldAutorotate
{
    return YES;
}

- (NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

#pragma mark - Memory managment -

- (void) dealloc
{
    
    [super dealloc];
}

@end
