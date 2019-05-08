//
//  ViewController.m
//  DSBinaryTree
//
//  Created by penghe on 2018/11/22.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "ViewController.h"
#import "DSBinaryTree.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DSBinaryTree *tree = [[DSBinaryTree alloc] initWithObject:@1];
    [tree insertNode:@2 parent:@1 isLeftChild:YES];
    [tree insertNode:@3 parent:@1 isLeftChild:NO];
    [tree insertNode:@5 parent:@2 isLeftChild:NO];

}


@end
