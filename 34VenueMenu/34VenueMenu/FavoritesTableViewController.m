//
//  FavoritesTableViewController.m
//  34VenueMenu
//
//  Created by ian kunneke on 7/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FavoritesTableViewController.h"
#import "SearchViewController.h"
#import "FavoriteDetailViewController.h"
#import "RestaurantCell.h"
#import "NetworkManager.h"
#import "Venue.h"

@interface FavoritesTableViewController () <UIPopoverPresentationControllerDelegate>
{
    NSMutableArray *_restaurants;
    NSMutableArray *_favorites;
}
@end

@implementation FavoritesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"The Venue Menu";
    
    _restaurants = [[NSMutableArray alloc] init];
    _favorites = [[NSMutableArray alloc] init];
    //[_restaurants addObject:@{@"name":@"chicken place"}];
    
    [NetworkManager sharedNetworkManager].delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([_favorites count] > 0)
    {
        return 2;
    }
    else
    {
        return 1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Results";
    }
    else
    {
        return @"Favorites";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (section == 0)
    {
        return [_restaurants count];
    }
    else
    {
        return [_favorites count];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RestaurantCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RestaurantCell" forIndexPath:indexPath];
    
    Venue *aRestaurant = _restaurants[indexPath.row];
    cell.textLabel.text = aRestaurant.name;
    cell.detailTextLabel.text = aRestaurant.category;
    
    return cell;
}

#pragma mark - CustomDelegate

- (void)venuesWereFound:(NSArray *)venues
{
    [_restaurants addObjectsFromArray:venues];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
    
}

- (void)favoriteWasAdded:(Venue *)aFavorite
{
    [_favorites addObject:aFavorite];
    [self.tableView reloadData];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowSearchPopoverSegue"])
    {
        SearchViewController *searchVC = (SearchViewController *) [segue destinationViewController];
        searchVC.popoverPresentationController.delegate = self;
        searchVC.preferredContentSize = CGSizeMake(200.0f, 50.0f);
    }
    else if ([segue.identifier isEqualToString:@"showVenueDetailSegue"])
    {
        FavoriteDetailViewController *detailVC = (FavoriteDetailViewController *) [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        detailVC.thatVenue = [_restaurants objectAtIndex: indexPath.row];
        detailVC.delegate = self;
    }
}

@end
