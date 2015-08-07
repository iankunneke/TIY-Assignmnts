//
//  FavoriteDetailViewController.m
//  34VenueMenu
//
//  Created by ian kunneke on 7/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FavoriteDetailViewController.h"
@import MapKit;

@interface FavoriteDetailViewController () 

@property (weak, nonatomic) IBOutlet UILabel *restaurantLabel;
@property (weak, nonatomic) IBOutlet UISwitch *favoriteSwitch;
@property (weak, nonatomic) IBOutlet UILabel *restaurantAddress;
- (IBAction)switchToggled:(UISwitch *)sender;




@end

@implementation FavoriteDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.restaurantLabel.text = self.thatVenue.name;
    self.restaurantAddress.text = [NSString stringWithFormat:@"%@\n%@, %@", self.thatVenue.address, self.thatVenue.city, self.thatVenue.state];
    self.favoriteSwitch.on = self.thatVenue.favorite;
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

- (IBAction)switchToggled:(UISwitch *)sender
{
    if (sender.on)
    {
        self.thatVenue.favorite = sender.on;
        [self.delegate favoriteWasAdded:self.thatVenue];
    }
}
@end
