//
//  StopwatchViewController.m
//  ObjectiveStopwatch
//
//  Created by ian kunneke on 7/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "StopwatchViewController.h"
#import "MyStopwatch.h"

@interface StopwatchViewController ()
{
    NSTimer *timer;
    MyStopwatch *stopwatch;
}
- (IBAction)startStopwatch:(UIButton *)sender;
- (IBAction)stopStopwatch:(UIButton *)sender;

@property (nonatomic) IBOutlet UILabel *currentCount;
@property (nonatomic) IBOutlet UIButton *startTime;
@property (nonatomic) IBOutlet UIButton *stopTime;

@end

@implementation StopwatchViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    stopwatch = [[MyStopwatch alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startStopwatch:(UIButton *)sender
{
    [stopwatch start];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateElapsedTimeLabel) userInfo:nil repeats:true];
}

-(void) updateElapsedTimeLabel
{
    if (stopwatch.isRunning)
    {
        self.currentCount.text = [stopwatch elapsedTimeAsString];
    }
    
    
}

- (IBAction)stopStopwatch:(UIButton *)sender
{
    [stopwatch stop];
}
@end
