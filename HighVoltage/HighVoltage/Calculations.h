//
//  Calculations.h
//  HighVoltage
//
//  Created by ian kunneke on 7/27/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculations : NSObject

@property (assign) BOOL allValuesFound;

@property (strong, nonatomic) NSString *ampString;
@property (strong, nonatomic) NSString *ohmsString;
@property(strong, nonatomic) NSString *voltsString;
@property(strong, nonatomic) NSString *wattsString;

//@property (strong, nonatomic) id<CalculationsDelegate> delegate;

- (void)findOtherValuesIfPossible;

@end
