//
//  AGSPoint+Coordinate.h
//  PlaceDescription
//
//  Created by Chaban Nickolay on 8/24/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import <ArcGIS/ArcGIS.h>

@interface AGSPoint (Coordinate)

// Read the Lat and Lon values from any point, regardless of its internal spatial reference.
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

- (AGSPoint*) getWGS84Point;

@end
