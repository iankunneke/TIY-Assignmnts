//
//  TableViewController.h
//  YumOrDumb
//
//  Created by ian kunneke on 6/28/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableViewController.h"

@protocol RestaurantDetailDelegate

- (void) restaurantWasChosen:(NSInteger *)restaurantRating;

@end

@interface ListTableViewController : UITableViewController <RestaurantDetailDelegate>

@end
