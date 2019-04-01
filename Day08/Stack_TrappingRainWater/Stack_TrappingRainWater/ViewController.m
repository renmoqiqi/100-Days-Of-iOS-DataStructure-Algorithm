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

- (NSInteger)trap:(NSArray *)inputArray
{
    if (inputArray.count == 0)
    {
        return 0;
    }
    
    DSStack *newStack = [[DSStack alloc] initWithSize:15];
    NSInteger sumWater = 0, current = 0;
    
    while (current < inputArray.count)
    {

        while (![newStack isEmpty] && ([inputArray[current] integerValue] > [inputArray[[[newStack peek] intValue]] integerValue]))
        {
            NSInteger top = [[newStack peek] integerValue];
            [newStack popLastObject];
            if ([newStack isEmpty])
            {
                break;
            }
            NSInteger distance = current - [[newStack popLastObject] integerValue] - 1;

            NSNumber *currentN = [NSNumber numberWithInteger:[inputArray[current] integerValue]];

           NSNumber *peekN = [NSNumber numberWithInteger:[inputArray[top] integerValue]];

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
            NSInteger bounded_height = [minObj integerValue] - [inputArray[top] integerValue];
            sumWater += distance * bounded_height;

        }
        [newStack push:@(current++)];
    }
    return sumWater;

}



@end
