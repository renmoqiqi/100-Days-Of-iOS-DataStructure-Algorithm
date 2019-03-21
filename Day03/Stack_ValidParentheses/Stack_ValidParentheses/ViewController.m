//
//  ViewController.m
//  Stack_ValidParentheses
//
//  Created by penghe on 2019/3/20.
//  Copyright © 2019年 WondersGroup. All rights reserved.
//

#import "ViewController.h"

#import "DSStack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self isValid:@"({})[]"] == YES) {
        NSLog(@"valid");
    }
    else
    {
        NSLog(@"invalid");
    }
    
}

- (BOOL)isValid:(NSString *)inputStr
{
    if (inputStr.length == 0 || inputStr.length%2 == 1)
    {
        return NO;
    }

    DSStack *newStack = [[DSStack alloc] initWithSize:10];
    
    for (int i =0 ; i<inputStr.length; i++)
    {
        unichar tempChar = [inputStr characterAtIndex:i];
        if (tempChar =='(' || tempChar =='{' || tempChar == '[')
        {
            [newStack push:[NSString stringWithCharacters:&tempChar length:1]];
        }
        else
        {
            if (newStack && [self isPairLeftAndRight:[newStack peek] right:[NSString stringWithCharacters:&tempChar length:1]])
            {
                [newStack popLastObject];
            }
            else
            {
                return NO;
            }
        }
    }
  
    
    return [newStack isEmpty];
    
}

- (BOOL)isPairLeftAndRight:(NSString *)left right:(NSString *)right
{
    return ([left isEqualToString:@"("] && [right isEqualToString:@")"])||([left isEqualToString:@"{"] && [right isEqualToString:@"}"]) || ([left isEqualToString:@"["] && [right isEqualToString:@"]"]);
}

@end
