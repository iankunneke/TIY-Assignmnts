//
//  LocationsTableViewController.h
//  19-Forecaster
//
//  Created by ian kunneke on 7/9/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityData.h"

@protocol LocationsTableViewControllerDelegate

-(void) cityWasFound: (CityData *) aCity;
-(void) weatherWasFoundForCity: (CityData *) city;

@end

@interface LocationsTableViewController : UITableViewController <LocationsTableViewControllerDelegate>

@end
