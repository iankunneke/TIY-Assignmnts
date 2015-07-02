//
//  Teams.h
//  SportsTeams
//
//  Created by ian kunneke on 7/1/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teams : NSObject

@property (nonatomic) NSString *teamName;
@property (nonatomic) NSString *sport;
@property (nonatomic) NSString *bestPlayer;
@property (assign) int wins;
@property (assign) int loses;


@end
