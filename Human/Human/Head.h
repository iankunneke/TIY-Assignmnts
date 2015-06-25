//
//  Head.h
//  Human
//
//  Created by ian kunneke on 6/24/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "BodyPart.h"

@interface Head : BodyPart

@property (nonatomic) NSObject *ear;
@property (nonatomic) NSObject *eye;
@property (nonatomic) NSObject *mouth;

+(instancetype)hear;
+(instancetype)see;
+(instancetype)taste;

@end
