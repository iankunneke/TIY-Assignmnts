//
//  ClockViewController.m
//  ObjectiveClock
//
//  Created by ian kunneke on 7/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ClockViewController.h"
#import "Clock.h"

@interface ClockViewController ()
{
    NSTimer *timer;
    Clock *clock;
}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation ClockViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    clock = [[Clock alloc] init];
    
    timer = [NSTimer timerWithTimeInterval:1.0 target: self selector:@selector(updateTimeLabel) userInfo:nil repeats:true];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTimeLabel) name:UIApplicationWillEnterForegroundNotification object:nil];
}
-(void)viewWillAppear:(BOOL)animated

{
    [super viewWillAppear:animated];
}
    
    

-(void) updateTimeLabel
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeStyle = NSDateFormatterMediumStyle;
    
    self.timeLabel.text = [formatter stringFromDate:clock.currentTime];
}

- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated

{
    [timer invalidate];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
