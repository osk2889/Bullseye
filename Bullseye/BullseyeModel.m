//
//  BullseyeModel.m
//  Bullseye
//
//  Created by Omkar Kolangade on 6/16/12.
//  Copyright (c) 2012 Rochester Institute of Technology. All rights reserved.
//

#import "BullseyeModel.h"

@implementation BullseyeModel

+ (int)generateTarget 
{
    int target = 0;
    do {
        target = arc4random() % 100;
    }
    while (target == 0 || target == 100);
    
    return target;
}

@end
