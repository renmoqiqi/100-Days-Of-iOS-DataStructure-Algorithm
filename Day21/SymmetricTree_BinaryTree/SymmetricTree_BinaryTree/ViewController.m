//
//  ViewController.m
//  SymmetricTree_BinaryTree
//
//  Created by penghe on 2019/10/5.
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
    tree.root.leftChild = [[DSTreeNode alloc] initNode:@2];
    tree.root.rightChild = [[DSTreeNode alloc] initNode:@2];
    tree.root.leftChild.leftChild = [[DSTreeNode alloc] initNode:@3];
    tree.root.leftChild.rightChild = [[DSTreeNode alloc] initNode:@4];
    tree.root.rightChild.leftChild = [[DSTreeNode alloc] initNode:@4];
    tree.root.rightChild.rightChild = [[DSTreeNode alloc] initNode:@3];

    if ([self isSymmetric:tree.root])
    {
        NSLog(@"isSymmetric");
    }
    else
    {
        NSLog(@"notSymmetric");

    }
}

- (BOOL)isSymmetric:(DSTreeNode *)root
{
   return  [self isMirrorNode1:root node2:root];
}



- (BOOL)isMirrorNode1:(DSTreeNode *)node1 node2:(DSTreeNode *)node2
{
    if (node1 == nil && node2 == nil)
    {
      return YES;
    }
    if (node1 == nil || node2 == nil)
    {
       return NO;
    }
    NSNumber *leftNodeNumber = (NSNumber *)node1.object;
    NSNumber *rightNodeNumber = (NSNumber *)node2.object;

    return ([leftNodeNumber isEqualToNumber:rightNodeNumber])
        && [self isMirrorNode1:node1.rightChild node2:node2.leftChild]
        && [self isMirrorNode1:node1.leftChild node2:node2.rightChild];
}

@end
