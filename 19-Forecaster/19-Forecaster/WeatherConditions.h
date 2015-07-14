//
//  WeatherConditions.h
//  19-Forecaster
//
//  Created by ian kunneke on 7/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherConditions : NSObject

@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *icon;
@property (assign) float temperature;
@property (assign) float temperatureMin;
@property (assign) float temperatureMax;
@property (assign) float apparentTemperature;
@property (assign) float humidity;
@property (assign) float precipProbability;
@property (nonatomic) NSDate *sunriseTime;
@property (nonatomic) NSDate *sunsetTime;

- (BOOL) parseWeatherInfo: (NSDictionary *) weatherDictionary;

@end
