//
//  NewTeamViewController.m
//  SportsTeams
//
//  Created by ian kunneke on 8/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "NewTeamViewController.h"

@interface NewTeamViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *teamTextField;


- (IBAction)doneSelectingTeam:(UIBarButtonItem *)sender;
- (IBAction)cancelSelection:(UIBarButtonItem *)sender;


@end

@implementation NewTeamViewController

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

- (IBAction)doneSelectingTeam:(UIBarButtonItem *)sender {
}

- (IBAction)cancelSelection:(UIBarButtonItem *)sender {
}
@end
