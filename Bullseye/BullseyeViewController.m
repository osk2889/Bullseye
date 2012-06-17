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

@end

@implementation BullseyeViewController

int target = 0;
NSNumber *targetNumber = nil;

@synthesize targetNumber = _targetNumber;
@synthesize slider = _slider;
@synthesize hitButton = _hitButton;
@synthesize nextButton = _nextButton;
@synthesize result = _result;
@synthesize sliderValue = _sliderValue;

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self reloadGame];
    
}

- (void)viewDidUnload
{
    [self setTargetNumber:nil];
    [self setSlider:nil];
    [self setHitButton:nil];
    [self setNextButton:nil];
    [self setResult:nil];
    [self setSliderValue:nil];
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
    target = [BullseyeModel generateTarget];
    targetNumber = [[NSNumber alloc] initWithInt:target];
    self.targetNumber.text = [targetNumber stringValue];
    self.result.textColor = [UIColor blackColor];
    self.result.text = [NSString stringWithFormat:@"Slide the slider to the position of number %d", target];
}

- (IBAction)hit:(id)sender 
{
    if ((int)([self.slider value] *100) == target) {
        self.result.textColor = [UIColor greenColor];
        self.result.text = @"BINGO!";
        //[self reloadGame];
    }
    else {
        self.result.textColor = [UIColor redColor];
        self.result.text = @"Oops ... Try again!";
    }
}

- (IBAction)next:(id)sender 
{
    [self reloadGame];
}

- (IBAction)sliderMoved:(UISlider *)sender 
{
    NSNumber *sliderAt = [[NSNumber alloc] initWithFloat:[sender value]];
    //self.sliderValue.text = [sliderAt stringValue]; 
}


@end






















