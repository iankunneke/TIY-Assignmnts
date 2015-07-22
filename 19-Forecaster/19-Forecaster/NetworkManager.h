//
//  NetworkManager.h
//  19-Forecaster
//
//  Created by ian kunneke on 7/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationsTableViewController.h"

@interface NetworkManager : NSObject

@property (nonatomic) id<LocationsTableViewControllerDelegate> delegate;

+ (NetworkManager *) sharedNetworkManager;
- (void) findCoordinatesForCity:(CityData *) theCityData;
- (void) fetchCurrentWeatherForCity: (CityData *) theCityData;

@end
