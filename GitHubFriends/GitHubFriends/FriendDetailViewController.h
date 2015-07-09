//
//  FriendDetailViewController.h
//  GitHubFriends
//
//  Created by ian kunneke on 7/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendDetailViewController : UIViewController

@property (nonatomic) NSDictionary *friendInfo;

- (void)configureView;

@end
