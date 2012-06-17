//
//  BullseyeViewController.m
//  Bullseye
//
//  Created by Omkar Kolangade on 6/16/12.
//  Copyright (c) 2012 Rochester Institute of Technology. All rights reserved.
//

#import "BullseyeViewController.h"
#import "BullseyeModel.h"

@interface BullseyeViewController ()

// Variables for handling generated target number.
@property (nonatomic) int t;
@property (nonatomic, strong) NSNumber *target;
// Attempt counting variable.
@property (nonatomic, strong) NSNumber *attempt;

@end

@implementation BullseyeViewController

@synthesize t = _t;
@synthesize target = _target;
@synthesize attempt = _attempt;

@synthesize targetNumber = _targetNumber;
@synthesize slider = _slider;
@synthesize hitButton = _hitButton;
@synthesize nextButton = _nextButton;
@synthesize result = _result;
@synthesize sliderValue = _sliderValue;
@synthesize attempts = _attempts;

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self reloadGame];
    // Initialize counting variable.
    self.target = [[NSNumber alloc] initWithInt:0];
}

- (void)viewDidUnload
{
    [self setTargetNumber:nil];
    [self setSlider:nil];
    [self setHitButton:nil];
    [self setNextButton:nil];
    [self setResult:nil];
    [self setSliderValue:nil];
    [self setAttempts:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Game Handling

- (void)reloadGame 
{
    // Generate a target number for the first time.
    self.t = [BullseyeModel generateTarget];
    self.target = [[NSNumber alloc] initWithInt:self.t];
    self.targetNumber.text = [self.target stringValue];
    self.result.textColor = [UIColor blackColor];
    self.result.text = 
    [NSString stringWithFormat:@"Slide the slider to the position of number %d", self.target];
    self.attempts.text = @"0";
    self.nextButton.hidden = YES;
}

- (IBAction)hit:(id)sender 
{
    if ((int)([self.slider value] *100) == self.t) {
        self.result.textColor = [UIColor greenColor];
        self.result.text = @"BINGO! Tap Next to continue ...";
        self.nextButton.hidden = NO;
        self.hitButton.enabled = NO;
    }
    else {
        self.result.textColor = [UIColor redColor];
        self.result.text = @"Oops ... Try again!";
        // Increment the attempt count.
        int attemptValue = [self.attempt intValue];
        self.attempt = [NSNumber numberWithInt:attemptValue + 1];
        // Display the attemp count.
        self.attempts.text = [self.attempt stringValue];
    }
}

- (IBAction)next:(id)sender 
{
    [self reloadGame];
}

/*
- (IBAction)sliderMoved:(UISlider *)sender 
{
    NSNumber *sliderAt = [[NSNumber alloc] initWithFloat:[sender value]];
    //self.sliderValue.text = [sliderAt stringValue]; 
}
*/

@end






















