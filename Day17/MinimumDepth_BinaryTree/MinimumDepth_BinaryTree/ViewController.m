//
//  ViewController.m
//  MinimumDepth_BinaryTree
//
//  Created by penghe on 2019/6/9.
//  Copyright © 2019 renmoqiqi. All rights reserved.
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


    NSLog(@"%d",[self minimumDepth:tree.root]);

}


- (int)minimumDepth:(DSTreeNode *)root
{
    if (root == nil) {
        return 0;
    }
    if (root.leftChild == nil) {
        return [self minimumDepth:root.rightChild]+1;

    }
    if (root.rightChild == nil) {
        return [self minimumDepth:root.leftChild]+1;

    }
    return MIN([self minimumDepth:root.leftChild], [self minimumDepth:root.rightChild])+1;

}

@end
