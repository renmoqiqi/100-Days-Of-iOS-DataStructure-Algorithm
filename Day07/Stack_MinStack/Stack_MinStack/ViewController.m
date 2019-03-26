//
//  ViewController.m
//  Stack_MinStack
//
//  Created by penghe on 2019/3/26.
//  Copyright © 2019年 WondersGroup. All rights reserved.
//

#import "ViewController.h"
#import "DSMinStack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DSMinStack *minStack = [[DSMinStack alloc] initWithSize:10];
    [minStack push:@-2];
    [minStack push:@0];
    [minStack push:@-3];
    NSLog(@"%@",[minStack getMin]);
    [minStack popLastObject];
    [minStack popLastObject];
    NSLog(@"%@",[minStack getMin]);

}


@end
