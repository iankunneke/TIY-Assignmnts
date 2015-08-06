//
//  SearchViewController.m
//  34VenueMenu
//
//  Created by ian kunneke on 8/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "SearchViewController.h"
#import "NetworkManager.h"

@import CoreLocation;



@interface SearchViewController () <UITextFieldDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
    CLLocation *_currentLocation;
}
@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self checkLocationAuthorization];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) checkLocationAuthorization
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted)
    {
        if (!_locationManager)
        {
            _locationManager = [[CLLocationManager alloc] init];
            _locationManager.delegate = self;
            _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
            {
                [_locationManager requestWhenInUseAuthorization];
            }
            else
            {
                [self enableLocationManager:YES];
            }
        }
    }
}

-(void) enableLocationManager: (BOOL) enable
{
    if (_locationManager)
    {
        if (enable)
        {
            [_locationManager startUpdatingLocation];
        }
        else
        {
            [_locationManager stopUpdatingLocation];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self enableLocationManager:YES];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *aLocation = [locations lastObject];
    _currentLocation = aLocation;
}



#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (![textField.text isEqualToString:@""])
    {
        [[NetworkManager sharedNetworkManager] findVenuesForCoordinates:CLLocationCoordinate2DMake(_currentLocation.coordinate.latitude, _currentLocation.coordinate.longitude)andSearchTerm:textField.text];
    }
    return YES;
}

@end
