//
//  ViewController.m
//  SameTree_BinaryTree
//
//  Created by penghe on 2019/9/28.
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

    DSBinaryTree *tree1 = [[DSBinaryTree alloc] initWithObject:@1];
     [tree1 insertNode:@2 parent:@1 isLeftChild:YES];

    DSBinaryTree *tree2 = [[DSBinaryTree alloc] initWithObject:@1];
    [tree2 insertNode:@2 parent:@1 isLeftChild:NO];

    if ([self sameTree:tree1.root q:tree2.root])
    {
        NSLog(@"YES");
    }
    else
    {
        NSLog(@"NO");

    }
}

- (BOOL)sameTree:(DSTreeNode *)p q:(DSTreeNode *)q
{
    if (p == nil && q == nil)
    {
        return YES;
    }
    if (p == nil || q == nil)
    {
        return NO;
    }

    NSNumber *pNodeNumber = (NSNumber *)p.object;
    NSNumber *qNodeNumber = (NSNumber *)q.object;

    if (![pNodeNumber isEqualToNumber:qNodeNumber])
    {
        return NO;

    }
    return [self sameTree:p.rightChild q:q.rightChild] && [self sameTree:p.leftChild q:q.leftChild];
}



@end
