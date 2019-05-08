//
//  DSBinaryTree.m
//  DSBinaryTree
//
//  Created by penghe on 2018/11/22.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "DSBinaryTree.h"
#import "DSQueue.h"

#import "NSObject+DSComparisonForIOS.h"

@implementation DSBinaryTree

//初始化根结点
- (instancetype)initWithObject:(NSObject *)object
{
    if (self = [super init]) {
        _root            = [[DSTreeNode alloc] init];
        self.root.object = object;
    }
    
    return self;
}

//插入结点
- (BOOL)insertNode:(NSObject *)node parent:(NSObject *)parent isLeftChild:(BOOL)value
{
    DSTreeNode *treeNode = [[DSTreeNode alloc] init];
    treeNode.object = node;
    DSTreeNode *parentNode = [self find:parent];
    //如果插入的是左孩子结点并且左孩子结点不存在可以插入
    if (value == true && parentNode.leftChild == nil) {
        //插入的结点父结点是parent
        treeNode.parent = parentNode;
        //父结点的左孩子结点是当前结点
        parentNode.leftChild = treeNode;
    }
    //否则插入的是右孩子结点
    else if (parentNode.rightChild == nil) {
        treeNode.parent = parentNode;
        parentNode.rightChild = treeNode;
    }
    //如果某个结点的左右孩子结点都存在结束 并提示错误
    else {
        NSAssert(parentNode.leftChild != nil || parentNode.rightChild != nil, @"Can't insert into parent node!");
        return false;
    }
    return true;
}

//根据某个值查询这个结点是否在树中并返回
- (DSTreeNode *)find:(NSObject *)object
{
    //利用队列先进先出特性遍历每个结点
    DSQueue*queue = [[DSQueue alloc] init];
    [queue enqueue:self.root];
    DSTreeNode *node;
    //注意这个遍历的顺序是层级遍历顺序
    while (![queue isEmpty]) {
        node = [queue dequeue];
        if ([node.object isEqualTo:object]) {
            return node;
        }
        if (node.leftChild) {
            [queue enqueue:node.leftChild];
        }
        if (node.rightChild) {
            [queue enqueue:node.rightChild];
        }
    }
    return nil;
}

//如果当前根结点存在则前序遍历这个树
- (void)preOrderTraversal
{
    if (self.root) {
        [DSBinaryTree preOrderTraversalRecursive:self.root];
    }
}

//递归的遍历并打印树 顺序是根 左 右
+ (void)preOrderTraversalRecursive:(DSTreeNode *)node
{
    if (node) {
        NSLog(@"%@",node.object);
        [DSBinaryTree preOrderTraversalRecursive:node.leftChild];
        [DSBinaryTree preOrderTraversalRecursive:node.rightChild];
    }
}

- (void)inOrderTraversal
{
    if (self.root) {
        [DSBinaryTree inOrderTraversalRecursive:self.root];
    }
}


+ (void)inOrderTraversalRecursive:(DSTreeNode *)node
{
    if (node) {
        [DSBinaryTree inOrderTraversalRecursive:node.leftChild];
        NSLog(@"%@",node.object);
        [DSBinaryTree inOrderTraversalRecursive:node.rightChild];
    }
}

- (void)postOrderTraversal
{
    if (self.root) {
        [DSBinaryTree postOrderTraversalRecursive:self.root];
    }
}


+ (void)postOrderTraversalRecursive:(DSTreeNode *)node
{
    if (node) {
        [DSBinaryTree postOrderTraversalRecursive:node.leftChild];
        [DSBinaryTree postOrderTraversalRecursive:node.rightChild];
        NSLog(@"%@",node.object);
    }
}

//层级遍历的思路和上面查找的思路一样
- (void)levelOrderTraversal
{
    if (self.root) {
        DSQueue *queue = [[DSQueue alloc] init];
        [queue enqueue:self.root];
        
        while (![queue isEmpty]) {
            DSTreeNode *currentNode = [queue dequeue];
            if (currentNode.leftChild) {
                [queue enqueue:currentNode.leftChild];
            }
            if (currentNode.rightChild) {
                [queue enqueue:currentNode.rightChild];
            }
            NSLog(@"%@", currentNode.object);
        }
    }
}


@end
