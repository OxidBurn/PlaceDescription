//
//  PopoverContent.h
//  PlaceDescription
//
//  Created by Chaban Nickolay on 8/24/13.
//  Copyright (c) 2013 Chaban Nickolay. All rights reserved.
//

#import "BaseViewController.h"

@interface PopoverContent : BaseViewController

// properties

/** Position information
 */
@property (nonatomic, retain) NSDictionary* positionInfo;

// methods

/** Create UI
 */
- (void) createUI;


@end
