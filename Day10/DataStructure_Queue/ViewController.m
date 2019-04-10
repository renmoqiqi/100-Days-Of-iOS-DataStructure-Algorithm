//
//  ViewController.m
//  DataStructure_Queue
//
//  Created by penghe on 2018/5/11.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "ViewController.h"
#import "DSQueue.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DSQueue *queue = [[DSQueue alloc] initWithSize:5];
    [queue enqueue:@"1"];
    [queue enqueue:@"2"];
    [queue enqueue:@"3"];
    [queue enqueue:@"4"];
    [queue enqueue:@"5"];

    NSLog(@"%@--%ld",queue,queue.countOfQueue);
    [queue dequeue];
    [queue dequeue];

    NSLog(@"%@--%ld",queue,queue.countOfQueue);



}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
