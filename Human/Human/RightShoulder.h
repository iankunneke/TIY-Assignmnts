//
//  RightShoulder.h
//  Human
//
//  Created by ian kunneke on 6/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface RightShoulder : BodyPart

@property (nonatomic) NSObject *anteriorDeltoid;
@property (nonatomic) NSObject *posteriorDeltoid;
@property (nonatomic) NSObject *rotatorCuff;

+(instancetype)moveArmBack;
+(instancetype)rotateArm;
+(instancetype)moveArmUp;

@end
