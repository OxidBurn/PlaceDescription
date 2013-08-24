//
//  BaseView.m
//  HTML Manager
//
//  Created by Chaban Nickolay on 3/19/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView


#pragma mark - Initialization -

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    
    if (self)
    {
        // Initialization code
    }
    
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark - Memory managment -

- (void) dealloc
{
    [super dealloc];
}

@end
