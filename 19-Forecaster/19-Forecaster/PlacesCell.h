//
//  PlacesCell.h
//  19-Forecaster
//
//  Created by ian kunneke on 7/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *locationsCity;
@property (weak, nonatomic) IBOutlet UILabel *locationsState;
@property (weak, nonatomic) IBOutlet UILabel *locationsDate;
@property (weak, nonatomic) IBOutlet UIImageView *locationsConditionImage;
@property (weak, nonatomic) IBOutlet UILabel *locationsTemp;

@end
