//
//  NetworkManager.m
//  19-Forecaster
//
//  Created by ian kunneke on 7/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "NetworkManager.h"
#import "CityData.h"

typedef enum
{
    DataFetchTypeCoordinates,
    DataFetchTypeWeather
}  DataFetchType;

@interface NetworkManager () <NSURLSessionDataDelegate>
{
    NSURLSessionConfiguration *configuration;
    NSURLSession *session;
    NSMutableDictionary *citiesForActiveTasks;
    NSMutableDictionary *receivedDataRepos;
}


@end
@implementation NetworkManager

static NSString *gMapsBaseURL = @"http://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:%@&sensor=false";
static NSString *forecastIOBaseURL = @"https://api.forecast.io/forecast/1ef384b7594e9e52b696349355dbb1ef/%f,%f";

+ (NetworkManager *) sharedNetworkManager
{
    //singleton constructor
    static NetworkManager *sharedNetworkManager = nil;
    if (sharedNetworkManager)
    {
        return sharedNetworkManager;
    }
    
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        sharedNetworkManager = [[NetworkManager alloc] init];
    });
    return sharedNetworkManager;
    
}

- (instancetype)init

{
    self = [super init];
    if (self)
    {
        configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        citiesForActiveTasks = [[NSMutableDictionary alloc] init];
        receivedDataRepos = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) findCoordinatesForCity:(CityData *) theCityData
{
    NSString *gMapsURLString = [NSString stringWithFormat: gMapsBaseURL, theCityData.zip];
    NSURL *url = [NSURL URLWithString: gMapsURLString];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL: url];
    [self startDataTask:dataTask forCity:theCityData];
}

- (void) startDataTask: (NSURLSessionDataTask *) dataTask forCity: (CityData *) theCityData
{
    [citiesForActiveTasks setObject:theCityData forKey:[NSNumber numberWithInteger:dataTask.taskIdentifier]];
    [receivedDataRepos setObject:[[NSMutableData alloc] init] forKey:[NSNumber numberWithInteger:dataTask.taskIdentifier]];
    [dataTask resume];
}

#pragma mark - NSURLSession Delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler (NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSMutableData *receivedData = receivedDataRepos [[NSNumber numberWithInteger:dataTask.taskIdentifier]];
    [receivedData appendData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
       NSMutableData *receivedMyData = receivedDataRepos [[NSNumber numberWithInteger:task.taskIdentifier]];
        CityData *aCity = citiesForActiveTasks [[NSNumber numberWithInteger:task.taskIdentifier]];
        NSDictionary *aDict = [NSJSONSerialization JSONObjectWithData:receivedMyData options:0 error:nil];
        DataFetchType fetchType;
        if ([aDict objectForKey:@"results"])
        {
            fetchType = DataFetchTypeCoordinates;
        }
        else
        {
            fetchType = DataFetchTypeWeather;
        }
        BOOL success;
        switch (fetchType)
        {
            case DataFetchTypeCoordinates:
                success = [aCity parseCoordinateInfo:aDict];
                break;
                
            default:
                break;
        }
        if (success)
        {
            [self.delegate cityWasFound:aCity];
        }
    }
}








@end
