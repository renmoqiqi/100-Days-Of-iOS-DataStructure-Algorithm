//
//  ViewController.m
//  Tree_BTPaths
//
//  Created by penghe on 2019/5/7.
//  Copyright © 2019 renmoqiqi. All rights reserved.
//

#import "ViewController.h"
#import "DSBinaryTree.h"
#import "DSTreeNode.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DSBinaryTree *tree = [[DSBinaryTree alloc] initWithObject:@1];
    [tree insertNode:@2 parent:@1 isLeftChild:YES];
    [tree insertNode:@3 parent:@1 isLeftChild:NO];
    [tree insertNode:@5 parent:@2 isLeftChild:NO];

    NSMutableArray <NSString *> *results = [NSMutableArray array];
    
    [self printPathsRecurTreeNode:tree.root path:@""  results:results];
    NSLog(@"%@",results);
}


- (void )printPathsRecurTreeNode:(DSTreeNode *)treeNode path:(NSString *)path results:(NSMutableArray <NSString *>*)results
{
    if (treeNode == nil) {
        return;
    }
    if (treeNode.leftChild == nil && treeNode.rightChild == nil)
    {
        NSString *resultsStr = [NSString stringWithFormat:@"%@%@",path,treeNode.object];
        [results addObject:resultsStr];

    }
    else
    {
        if (treeNode.leftChild != nil)
        {
            NSString *resultsStr = [NSString stringWithFormat:@"%@%@",path,[NSString stringWithFormat:@"%@->",treeNode.object]];

            [self printPathsRecurTreeNode:treeNode.leftChild path:resultsStr results:results];
        }
        if (treeNode.rightChild != nil )
        {
            NSString *resultsStr = [NSString stringWithFormat:@"%@%@",path,[NSString stringWithFormat:@"%@->",treeNode.object]];
            [self printPathsRecurTreeNode:treeNode.rightChild path:resultsStr results:results];
        }
    }
    

}

@end
