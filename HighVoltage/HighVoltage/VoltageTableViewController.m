//
//  VoltageTableViewController.m
//  HighVoltage
//
//  Created by ian kunneke on 7/24/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "VoltageTableViewController.h"
#import "AddDataTableViewController.h"

@interface VoltageTableViewController () <AddDataDelegate, UIPopoverPresentationControllerDelegate>
{
    NSMutableArray *tableData;
    NSDictionary *valueTypes;
}
@end

@implementation VoltageTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    tableData = [[NSMutableArray alloc]init];
    valueTypes = @{@"Amps": @"CurrentCell", @"Volts":@"ElectricCell", @"Ohms":@"ResistanceCell", @"Watts":@"PowerCell"};
    
    
    
    //[tableData addObject:@"ElectricCell"];
    //[tableData addObject:@"CurrentCell"];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableData[indexPath.row] forIndexPath:indexPath];
    
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


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddDataSegue"])
    {
       AddDataTableViewController *dataVC = (AddDataTableViewController *) [segue destinationViewController];
        dataVC.delegate = self;
        dataVC.valueTypes = [valueTypes allKeys];
        dataVC.popoverPresentationController.delegate = self;
        float contentHeight = 44.0f * [valueTypes count];
        dataVC.preferredContentSize = CGSizeMake(100.0f, contentHeight);
    }

}

- (void)valueTypeWasChosen:(NSString *)chosenValueType
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

@end
