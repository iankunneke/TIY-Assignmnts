//
//  NewFriendViewController.m
//  GitHubFriends
//
//  Created by ian kunneke on 7/8/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "NewFriendViewController.h"

@interface NewFriendViewController () <NSURLSessionDataDelegate>
{
    NSMutableData *receivedData;
}

@property (nonatomic) UITextField *loginTextField;

@property (nonatomic) UIButton *searchButton;
@property (nonatomic) UIButton *cancelButton;

@end

@implementation NewFriendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cancelButton = [[UIButton alloc] init];
    [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(cancelButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.searchButton = [[UIButton alloc] init];
    [self.searchButton setTitle:@"Search" forState:UIControlStateNormal];
    [self.searchButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:@selector(searchButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.loginTextField = [[UITextField alloc] init];
    self.loginTextField.placeholder = @"GitHub Username";
    self.loginTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.loginTextField setFrame:CGRectMake(self.view.frame.size.width/4, 100.00f, self.view.frame.size.width/2, 30.0f)];
    [self.view addSubview:self.loginTextField];
    
    [self.searchButton setFrame:CGRectMake(self.loginTextField.frame.origin.x, self.loginTextField.frame.origin.y + self.loginTextField.frame.size.height + 10.0f, self.loginTextField.frame.size.width, 40.0f)];
    [self.view addSubview:self.searchButton];
    
    [self.cancelButton setFrame:CGRectMake(self.searchButton.frame.origin.x, self.searchButton.frame.origin.y + self.searchButton.frame.size.height +25.0f, self.searchButton.frame.size.width, 40.0f)];
    [self.view addSubview:self.cancelButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)cancelButtonTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)searchButtonTapped:(UIButton *)sender
{
    NSString *login = self.loginTextField.text;
    if (![login isEqualToString:@""])
    {
        NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@", login];
        NSURL *url = [NSURL URLWithString:urlString];
        //NSURLRequest *request = [NSURLRequest requestWithURL:url];
        //NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        //NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
        [dataTask resume];
        
        //[self.friends addObject:userInfo];
        //[self dismissViewControllerAnimated:YES completion:nil];
        
    }
}

#pragma mark - URLSession data delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
         receivedData = [[NSMutableData alloc]init];
    }
    [receivedData appendData:data];
    
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Download successful!");
        NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
        [self.friends addObject:userInfo];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        
    }
}









@end
