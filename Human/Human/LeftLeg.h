//
//  LeftLeg.h
//  Human
//
//  Created by ian kunneke on 6/24/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface LeftLeg : BodyPart

@property (nonatomic) NSObject *foot;
@property (nonatomic) NSObject *knee;
@property (nonatomic) NSObject *hamstring;

+(instancetype)supportLegs;
+(instancetype)bendLegs;
+(instancetype)jump;

@end
