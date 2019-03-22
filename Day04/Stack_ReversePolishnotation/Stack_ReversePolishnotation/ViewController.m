//
//  ViewController.m
//  Stack_ReversePolishnotation
//
//  Created by penghe on 2019/3/22.
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
   NSString *str = [self infixToPostfix:@"(3+2)*(4+6)"];
    NSLog(@"%@",str);
}

- (int)operatorOfPriority:(NSString *)tempChar
{
    if ([tempChar isEqualToString:@"+"]||[tempChar isEqualToString:@"-"]) {
        return 1;

    }
    else if ([tempChar isEqualToString:@"*"]||[tempChar isEqualToString:@"/"]) {
        return 2;
        
    }
    
    return -1;
}

-(BOOL)inputShouldNumber:(NSString *)inputString
{
    if (inputString.length == 0)
        return NO;
    NSString *regex = @"^[0-9]+([.]{0,1}[0-9]+){0,1}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:inputString];
}


- (NSString *)infixToPostfix:(NSString *)inputStr
{
    NSMutableString *resultsStr = [@"" mutableCopy];
    
    DSStack *newStack = [[DSStack alloc] initWithSize:10];
    
    for (int i =0 ; i<inputStr.length; i++)
    {
        unichar tempChar = [inputStr characterAtIndex:i];
        
        if ([self inputShouldNumber:[NSString stringWithCharacters:&tempChar length:1]])
        {
            [resultsStr appendString:[NSString stringWithCharacters:&tempChar length:1]];
        }
        else if ([[NSString stringWithCharacters:&tempChar length:1] isEqualToString:@"("])
        {
            [newStack push:[NSString stringWithCharacters:&tempChar length:1]];
        }
        else if ([[NSString stringWithCharacters:&tempChar length:1] isEqualToString:@")"])
        {
            while ([newStack sizeOfStack] > 0 && ![[newStack peek] isEqualToString:@"("])
            {
                [resultsStr appendString:[newStack popLastObject]];
            }
            
            if ([newStack sizeOfStack] > 0 && ![[newStack peek] isEqualToString:@"("])
            {
                return @"无效的表达式";
            }
            else
            {
                [newStack popLastObject];
            }
            
        }
        else
        {
            while ([newStack sizeOfStack] > 0 && [self operatorOfPriority:[NSString stringWithCharacters:&tempChar length:1]] <= [self operatorOfPriority:[newStack peek]])
            {
                [resultsStr appendString:[newStack popLastObject]];
            }
            [newStack push:[NSString stringWithCharacters:&tempChar length:1]];
        }
    }
    
    while ([newStack sizeOfStack] > 0)
    {
        [resultsStr appendString:[newStack popLastObject]];
        
    }
    
    return resultsStr;
}
    
@end
