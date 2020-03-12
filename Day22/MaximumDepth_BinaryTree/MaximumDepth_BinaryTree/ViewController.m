//
//  ViewController.m
//  MaximumDepth_BinaryTree
//
//  Created by penghe on 2020/3/12.
//  Copyright © 2020 renmoqiqi. All rights reserved.
//

#import "ViewController.h"
#import "DSBinaryTree.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DSBinaryTree *tree = [[DSBinaryTree alloc] initWithObject:@1];
      [tree insertNode:@2 parent:@1 isLeftChild:YES];
      [tree insertNode:@3 parent:@1 isLeftChild:NO];
      [tree insertNode:@4 parent:@2 isLeftChild:YES];
      [tree insertNode:@5 parent:@2 isLeftChild:NO];

    NSLog(@"%ld",(long)[self maxDepthOfTree:tree.root]);
}


- (NSInteger)maxDepthOfTree:(DSTreeNode *)root
{
    if (root == nil)
    {
        return 0;
    }
    else
    {
        NSInteger left_height = [self maxDepthOfTree:root.leftChild];
        NSInteger right_height = [self maxDepthOfTree:root.rightChild];
        return MAX(left_height, right_height)+1;

    }
}

@end
