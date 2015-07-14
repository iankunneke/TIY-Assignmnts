//
//  CityData.h
//  19-Forecaster
//
//  Created by ian kunneke on 7/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityData : NSObject

@property (nonatomic) NSString *theCity;
@property (nonatomic) NSString *theState;
@property (assign) double longitude;
@property (assign) double latitude;
@property (nonatomic) NSString *zip;

- (BOOL) parseCoordinateInfo: (NSDictionary *) mapsDictionary;

@end
