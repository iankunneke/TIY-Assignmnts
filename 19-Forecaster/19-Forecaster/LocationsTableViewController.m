//
//  LocationsTableViewController.m
//  19-Forecaster
//
//  Created by ian kunneke on 7/9/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "LocationsTableViewController.h"
#import "PlacesCell.h"

@interface LocationsTableViewController ()
{
    NSMutableArray *places;
}


@end

@implementation LocationsTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Forecaster";
    
    
    
    places = [[NSMutableArray alloc] init];
    [places addObject:
                    @{
                      @"temperature": @94.09,
                      @"temperatureMin": @74.86,
                      @"temperatureMax": @94.7,
                      @"apparentTemperature": @100.09,
                      @"humidity": @0.71,
                      @"summary": @"Partly Cloudy",
                      @"icon": @"partly-cloudy-day",
                      @"precipProbability": @0.84,
                      @"sunriseTime": @1436697431,
                      @"sunsetTime": @1436747205,
                      @"city": @"Orlando",
                      @"state": @"Florida",
                      @"date": @"July 10, 2015"
                      }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [places count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlacesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCityCell" forIndexPath:indexPath];
  
    NSDictionary *aPlace = [places objectAtIndex:indexPath.row];
    
    cell.locationsCity.text = [aPlace objectForKey:@"city"];
    cell.locationsState.text = [aPlace objectForKey:@"state"];
    cell.locationsConditionImage.image = [aPlace objectForKey:@"icon"];
    cell.locationsTemp.text = [aPlace objectForKey:@"temperature"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
