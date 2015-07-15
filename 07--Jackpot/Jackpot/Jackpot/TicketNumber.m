//
//  TicketNumber.m
//  Jackpot
//
//  Created by ian kunneke on 6/23/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TicketNumber.h"

@interface TicketNumber ()


@end

@implementation TicketNumber

+ (instancetype)ticketUsingPicker
{
    TicketNumber *aTicket = [[TicketNumber alloc] init];
    for (int i=0; i < 6; i++)
    {
        [aTicket createNumbers];
    }
    return aTicket;
}

- (instancetype) init
{
    self = [super init];
    if (self)
    {
        _choices = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void) createNumbers
{
    int aPick = arc4random() % 53 +1;
    NSNumber *anInt = [NSNumber numberWithInt:aPick];
    [_choices addObject:anInt];
}



@end
