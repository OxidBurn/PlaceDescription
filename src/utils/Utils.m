//
//  APUtils.m
//
//  Created by Andrei Puni on 4/18/13.
//

#import "Utils.h"

static Utils* sharedInstance = nil;
static dispatch_once_t once;

@implementation Utils

// public properties


// private properties


#pragma mark - Shared -

+ (Utils*) shared
{
    dispatch_once(&once, ^ {
        sharedInstance = [[Utils alloc] init];
    });
    
    return sharedInstance;
}


#pragma mark - Initialization -

- (id) init
{
    if (self = [super init])
    {
        
    }
    
    return self;
}


#pragma mark - Public methods -

+ (BOOL) canMakePhoneCalls
{
    static BOOL didCallMethod = NO;
    static BOOL canMakePhoneCalls;
    
    if (didCallMethod == NO)
    {
        didCallMethod = YES;
        canMakePhoneCalls = [[UIApplication sharedApplication] canOpenURL: [NSURL URLWithString: @"tel://"]];
    }
    
    return canMakePhoneCalls;
}

+ (void) findAndResignFirstReponder
{
    UIWindow* keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    [self findAndResignFirstResponderFromView: keyWindow];
}

+ (BOOL) findAndResignFirstResponderFromView: (UIView*) view
{
    if (view.isFirstResponder)
    {
        [view resignFirstResponder];
    
        return YES;
    }
    
    for (UIView* subView in view.subviews)
    {
        if ([self findAndResignFirstResponderFromView: subView])
        {
            return YES;
        }
    }
    
    return NO;
}

+ (void) benchmark: (void(^)(void))block
              name: (NSString*)    name
{
    clock_t start = clock();
    
    block();
    
    double executionTime = (double)(clock()-start) / CLOCKS_PER_SEC;
    
    NSLog(@"%@ duration -> %.3f", name, executionTime);
}

+ (void) benchmark:(void(^)(void)) block
{
    [self benchmark: block name: @"Event"];
}


@end

