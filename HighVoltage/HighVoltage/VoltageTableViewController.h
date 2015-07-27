//
//  VoltageTableViewController.h
//  HighVoltage
//
//  Created by ian kunneke on 7/24/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddDataDelegate

- (void)valueTypeWasChosen: (NSString *) chosenValueType;

@end

@interface VoltageTableViewController : UITableViewController

@end
