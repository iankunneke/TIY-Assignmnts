//
//  MyStopwatch.m
//  ObjectiveStopwatch
//
//  Created by ian kunneke on 7/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "MyStopwatch.h"
@interface MyStopwatch()
{
    NSDate *startTime;
}
@property (nonatomic, assign) NSTimeInterval elapsedTime;
@end

@implementation MyStopwatch

-(NSTimeInterval) elapsedTime
{
    if (startTime)
    {
        return -startTime.timeIntervalSinceNow;
    }
    else
    {
        return 0;
    }
}

-(void) start
{
    startTime = [NSDate date];
}
-(void) stop
{
    startTime = nil;
}
-(BOOL) isRunning
{
    return startTime != nil;
}

-(NSString *) elapsedTimeAsString
{
    return [NSString stringWithFormat:@"%02d:%02d.%d",(int) self.elapsedTime/60, (int) self.elapsedTime%60, (int) (self.elapsedTime*10)%10];
}

@end
