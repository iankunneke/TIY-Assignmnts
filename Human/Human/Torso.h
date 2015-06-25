//
//  Torso.h
//  Human
//
//  Created by ian kunneke on 6/24/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Torso : BodyPart

@property (nonatomic) NSObject *heart;
@property (nonatomic) NSObject *stomach;
@property (nonatomic) NSObject *lungs;

+(instancetype)pumpBlood;
+(instancetype)digestFood;
+(instancetype)breathe;

@end
