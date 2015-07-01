//
//  CounterTableViewCell.h
//  CountOnMe
//
//  Created by ian kunneke on 6/30/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIStepper *countStepper;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UITextField *counterTextField;

- (IBAction)StepperAction:(UIStepper *)sender;



@end
