//
//  FavoritesTableViewController.h
//  34VenueMenu
//
//  Created by ian kunneke on 7/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Venue.h"

@protocol FavoritesTableViewControllerDelegate

- (void) venuesWereFound: (NSArray *) venues;

@end

@protocol FavoriteDetailViewControllerDelegate

- (void)favoriteWasAdded:(Venue *)aFavorite;

@end

@interface FavoritesTableViewController : UITableViewController <FavoritesTableViewControllerDelegate, FavoriteDetailViewControllerDelegate>

@end
