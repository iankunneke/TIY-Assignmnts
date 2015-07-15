//
//  TicketNumber.h
//  Jackpot
//
//  Created by ian kunneke on 6/23/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicketNumber : NSObject

@property (nonatomic) NSMutableArray *choices;

+ (instancetype)ticketUsingPicker;

@end





// Storyboard Tasks

//Add a view to the storyboard that shows an interface to pick our winning numbers.

 //Add a UIBarButtonItem to the left side of the navigation bar in the root view to allow the user to show the winning number view from the step above.

 //Add a button to the winning number view that determines which tickets are winners.

//Code Tasks

//Create a custom View Controller class to back up the view that was added to the storyboard.

//Update the Ticket model to include additional state items for tracking the winning status and the dollar amount of winnings.

 //Create a "checkingWinningNumber" type method that iterates over your tickets array and determines which tickets are winners. Follow the rules above about how much each winning type earns.

 //Update the cell handling methods in the LottoNumbersTableViewController to ensure that winning tickets are prominently displayed to the user and the winning amount for that ticket is visible.
