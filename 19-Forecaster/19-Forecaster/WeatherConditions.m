//
//  WeatherConditions.m
//  19-Forecaster
//
//  Created by ian kunneke on 7/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "WeatherConditions.h"

@implementation WeatherConditions

-(BOOL) parseWeatherInfo:(NSDictionary *)weatherDictionary
{
    BOOL returnValue = NO;
    if (weatherDictionary)
    {
        returnValue = YES;
        
        NSDictionary *currently = weatherDictionary [@"currently"];
        self.summary = currently [@"summary"];
        self.icon = currently [@"icon"];
        self.temperature = [currently [@"temperature"] floatValue];
        self.apparentTemperature = [currently [@"apparentTemperature"] floatValue];
        
        NSDictionary *daily = weatherDictionary [@"daily"];
        self.temperatureMin = [daily [@"temperatureMin"] floatValue];
        self.temperatureMax = [daily [@"temperatureMax"] floatValue];
        self.humidity = [daily [@"humidity"] floatValue];
        self.precipProbability = [daily [@"precipProbability"] floatValue];
        NSNumber *sunrise = daily[@"sunriseTime"];
        NSNumber *sunset = daily[@"sunsetTime"];
        self.sunriseTime = [NSDate dateWithTimeIntervalSince1970:[sunrise doubleValue]];
        self.sunsetTime =[NSDate dateWithTimeIntervalSince1970:[sunset doubleValue]];
        
        
        //self.sunriseTime = daily [@"sunriseTime"];
        //self.sunsetTime = daily [@"sunsetTime"];
    }
    return returnValue;
}

@end
