//
//  RootView.m
//  PlaceDescription
//
//  Created by Chaban Nickolay on 8/24/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "RootView.h"
#import "PopoverContent.h"
#import <ArcGIS/AGSMapView.h>
#import "AGSPoint+Coordinate.h"

@interface RootView() <AGSMapViewTouchDelegate, AGSMapViewCalloutDelegate, AGSMapViewLayerDelegate, AGSMapServiceInfoDelegate, UIPopoverControllerDelegate>

// properties

/** Map view
 */
@property (nonatomic, retain) AGSMapView* mapView;

/** Popover controller content
 */
@property (nonatomic, retain) PopoverContent* popoverContent;

/** Popover
 */
@property (nonatomic, retain) UIPopoverController* popoper;

/** Switcher for map view
 */
@property (nonatomic, retain) UISegmentedControl* segmentControl;

/** Stepper control
 */
@property (nonatomic, retain) UIStepper* stepper;

/** Zoom value
 */
@property (nonatomic, assign) CGFloat zoomValue;

// methods

/** Create UI
 */
- (void) createUI;

/** Setup map view
 */
- (void) setupMapView;

/** Setup popover
 */
- (void) setupPopover;

/** Show popover
 */
- (void) showPopover: (CGPoint)       point
            withInfo: (NSDictionary*) dictionary;

/** Setup segment control
 */
- (void) setupSegmentControl;

@end

@implementation RootView

// public properties


// private properties
@synthesize mapView;
@synthesize popoverContent;
@synthesize popoper;
@synthesize segmentControl;
@synthesize stepper;
@synthesize zoomValue;


#pragma mark - Initialization -

- (id) initWithFrame: (CGRect) frame
{
    if (self  = [super initWithFrame: frame])
    {
        [self createUI];
    }
    
    return self;
}


#pragma mark - Memory managment -

- (void) dealloc
{
    self.mapView        = nil;
    self.popoverContent = nil;
    self.popoper        = nil;
    self.segmentControl = nil;
    self.stepper        = nil;
    
    [super dealloc];
}


#pragma mark - Layout -

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    self.mapView.frame        = self.bounds;
    self.segmentControl.frame = CGRectMake((self.bounds.size.width - 220) / 2, self.bounds.size.height - 60, 220, 30);
    self.stepper.frame        = CGRectMake(10, self.bounds.size.height - 60, 100, 30);
}


#pragma mark - UI -

- (void) createUI
{
    self.backgroundColor = [UIColor whiteColor];
    
    // Setup map view
    [self setupMapView];
    
    // Setup popover
    [self setupPopover];
    
    // Setup segment control
    [self setupSegmentControl];
    
    // Setup stepper
    [self setupStepper];
}

- (void) setupMapView
{
    // Base url
    NSURL* url = [NSURL URLWithString: @"http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer"];
    
    // Base tiled layer
    AGSTiledMapServiceLayer* tiledLayer = [AGSTiledMapServiceLayer tiledMapServiceLayerWithURL: url];
    
    // Map view
    self.mapView = [[[AGSMapView alloc] initWithFrame: self.bounds] autorelease];
    
    self.mapView.layerDelegate    = self;
    self.mapView.touchDelegate    = self;
    self.mapView.clipsToBounds    = YES;
    self.mapView.autoresizingMask = (UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    
    [self.mapView addMapLayer: tiledLayer
                     withName: @"Tiled Layer"];
    
    self.mapView.locationDisplay.autoPanMode        = AGSLocationDisplayAutoPanModeDefault;
    self.mapView.locationDisplay.wanderExtentFactor = 0.5;
    
    [self addSubview: self.mapView];
}

- (void) setupPopover
{
    // Popover content
    self.popoverContent = [[[PopoverContent alloc] init] autorelease];
    
    [self.popoverContent createUI];
    
    
    // Popover
    self.popoper = [[[UIPopoverController alloc] initWithContentViewController: self.popoverContent] autorelease];
    
    self.popoper.popoverContentSize = CGSizeMake(200, 60);
    self.popoper.delegate           = self;
}

- (void) setupSegmentControl
{
    self.segmentControl = [[[UISegmentedControl alloc] initWithItems: @[@"Topo", @"Satellite"]] autorelease];
    
    self.segmentControl.frame                 = CGRectMake((self.bounds.size.width - 220) / 2, self.bounds.size.height - 60, 220, 30);
    self.segmentControl.segmentedControlStyle = UISegmentedControlStyleBar;
    self.segmentControl.selectedSegmentIndex  = 0;
    
    [self.segmentControl addTarget: self
                            action: @selector(didChangeSegmentControl:)
                  forControlEvents: UIControlEventValueChanged];
    
    [self addSubview: self.segmentControl];
}

- (void) setupStepper
{
    self.zoomValue = 20;
    
    self.stepper = [[[UIStepper alloc] initWithFrame: CGRectMake(10, self.bounds.size.height - 60, 100, 30)] autorelease];
    
    self.stepper.minimumValue = 0;
    self.stepper.maximumValue = 40;
    self.stepper.value        = self.zoomValue;
    
    [self.stepper addTarget: self
                     action: @selector(onStepper:)
           forControlEvents: UIControlEventValueChanged];
    
    [self addSubview: self.stepper];
}


- (void) showPopover: (CGPoint)       point
            withInfo: (NSDictionary*) dictionary
{
    [self.popoverContent updateValues: dictionary];
    
    [self.popoper presentPopoverFromRect: CGRectMake(point.x, point.y, 10, 10)
                                  inView: self.mapView
                permittedArrowDirections: UIPopoverArrowDirectionAny
                                animated: YES];
}


#pragma mark - Map view layer delegate -

- (void) mapViewDidLoad: (AGSMapView*) mapView
{
    [self.mapView.locationDisplay startDataSource];
}


#pragma mark - Map view touch delegate methods -

- (BOOL)           mapView: (AGSMapView*) mapView
 shouldProcessClickAtPoint: (CGPoint)     screen
                  mapPoint: (AGSPoint*)   mappoint
{
    return YES;
}

- (void)      mapView: (AGSMapView*)   mapView
 didTapAndHoldAtPoint: (CGPoint)       screen
             mapPoint: (AGSPoint*)     mappoint
             graphics: (NSDictionary*) graphics
{   
    [self showPopover: screen
             withInfo: @{@"Latitude" : [NSNumber numberWithDouble: mappoint.latitude],
                         @"Longitude" : [NSNumber numberWithDouble: mappoint.longitude]}];
}


#pragma mark - UIPopover controller delegate methods -

- (void) popoverControllerDidDismissPopover: (UIPopoverController*) popoverController
{
    
}


#pragma mark - Segmented control changed value -

- (void) didChangeSegmentControl: (UISegmentedControl*) control
{
    NSURL* basemapURL;
    
    switch (control.selectedSegmentIndex)
    {
        case 0:
        {
            basemapURL = [NSURL URLWithString: @"http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer"];
        }
            break;
            
        case 1:
        {
            basemapURL = [NSURL URLWithString: @"http://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer"];
        }
            break;
    }
    
    //remove existing basemap layer
    [self.mapView removeMapLayerWithName: @"Tiled Layer"];
    
    //add new layer
    AGSTiledMapServiceLayer* newBasemapLayer = [AGSTiledMapServiceLayer tiledMapServiceLayerWithURL: basemapURL];
    
    newBasemapLayer.name = @"Tiled Layer";
    
    [self.mapView insertMapLayer: newBasemapLayer
                         atIndex: 0];
}


#pragma mark - Stepper value -

- (void) onStepper: (UIStepper*) control
{
    if (control.value > self.zoomValue)
        [self.mapView zoomIn: YES];
    else
        [self.mapView zoomOut: YES];
    
    self.zoomValue = control.value;
}


@end
