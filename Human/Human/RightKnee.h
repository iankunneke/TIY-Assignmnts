//
//  RightKnee.h
//  Human
//
//  Created by ian kunneke on 6/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface RightKnee : BodyPart

@property (nonatomic) NSObject *kneeCap;
@property (nonatomic) NSObject *acl;
@property (nonatomic) NSObject *mcl;

+(instancetype)protectLigamentes;
+(instancetype)bendLeg;
+(instancetype)supportFall;

@end
