//
//  MyStopwatch.h
//  ObjectiveStopwatch
//
//  Created by ian kunneke on 7/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyStopwatch : NSObject

-(void) start;
-(void) stop;
-(BOOL) isRunning;
-(NSString *) elapsedTimeAsString;

@end
