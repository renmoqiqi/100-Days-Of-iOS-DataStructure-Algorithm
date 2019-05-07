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

    NSMutableArray <NSMutableString *> *results = [NSMutableArray array];
    
    [self printPathsRecurTreeNode:tree.root path:[[NSString stringWithFormat:@"%@",tree.root.object] mutableCopy] results:results];
    NSLog(@"%@",results);
}


- (void )printPathsRecurTreeNode:(DSTreeNode *)treeNode path:(NSMutableString *)path results:(NSMutableArray <NSMutableString *>*)results
{
    if (treeNode == nil) {
        return;
    }
    if (treeNode.leftChild == nil && treeNode.rightChild == nil)
    {
        [results addObject:path];
    }
    if (treeNode.leftChild != nil)
    {
        [path appendString:[NSString stringWithFormat:@"->%@",treeNode.leftChild.object]];
        [self printPathsRecurTreeNode:treeNode.leftChild path:path results:results];
    }
    if (treeNode.rightChild != nil )
    {
        [path appendString:[NSString stringWithFormat:@"->%@",treeNode.rightChild.object]];
        [self printPathsRecurTreeNode:treeNode.rightChild path:path results:results];
    }

}

@end
