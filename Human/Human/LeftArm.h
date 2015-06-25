//
//  LeftArm.h
//  Human
//
//  Created by ian kunneke on 6/24/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface LeftArm : BodyPart

@property (nonatomic) NSObject *upperArm;
@property (nonatomic) NSObject *elbow;
@property (nonatomic) NSObject *hand;

+(instancetype)move;
+(instancetype)feel;
+(instancetype)grab;

@end
