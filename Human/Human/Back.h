//
//  Back.h
//  Human
//
//  Created by ian kunneke on 6/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Back : BodyPart

@property (nonatomic) NSObject *spine;
@property (nonatomic) NSObject *kidneys;
@property (nonatomic) NSObject *backMuscle;

+(instancetype)supportBack;
+(instancetype)cleanToxins;
+(instancetype)moveBack;

@end
