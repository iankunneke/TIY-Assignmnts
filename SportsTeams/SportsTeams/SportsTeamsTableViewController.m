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
    
    NSArray *teamData = @[@{@"teamName": @"Orlando Tragic", @"sport": @"Basketball", @"bestPlayer": @"Pat Garrity"}, @{@"teamName": @"Cleveland Cavaliers", @"sport": @"Baketball", @"bestPlayer": @"LeChoke James"}, @{@"teamName": @"Denver Nuggets", @"sport": @"Basketball", @"bestPlayer": @"the fans"}, @{@"teamName": @"Pittsburgh Steelers", @"sport": @"Football", @"bestPlayer": @"Antonio Brown"}, @{@"teamName": @"Miami Dolphins", @"sport": @"Football", @"bestPlayer": @"Ray Finkle"}, @{@"teamName": @"Florida Gators", @"sport": @"Football", @"bestPlayer": @"Tim Tebow"}, @{@"teamName": @"FSU crimiNoles", @"sport": @"Football", @"bestPlayer": @"Prisoners"}, @{@"teamName": @"The Iron Yard", @"sport": @"Programming", @"bestPlayer": @"Joben Gohlke"}, @{@"teamName": @"Pittsburgh Pirates", @"sport": @"Baseball", @"bestPlayer": @"Andrew McCutchen"}, @{@"teamName": @"UFC", @"sport": @"Fighting", @"bestPlayer": @"Chuck Norris"}];
    
    NSMutableArray *teamStorage = [[NSMutableArray alloc] init];
    
    for (NSDictionary *thatTeam in teamData)
    {
        Teams *aTeam = [[Teams alloc] init];
        aTeam.teamName = thatTeam[@"teamName"];
        aTeam.sport = thatTeam[@"sport"];
        aTeam.bestPlayer = thatTeam[@"bestPlayer"];
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@: %@- %@",theTeam.teamName, theTeam.sport, theTeam.bestPlayer];
    
    
    
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
