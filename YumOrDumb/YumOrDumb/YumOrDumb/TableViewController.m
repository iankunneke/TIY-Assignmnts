//
//  TableViewController.m
//  YumOrDumb
//
//  Created by ian kunneke on 6/28/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
{
    NSMutableArray *cells;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    cells = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
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

@end
