//
//  FavoriteDetailViewController.h
//  34VenueMenu
//
//  Created by ian kunneke on 7/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Venue.h"
#import "FavoritesTableViewController.h"

@interface FavoriteDetailViewController : UIViewController

@property (nonatomic) Venue *thatVenue;

@property (nonatomic) id<FavoriteDetailViewControllerDelegate> delegate;

@end
