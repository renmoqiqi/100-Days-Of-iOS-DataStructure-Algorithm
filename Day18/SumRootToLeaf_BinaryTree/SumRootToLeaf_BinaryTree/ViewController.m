//
//  ViewController.m
//  SumRootToLeaf_BinaryTree
//
//  Created by penghe on 2019/7/28.
//  Copyright © 2019 renmoqiqi. All rights reserved.
//

#import "ViewController.h"
#import "DSBinaryTree.h"

@interface ViewController ()

@property (assign, nonatomic) NSInteger sumTotal;

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


    NSLog(@"%ld",(long)[self sumNumbers:tree.root]);

}

- (NSInteger)sumNumbers:(DSTreeNode *)rootNode
{
    self.sumTotal = 0;
    [self helper:rootNode sum:0];
    return self.sumTotal;

}

- (void)helper:(DSTreeNode *)rootNode sum:(NSInteger)sum
{
    if (rootNode == nil)
    {
        return;
    }
    NSNumber *rootNodeNumber = (NSNumber *)rootNode.object;
    sum = sum * 10 + [rootNodeNumber intValue];

    if (rootNode.leftChild == nil && rootNode.rightChild == nil) {
        self.sumTotal += sum;
        return;
    }
    [self helper:rootNode.leftChild sum:sum];
    [self helper:rootNode.rightChild sum:sum];

}


@end
