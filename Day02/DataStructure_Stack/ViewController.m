//
//  ViewController.m
//  DataStructure_Stack
//
//  Created by penghe on 2018/5/7.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "ViewController.h"

#import "DSStack.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DSStack *testStack = [[DSStack alloc] initWithSize:10];
    [testStack push:@"1"];
    [testStack push:@"2"];
    [testStack push:@"5"];
    NSLog(@"%@",testStack);
    [testStack popLastObject];
    [testStack compressedStack];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
