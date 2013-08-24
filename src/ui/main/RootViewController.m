//
//  RootViewController.m
//  PlaceDescription
//
//  Created by Chaban Nickolay on 8/24/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "RootViewController.h"
#import "RootView.h"

@interface RootViewController ()

// properties

/** Root view
 */
@property (nonatomic, retain) RootView* rootView;

// methods

/** Create UI
 */
- (void) createUI;

@end

@implementation RootViewController

// public properties


// private properties
@synthesize rootView;


#pragma mark - Initialization -

- (id) init
{
    if (self = [super init])
    {
        
    }
    
    return self;
}


#pragma mark - View -

- (void) viewDidLoad
{
    [super viewDidLoad];
}

- (void) loadView
{
    [super loadView];
    
    self.navigationController.navigationBarHidden = YES;
    
    [self createUI];
}


#pragma mark - Memory managment -

- (void) dealloc
{
    self.rootView = nil;
    
    [super dealloc];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    DbgLog(@"Memory warning: %@", NSStringFromSelector(_cmd));
}


#pragma mark - UI -

- (void) createUI
{
    self.rootView = [[[RootView alloc] initWithFrame: self.view.bounds] autorelease];
    
    self.rootView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    
    self.view = self.rootView;
}

@end
