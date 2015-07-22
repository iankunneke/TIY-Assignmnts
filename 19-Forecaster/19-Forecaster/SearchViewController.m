//
//  SearchViewController.m
//  19-Forecaster
//
//  Created by ian kunneke on 7/10/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "SearchViewController.h"
#import "CityData.h"
#import "NetworkManager.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *zipText;
- (IBAction)findCity:(UIButton *)sender;
- (IBAction)useCurrentLocation:(UIButton *)sender;



@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)findCity:(UIButton *)sender
{
    if (![self.zipText.text isEqualToString: @""])
    {
        CityData *thatCity = [[CityData alloc] init];
        thatCity.zip = self.zipText.text;
        [[NetworkManager sharedNetworkManager] findCoordinatesForCity:thatCity];
    }
}

- (IBAction)useCurrentLocation:(UIButton *)sender
{
}
@end
