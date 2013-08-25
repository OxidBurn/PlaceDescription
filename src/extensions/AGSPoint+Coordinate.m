//
//  AGSPoint+Coordinate.m
//  PlaceDescription
//
//  Created by Chaban Nickolay on 8/24/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "AGSPoint+Coordinate.h"

@implementation AGSPoint (Coordinate)

- (double) latitude
{
	AGSPoint* geoPt = [self getWGS84Point];
	return geoPt.y;
}

- (double) longitude
{
	AGSPoint* geoPt = [self getWGS84Point];
	return geoPt.x;
}

- (AGSPoint*) getWGS84Point
{
    if ([self.spatialReference isEqualToSpatialReference: [AGSSpatialReference wgs84SpatialReference]])
    {
        return self;
    }
    else
    {
        @try
        {
            return (AGSPoint*)[[AGSGeometryEngine defaultGeometryEngine] projectGeometry: self
                                                                      toSpatialReference: [AGSSpatialReference wgs84SpatialReference]];
        }
        @catch (NSException* e)
        {
            NSLog(@"Error getting WGS84 Point from %@: %@",self, e);
        }
    }
}
@end
