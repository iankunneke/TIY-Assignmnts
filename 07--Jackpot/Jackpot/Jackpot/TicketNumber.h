//
//  TicketNumber.h
//  Jackpot
//
//  Created by ian kunneke on 6/23/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicketNumber : NSObject

@property (nonatomic) NSMutableArray *choices;

+ (instancetype)ticketUsingPicker;

@end
