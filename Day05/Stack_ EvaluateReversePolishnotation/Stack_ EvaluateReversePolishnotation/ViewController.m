//
//  ViewController.m
//  Stack_ EvaluateReversePolishnotation
//
//  Created by penghe on 2019/3/24.
//  Copyright © 2019年 WondersGroup. All rights reserved.
//

#import "ViewController.h"
#import "DSStack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    int reslut = [self evaluateRPN:@"32+46+*"];
    NSLog(@"%d",reslut);


}

- (int)evaluateRPN:(NSString *)inputStr
{
    DSStack *newStack = [[DSStack alloc] initWithSize:10];
    for (int i =0 ; i<inputStr.length; i++)
    {
        unichar tempChar = [inputStr characterAtIndex:i];
        if ([[NSString stringWithCharacters:&tempChar length:1] isEqualToString:@"*"])
        {
            NSNumber *a = [newStack popLastObject];
            NSNumber *b = [newStack popLastObject];
            [newStack push:[NSNumber numberWithInt:([a intValue]*[b intValue])]];
        }
        else if ([[NSString stringWithCharacters:&tempChar length:1] isEqualToString:@"/"])
        {
            NSNumber *a = [newStack popLastObject];
            NSNumber *b = [newStack popLastObject];
            [newStack push:[NSNumber numberWithInt:([a intValue]/[b intValue])]];
        }
        else if ([[NSString stringWithCharacters:&tempChar length:1] isEqualToString:@"+"])
        {
            NSNumber *a = [newStack popLastObject];
            NSNumber *b = [newStack popLastObject];
            [newStack push:[NSNumber numberWithInt:([a intValue]+[b intValue])]];
        }
        else if ([[NSString stringWithCharacters:&tempChar length:1] isEqualToString:@"-"])
        {
            NSNumber *a = [newStack popLastObject];
            NSNumber *b = [newStack popLastObject];
            [newStack push:[NSNumber numberWithInt:([a intValue]-[b intValue])]];
        }
        else
        {

            [newStack push:[NSNumber numberWithInt:[[NSString stringWithCharacters:&tempChar length:1] intValue]]];
        }

    }
    return [[newStack popLastObject] intValue];

}

@end
