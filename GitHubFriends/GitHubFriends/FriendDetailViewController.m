//
//  FriendDetailViewController.m
//  GitHubFriends
//
//  Created by ian kunneke on 7/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FriendDetailViewController.h"

@interface FriendDetailViewController ()

@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) UILabel *companyLabel;
@property (nonatomic) UILabel *loginLabel;
@property (nonatomic) UILabel *locationLabel;



@end

@implementation FriendDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)configureView
{
    
    self.title = self.friendInfo[@"name"];
    
    /*self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = [NSString stringWithFormat:@"Name: %@", self.friendInfo[@"name"]];
    [self.nameLabel setFrame:CGRectMake(self.view.frame.size.width/4, 100.00f, self.view.frame.size.width/2, 40.0f)];
    [self.view addSubview: self.nameLabel]; */
    
    
    self.companyLabel = [[UILabel alloc] init];
    self.companyLabel.text = [NSString stringWithFormat:@"Company: %@", self.friendInfo[@"company"]];
    [self.companyLabel setFrame:CGRectMake(self.view.frame.size.width/4, 100.0f, self.view.frame.size.width/2, 40.0f)];
    [self.view addSubview:self.companyLabel];
    
    
    self.loginLabel = [[UILabel alloc] init];
    self.loginLabel.text = [NSString stringWithFormat:@"Username: %@", self.friendInfo[@"login"]];
    [self.loginLabel setFrame:CGRectMake(self.companyLabel.frame.origin.x, self.companyLabel.frame.origin.y +self.companyLabel.frame.size.height +10.0f, self.companyLabel.frame.size.width, 40.0f)];
    [self.view addSubview:self.loginLabel];
    
    
    
    self.locationLabel = [[UILabel alloc] init];
    self.locationLabel.text = [NSString stringWithFormat:@"Location: %@", self.friendInfo[@"location"]];
    [self.locationLabel setFrame:CGRectMake(self.loginLabel.frame.origin.x, self.loginLabel.frame.origin.y +self.loginLabel.frame.size.height +10.0f, self.loginLabel.frame.size.width, 40.0f)];
    [self.view addSubview:self.locationLabel];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

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
