//
//  ViewController.m
//  AgeCalculator
//
//  Created by ian kunneke on 6/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "AgeViewController.h"

@interface ViewController ()
{
    
    NSDateFormatter *dateFormatter;
    NSInteger *yourAge;

}


@property (weak, nonatomic) IBOutlet UILabel *currentDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *yourBirthdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *yourAgeIsLabel;




@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Age Calculator";
    
    dateFormatter = [[NSDateFormatter alloc] init];
    
    
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMMddyyyy"
                                                             options:0
                                                              locale:[NSLocale currentLocale]];
    
    dateFormatter.dateFormat = formatString;
    
    
    self.currentDayLabel.text = [dateFormatter stringFromDate:[NSDate date]];
    
    

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}

@end
