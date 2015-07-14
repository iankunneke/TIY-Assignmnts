//
//  CityData.m
//  19-Forecaster
//
//  Created by ian kunneke on 7/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "CityData.h"

@implementation CityData

- (BOOL) parseCoordinateInfo:(NSDictionary *)mapsDictionary
{
    BOOL returnValue = NO;
    if (mapsDictionary)
    {
        returnValue = YES;
        NSArray *results = mapsDictionary[@"results"];
        NSDictionary *resultsDictionary = results[0];
        NSString *formattedAddress = resultsDictionary[@"formatted_address"];
        NSArray *addressComponents = [formattedAddress componentsSeparatedByString:@", "];
        self.theCity = addressComponents [0];
        self.theState = [addressComponents [1] componentsSeparatedByString:@" "][0];
        NSDictionary *geometry = resultsDictionary[@"geometry"];
        NSDictionary *location = geometry [@"location"];
        self.latitude = [location [@"lat"] doubleValue];
        self.longitude = [location [@"lng"] doubleValue];
        
    }
    return returnValue;
}

@end
