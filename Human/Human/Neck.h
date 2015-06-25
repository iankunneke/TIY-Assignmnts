//
//  Neck.h
//  Human
//
//  Created by ian kunneke on 6/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Neck : BodyPart

@property (nonatomic) NSObject *esophagus;
@property (nonatomic) NSObject *jugular;
@property (nonatomic) NSObject *neckMuscle;

+(instancetype)transportFood;
+(instancetype)carryBlood;
+(instancetype)moveNeck;

@end
