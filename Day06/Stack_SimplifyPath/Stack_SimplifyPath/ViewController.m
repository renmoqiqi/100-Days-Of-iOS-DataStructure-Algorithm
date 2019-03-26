//
//  ViewController.m
//  Stack_SimplifyPath
//
//  Created by penghe on 2019/3/25.
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
    NSLog(@"%@",[self simplifyPath:@"/a/./b//c//..//d"]);

}

- (NSString *)simplifyPath:(NSString *)inputStr
{
    
    NSMutableString *dirStr = [@"" mutableCopy];
    [dirStr appendString:@"/"];
    
    NSMutableArray *dirArray = [[inputStr componentsSeparatedByString:@"/"] mutableCopy];

    DSStack *newStack = [[DSStack alloc] initWithSize:20];
    for (int i = 0 ; i < dirArray.count; i++)
    {
        while ([dirArray[i] isEqualToString:@""])
        {
            i++;
        }
        while (i < dirArray.count && ![dirArray[i] isEqualToString:@""])
        {
            if ([dirArray[i] isEqualToString:@"."])
            {
                
            }
            else if ([dirArray[i] isEqualToString:@".."])
            {
                if (![newStack isEmpty]) {
                    [newStack popLastObject];
                }
            }
            else
            {
                [newStack push:dirArray[i]];

            }
            i++;
        }
    }
    DSStack *newStack1 = [[DSStack alloc] initWithSize:20];
    while (![newStack isEmpty])
    {
        [newStack1 push:[newStack popLastObject]];
    }
    
    while (![newStack1 isEmpty])
    {
        if ([newStack1 sizeOfStack]!= 1)
            {
                [dirStr appendFormat:@"%@/",[newStack1 popLastObject]];
            }
        else
            
        {
            [dirStr appendFormat:@"%@",[newStack1 popLastObject]];

        }
    }
    
    return dirStr;
}


- (NSString *)getCharByStr:(NSString *)inputStr index:(NSInteger)index
{
    unichar tempChar = [inputStr characterAtIndex:index];
    NSString *tempStr = [NSString stringWithCharacters:&tempChar length:1];
    return tempStr;
}
@end
