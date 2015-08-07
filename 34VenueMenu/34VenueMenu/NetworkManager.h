//
//  NetworkManager.h
//  34VenueMenu
//
//  Created by ian kunneke on 8/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoritesTableViewController.h"

@import CoreLocation;

@interface NetworkManager : NSObject

@property (nonatomic) id<FavoritesTableViewControllerDelegate> delegate;

+ (NetworkManager *) sharedNetworkManager;
- (void) findVenuesForCoordinates:(CLLocationCoordinate2D) coordinate andSearchTerm:(NSString *) searchTerm;

@end
