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
   NSLog(@"%d",[self trap:testArray]);
}

- (int)trap:(NSArray *)inputArray
{
    if (inputArray.count == 0)
    {
        return 0;
    }
    
    DSStack *newStack = [[DSStack alloc] initWithSize:10];
    int ans = 0, current = 0;
    while (current < inputArray.count)
    {
        int peek = [inputArray[[[newStack peek] intValue]] intValue];

        while (![newStack isEmpty] && ([inputArray[current] intValue] > peek))
        {
            int top = [[newStack peek] intValue];
            [newStack popLastObject];
            if ([newStack isEmpty])
            {
                break;
            }
            int distance = current - [[newStack popLastObject] intValue] - 1;

            NSNumber *currentN = [NSNumber numberWithInt:[inputArray[current] intValue]];

           NSNumber *disN = [NSNumber numberWithInt:((int)inputArray[[[newStack popLastObject] intValue]] - (int)[inputArray[top] intValue])];

            NSNumber *minObj;

            NSComparisonResult r = [currentN compare:disN];
            if (r == NSOrderedAscending)
            {
                minObj = currentN;

            }
            else if(r == NSOrderedSame)
            {

            }
            else if(r == NSOrderedDescending)
            {
                minObj = disN;
            }
            int bounded_height = [minObj intValue];
            ans += distance * bounded_height;

        }
        [newStack push:@(current++)];
    }
    return ans;

}



@end
