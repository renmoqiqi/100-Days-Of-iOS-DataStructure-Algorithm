//
//  ViewController.m
//  Stack_TrappingRainWater
//
//  Created by penghe on 2019/3/31.
//  Copyright © 2019年 WondersGroup. All rights reserved.
//

#import "ViewController.h"
#import "DSStack.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *testArray = @[@0,@1,@0,@2,@1,@0,@1,@3,@2,@1,@2,@1];
    NSLog(@"%ld",(long)[self trap:testArray]);
}

- (int)trap:(NSArray *)inputArray
{
    if (inputArray.count == 0)
    {
        return 0;
    }
    
    DSStack *newStack = [[DSStack alloc] initWithSize:15];
    int sumWater = 0, current = 0;
    
    while (current < inputArray.count)
    {

        while (![newStack isEmpty] && ([inputArray[current] intValue] > [inputArray[[[newStack peek] intValue]] intValue]))
        {
            int top = [[newStack peek] intValue];
            [newStack popLastObject];
            if ([newStack isEmpty])
            {
                break;
            }
            int distance = current - [[newStack peek] intValue] - 1;

            NSNumber *currentN = [NSNumber numberWithInt:[inputArray[current] intValue]];

            NSNumber *peekN = [NSNumber numberWithInt:[inputArray[[[newStack peek] intValue]] intValue]];

            NSNumber *minObj;

            NSComparisonResult r = [currentN compare:peekN];
            if (r == NSOrderedAscending)
            {
                minObj = currentN;

            }
            else if(r == NSOrderedSame)
            {
                minObj = currentN;

            }
            else if(r == NSOrderedDescending)
            {
                minObj = peekN;
            }
            int bounded_height = [minObj intValue] - [inputArray[top] intValue];
            sumWater += distance * bounded_height;

        }
        
        [newStack push:@(current++)];
    }
    return sumWater;

}



@end
