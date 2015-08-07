//
//  Venue.h
//  34VenueMenu
//
//  Created by ian kunneke on 8/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Venue : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *formattedPhone;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *city;
@property (nonatomic) NSString *state;
@property (nonatomic) NSString *category;
@property (nonatomic) NSString *url;
@property (nonatomic) NSString *zip;
@property (assign) float latitude;
@property (assign) float longitude;
@property (assign) BOOL favorite;


@end
