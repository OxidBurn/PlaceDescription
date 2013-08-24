//
//  BaseNavigationController.m
//  HTML Manager
//
//  Created by Chaban Nickolay on 3/21/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) toInterfaceOrientation
{
    return [self.topViewController shouldAutorotateToInterfaceOrientation: toInterfaceOrientation];
}

- (NSUInteger) supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

- (BOOL) shouldAutorotate
{
    return YES;
}

@end
