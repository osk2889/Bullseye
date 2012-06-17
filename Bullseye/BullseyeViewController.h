//
//  BullseyeViewController.h
//  Bullseye
//
//  Created by Omkar Kolangade on 6/16/12.
//  Copyright (c) 2012 Omkar Kolangade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BullseyeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *targetNumber;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UIButton *hitButton;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UILabel *result;


@end
