//
//  main.m
//  Objects & Collections
//
//  Created by Ben Gohlke on 6/23/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //
        // NSNumber, a lightweight wrapper around the number primitives
        //
        
        NSNumber *aBool = [NSNumber numberWithBool:NO];
        NSLog(@"%@", [aBool boolValue] ? @"YES" : @"NO");
        
        NSNumber *anInt = [NSNumber numberWithInt:157];
        NSLog(@"%d", [anInt intValue]);
        
        NSNumber *aLong = [NSNumber numberWithLong:9223372036854775807];
        NSLog(@"%ld", [aLong longValue]);
        
        NSNumber *aFloat = [NSNumber numberWithFloat:26.99f];
        NSLog(@"%.2f", [aFloat floatValue]);
        
        NSNumber *aDouble = [NSNumber numberWithDouble:123.67f];
        NSLog(@"%.2f", [aDouble doubleValue]);
        
//        NSNumber *aNumber = [NSNumber numberWithInt:12];
//        float asFloat = [aNumber floatValue];
//        NSLog(@"%f", asFloat);
        
//        NSString *asString = [aNumber stringValue];
//        NSLog(@"%@", asString);
        
        NSNumber *success = @NO;
        NSNumber *lotteryPick = @15;
        NSNumber *unsignedInt = @384U;
        NSNumber *price = @26.99f;
        
        double x = 24.0f;
        NSNumber *result = @(x * 0.15f);
        NSLog(@"%@", result);
        
        NSNumber *aNumber = @12;
        NSNumber *anotherNumber = @12.0f;
        
        if ([aNumber isEqualToNumber:anotherNumber])
        {
            NSLog(@"Numbers are equal.");
        }
        else
        {
            NSLog(@"Numbers are not equal.");
        }
        
        NSNumber *aThirdNumber = @10;
        NSComparisonResult answer = [aNumber compare:aThirdNumber];
        if (answer == NSOrderedAscending)
        {
            NSLog(@"%@ < %@", aNumber, aThirdNumber);
        }
        else if (answer == NSOrderedSame)
        {
            NSLog(@"%@ == %@", aNumber, aThirdNumber);
        }
        else if (answer == NSOrderedDescending)
        {
            NSLog(@"%@ > %@", aNumber, aThirdNumber);
        }
        
        NSArray *shipCaptains = [NSArray arrayWithObjects:@"Malcolm Reynolds", @"Jean-Luc Picard", @"James T. Kirk", @"Han Solo", nil];
        NSArray *sameCaptains = @[@"Malcolm Reynolds", @"Jean-Luc Picard", @"James T. Kirk", @"Han Solo"];
        NSArray *captainsCopy = [sameCaptains copy];
        
        if ([shipCaptains isEqualToArray:sameCaptains])
        {
            NSLog(@"Arrays are equal");
        }
        
        if ([shipCaptains containsObject:@"Kathryn Janeway"])
        {
            NSLog(@"Janeway reporting for duty.");
        }
        NSUInteger index = [shipCaptains indexOfObject:@"James T. Kirk"];
        if (index == NSNotFound)
        {
            NSLog(@"Captain not found!");
        }
        else
        {
            NSLog(@"Captain %@ was found at index %lu", shipCaptains[index], (unsigned long)index);
        }
        
        NSMutableArray *mutableShipCaptains = [[NSMutableArray alloc] initWithObjects:@"Malcolm Reynolds", @"James T. Kirk", nil];
        [mutableShipCaptains addObject:@"Han Solo"];
        [mutableShipCaptains addObjectsFromArray:@[@"Jean-Luc Picard", @"Kathryn Janeway"]];
        
        NSLog(@"%@", mutableShipCaptains);
        
        NSSortDescriptor *alphabetical = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        [mutableShipCaptains sortUsingDescriptors:@[alphabetical]];
        NSLog(@"%@", mutableShipCaptains);
        
    }
    return 0;
}








