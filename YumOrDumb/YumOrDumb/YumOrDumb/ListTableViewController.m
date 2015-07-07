//
//  TableViewController.m
//  YumOrDumb
//
//  Created by ian kunneke on 6/28/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ListTableViewController.h"
#import "Restaurant.h"

@interface ListTableViewController ()
{
    NSMutableArray *restaurants;
}



@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    restaurants = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
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
    return [restaurants count];
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RestaurantCell" forIndexPath:indexPath];
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *ratingLabel = (UILabel *)[cell viewWithTag:2];
 
 // Configure the cell...
    
    
    Restaurant *aRestaurant = restaurants[indexPath.row];
    nameLabel.text = aRestaurant.name;
    ratingLabel.text = [NSString stringWithFormat:@"%ld", (long)aRestaurant.rating];
 
 return cell;
 }
 

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
