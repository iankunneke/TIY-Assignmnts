//
//  SportsTeamsTableViewController.m
//  SportsTeams
//
//  Created by ian kunneke on 7/1/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "SportsTeamsTableViewController.h"
#import "Teams.h"

@interface SportsTeamsTableViewController ()
{
NSArray *theTeams;
}
@end

@implementation SportsTeamsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *teamData = @[@{@"teamName": @"Orlando Tragic", @"sport": @"NBA", @"bestPlayer": @"Pat Garrity", @"wins": @72, @"loses": @9}, @{@"teamName": @"Cleveland Cavaliers", @"sport": @"NBA", @"bestPlayer": @"LeChoke James", @"wins": @22, @"loses": @59}, @{@"teamName": @"Denver Nuggets", @"sport": @"NBA", @"bestPlayer": @"the fans", @"wins": @41, @"loses": @41}, @{@"teamName": @"Pittsburgh Steelers", @"sport": @"NFL", @"bestPlayer": @"Antonio Brown", @"wins": @16, @"loses": @0}, @{@"teamName": @"Miami Dolphins", @"sport": @"NFL", @"bestPlayer": @"Ray Finkle", @"wins": @8, @"loses": @8}, @{@"teamName": @"Florida Gators", @"sport": @"NCAA", @"bestPlayer": @"Tim Tebow", @"wins": @12, @"loses": @1}, @{@"teamName": @"FSU crimiNoles", @"sport": @"NCAA", @"bestPlayer": @"Prisoners", @"wins": @3, @"loses": @9}, @{@"teamName": @"The Iron Yard", @"sport": @"Programming", @"bestPlayer": @"Joben Gohlke", @"wins": @348, @"loses": @0}, @{@"teamName": @"Pittsburgh Pirates", @"sport": @"MLB", @"bestPlayer": @"Andrew McCutchen", @"wins": @100, @"loses": @60}, @{@"teamName": @"UFC", @"sport": @"Fighting", @"bestPlayer": @"Chuck Norris", @"wins": @8609238469032869, @"loses": @0}];
    
    NSMutableArray *teamStorage = [[NSMutableArray alloc] init];
    
    for (NSDictionary *thatTeam in teamData)
    {
        Teams *aTeam = [[Teams alloc] init];
        aTeam.teamName = thatTeam[@"teamName"];
        aTeam.sport = thatTeam[@"sport"];
        aTeam.bestPlayer = thatTeam[@"bestPlayer"];
        aTeam.wins = [thatTeam[@"wins"] intValue];
        aTeam.loses = [thatTeam[@"loses"] intValue];
        [teamStorage addObject:aTeam];
        
        
    }
    
    theTeams = [teamStorage copy];
    self.title = @"Ian's Awesome Team Breakdown";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [theTeams count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeamCell" forIndexPath:indexPath];
    
    Teams *theTeam = theTeams[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@: %@- %@ %d-%d",theTeam.teamName, theTeam.sport, theTeam.bestPlayer, theTeam.wins, theTeam.loses];
    
    
    
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
