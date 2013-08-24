//
//  PopoverContent.m
//  PlaceDescription
//
//  Created by Chaban Nickolay on 8/24/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "PopoverContent.h"

@interface PopoverContent ()

// properties

/** Latitude
 */
@property (nonatomic, retain) UILabel* latitude;

/** Longtitude
 */
@property (nonatomic, retain) UILabel* longtitude;

// methods

@end

@implementation PopoverContent

// public properties
@synthesize positionInfo;

// private properties
@synthesize latitude;
@synthesize longtitude;


#pragma mark - Initialization -

- (id) init
{
    if (self)
    {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}


#pragma mark - View -

- (void) viewDidLoad
{
    [super viewDidLoad];
    
}


#pragma mark - Memory managment -

- (void) dealloc
{
    self.positionInfo = nil;
    self.latitude     = nil;
    self.longtitude   = nil;
    
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
    // Latitue
    self.latitude = [[[UILabel alloc] initWithFrame: CGRectMake(10, 5, 180, 20)] autorelease];
    
    self.latitude.backgroundColor = [UIColor clearColor];
    self.latitude.textColor       = [UIColor blackColor];
    self.latitude.text            = [NSString stringWithFormat: @"Latitude: %@", self.positionInfo[@"latitude"]];
    
    [self.view addSubview: self.latitude];
    
    // Longtitude
    self.longtitude = [[[UILabel alloc] initWithFrame: CGRectMake(10, CGRectGetMaxY(self.latitude.frame) + 5, 180, 20)] autorelease];
    
    self.longtitude.backgroundColor = [UIColor clearColor];
    self.longtitude.textColor       = [UIColor blackColor];
    self.longtitude.text            = [NSString stringWithFormat: @"Longtitude: %@", self.positionInfo[@"longtitude"]];
    
    [self.view addSubview: self.longtitude];
}

@end