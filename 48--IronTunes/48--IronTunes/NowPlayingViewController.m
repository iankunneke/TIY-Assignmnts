//
//  NowPlayingViewController.m
//  48--IronTunes
//
//  Created by ian kunneke on 8/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "NowPlayingViewController.h"
#import "Song.h"

@import AVFoundation;
@import MediaPlayer;

@interface NowPlayingViewController ()
{
    NSMutableArray *songs;
}

@property (weak, nonatomic) IBOutlet UILabel *songTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property (nonatomic) AVQueuePlayer *avQueuePlayer;

- (IBAction)backButton:(UIButton *)sender;
- (IBAction)forwardButton:(UIButton *)sender;
- (IBAction)playTapped:(UIButton *)sender;
- (IBAction)restartTapped:(UIButton *)sender;

@end

@implementation NowPlayingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    songs = [[NSMutableArray alloc] init];
    [self prepareSongs];
    [self setupAudioSession];
    self.avQueuePlayer = [[AVQueuePlayer alloc] init];
    for (Song *aSong in songs)
    {
    
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:aSong.fileName ofType:@"mp3"]]];
        if (playerItem)
        {
            [self.avQueuePlayer insertItem:playerItem afterItem:nil];
            [MPNowPlayingInfoCenter defaultCenter].nowPlayingInfo = @{MPMediaItemPropertyTitle: aSong.songName, MPMediaItemPropertyArtist: aSong.artist};
        }
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([self.avQueuePlayer rate] == 0.0)
    {
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
    [self.avQueuePlayer removeAllItems];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action handlers

- (IBAction)playTapped:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:@"Pause"])
    {
        [self togglePlayback:NO];
    }
    else
    {
        [self togglePlayback:YES];
    }
}

- (IBAction)restartTapped:(UIButton *)sender
{
    [self.avQueuePlayer seekToTime:CMTimeMakeWithSeconds(0.0, 1)];
    if ([self.avQueuePlayer rate] == 0.0)
    {
        [self togglePlayback:YES];
    }
}



- (IBAction)forwardButton:(UIButton *)sender
{
    [self.avQueuePlayer advanceToNextItem];
    
    AVPlayerItem *currentItem = self.avQueuePlayer.currentItem;
    NSUInteger index = [self.avQueuePlayer.items indexOfObject:currentItem];
    Song *aSong = songs[index];
    self.artistLabel.text = aSong.artist;
    self.songTitleLabel.text = aSong.songName;
}
- (IBAction)backButton:(UIButton *)sender
{
    
}

#pragma mark - Remote control events

- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeRemoteControl)
    {
        switch (event.subtype)
        {
            case UIEventSubtypeRemoteControlTogglePlayPause:
                if ([self.avQueuePlayer rate] > 0.0)
                {
                    [self togglePlayback:NO];
                }
                else
                {
                    [self togglePlayback:YES];
                }
                break;
                case UIEventSubtypeRemoteControlPlay:
                [self togglePlayback:YES];
                break;
                case UIEventSubtypeRemoteControlPause:
                [self togglePlayback:NO];
                break;
                
            default:
                break;
        }
    }
}

#pragma mark - Private

- (void)setupAudioSession
{
    NSError *categoryError = nil;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&categoryError];
    if (categoryError)
    {
        NSLog(@"Error setting category! %@", [categoryError localizedDescription]);
    }
    
    NSError *activationError = nil;
    BOOL success = [[AVAudioSession sharedInstance] setActive:YES error:&activationError];
    if (!success)
    {
        NSLog(@"Audio session could not be activated.");
        if (activationError)
        {
            NSLog(@"Session error: %@", [activationError localizedDescription]);
        }
    }
    
}

- (void)togglePlayback:(BOOL)play
{
    
    
    if (play)
    {
        [self.avQueuePlayer play];
        [self.playButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
    else
    {
        [self.avQueuePlayer pause];
        [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    }
    AVPlayerItem *currentItem = self.avQueuePlayer.currentItem;
    NSUInteger index = [self.avQueuePlayer.items indexOfObject:currentItem];
    Song *aSong = songs[index];
    self.artistLabel.text = aSong.artist;
    self.songTitleLabel.text = aSong.songName;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)prepareSongs
{
    Song *aSong = [[Song alloc] init];
    aSong.songName = @"Canned Heat";
    aSong.artist = @"Jamiroquai";
    aSong.fileName = @"CannedHeat";
    aSong.artwork = @"Napoleon";
    [songs addObject:aSong];
    
    Song *anotherSong = [[Song alloc] init];
    anotherSong.songName = @"Background Music";
    anotherSong.artist = @"Stewie";
    anotherSong.fileName = @"BackgroundMusic";
    anotherSong.artwork = @"Turd";
    [songs addObject:anotherSong];
}

@end
