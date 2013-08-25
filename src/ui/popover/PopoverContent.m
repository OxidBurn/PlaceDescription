//
//  PopoverContent.m
//  PlaceDescription
//
//  Created by Chaban Nickolay on 8/24/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "PopoverContent.h"
#import <MapKit/MapKit.h>
#import "TTTLocationFormatter.h"

@interface PopoverContent ()

// properties

/** Latitude
 */
@property (nonatomic, retain) UILabel* latitudeLabel;

/** Longtitude
 */
@property (nonatomic, retain) UILabel* longtitudeLabel;

// methods

@end

@implementation PopoverContent

// public properties

// private properties
@synthesize latitudeLabel;
@synthesize longtitudeLabel;


#pragma mark - Initialization -

- (id) init
{
    if (self)
    {
        self.view.backgroundColor = [UIColor colorWithRed: 0.678 green: 0.768 blue: 0.864 alpha: 1.000];;
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
    self.latitudeLabel   = nil;
    self.longtitudeLabel = nil;
    
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
    self.latitudeLabel = [[[UILabel alloc] initWithFrame: CGRectMake(10, 5, 180, 20)] autorelease];
    
    self.latitudeLabel.backgroundColor = [UIColor clearColor];
    self.latitudeLabel.textColor       = [UIColor blackColor];
    self.latitudeLabel.font            = [UIFont fontWithName: @"Helvetica" size: 13];
    
    [self.view addSubview: self.latitudeLabel];
    
    // Longtitude
    self.longtitudeLabel = [[[UILabel alloc] initWithFrame: CGRectMake(10, CGRectGetMaxY(self.latitudeLabel.frame) + 5, 180, 20)] autorelease];
    
    self.longtitudeLabel.backgroundColor = [UIColor clearColor];
    self.longtitudeLabel.textColor       = [UIColor blackColor];
    self.longtitudeLabel.font            = [UIFont fontWithName: @"Helvetica" size: 13];
    
    [self.view addSubview: self.longtitudeLabel];
}


#pragma mark - Public method -

- (void) updateValues: (NSDictionary*) values
{
    CLLocation* location = [[[CLLocation alloc] initWithLatitude: [values[@"Latitude"] doubleValue]
                                                       longitude: [values[@"Longitude"] doubleValue]] autorelease];
    
    NSUInteger degrees = location.coordinate.latitude;
    CGFloat decimal    = fabs(location.coordinate.latitude - degrees);
    NSUInteger minutes = decimal * 60;
    CGFloat seconds    = decimal * 3600 - minutes * 60;
    
    NSString* lat = [NSString stringWithFormat: @"%d° %d' %1.4f\"", degrees, minutes, seconds];
    
    degrees = location.coordinate.longitude;
    decimal = fabs(location.coordinate.longitude - degrees);
    minutes = decimal * 60;
    seconds = decimal * 3600 - minutes * 60;
    
    NSString* longt = [NSString stringWithFormat: @"%d° %d' %1.4f\"", degrees, minutes, seconds];
    
    self.latitudeLabel.text   = [NSString stringWithFormat: @"Latitude: %@", lat];
    self.longtitudeLabel.text = [NSString stringWithFormat: @"Longitude: %@", longt];
}
@end
