//
//  AddDataTableViewController.h
//  HighVoltage
//
//  Created by ian kunneke on 7/24/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoltageTableViewController.h"

@interface AddDataTableViewController : UITableViewController

@property (nonatomic) id<AddDataDelegate> delegate;

@property(nonatomic) NSArray *valueTypes;

@end
