//
//  NetworkManager.m
//  34VenueMenu
//
//  Created by ian kunneke on 8/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "NetworkManager.h"
#import "Venue.h"

static NSString *fourSquareBaseURL = @"https://api.foursquare.com/v2/venues/search?client_id=WDGBHZCIJAYUSXGAJBNRWILTGFLUB3VSPW4LDJOS4HG340VZ&client_secret=N0KZSJZG2OPG3HBWIVRCKIARJLQ3KNYCX1R13FXNFBQGR2AK&v=20130815&ll=%f,%f&query=%@";

@interface NetworkManager()<NSURLSessionDataDelegate>
{
    NSURLSessionConfiguration *configuration;
    NSURLSession *session;
    NSMutableData *receivedData;
}

@end

@implementation NetworkManager

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
        receivedData = [[NSMutableData alloc] init];
    }
    return self;
}

- (void) findVenuesForCoordinates:(CLLocationCoordinate2D) coordinate andSearchTerm:(NSString *) searchTerm
{
    NSString *fourSquareURLString = [NSString stringWithFormat: fourSquareBaseURL, coordinate.latitude, coordinate.longitude, searchTerm];
    NSURL *url = [NSURL URLWithString: fourSquareURLString];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL: url];
    [dataTask resume];
}

#pragma mark - NSURLSession Delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler (NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSDictionary *aDict = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:nil];
       NSDictionary *response = [aDict objectForKey:@"response"];
        NSArray *venues = [response objectForKey:@"venues"];
        NSMutableArray *venueModels = [[NSMutableArray alloc] init];
       
        for (NSDictionary *aVenue in venues)
        {
            Venue *theVenue = [[Venue alloc] init];
            theVenue.favorite = NO;
            theVenue.name = [aVenue objectForKey:@"name"];
            NSDictionary *contact = [aVenue objectForKey:@"contact"];
            theVenue.formattedPhone = [contact objectForKey:@"formattedPhone"];
            NSDictionary *theLocation = [aVenue objectForKey:@"location"];
            theVenue.address = [theLocation objectForKey:@"address"];
            theVenue.latitude = [[theLocation objectForKey:@"lat"] floatValue];
            theVenue.longitude = [[theLocation objectForKey:@"lng"]floatValue];
            theVenue.city = [theLocation objectForKey:@"city"];
            theVenue.state = [theLocation objectForKey:@"state"];
            theVenue.zip = [theLocation objectForKey:@"postalCode"];
            theVenue.url = [aVenue objectForKey:@"url"];
            NSArray *categories = [aVenue objectForKey:@"categories"];
            NSDictionary *aCategory = categories [0];
            theVenue.category = [aCategory objectForKey:@"shortName"];
            
            [venueModels addObject:theVenue];
        }
        [self.delegate venuesWereFound:venueModels];
    }
}


@end
