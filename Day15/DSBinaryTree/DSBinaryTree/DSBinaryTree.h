//
//  DSBinaryTree.h
//  DSBinaryTree
//
//  Created by penghe on 2018/11/22.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSTreeNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface DSBinaryTree : NSObject
@property (nonatomic, strong) DSTreeNode *root;

- (instancetype)initWithObject:(NSObject *)object;
- (BOOL)insertNode:(DSTreeNode *)node parent:(DSTreeNode *)parent isLeftChild:(BOOL)value;
- (DSTreeNode *)find:(NSObject *)object;

- (void)preOrderTraversal;
- (void)inOrderTraversal;
- (void)postOrderTraversal;
- (void)levelOrderTraversal;

@end

NS_ASSUME_NONNULL_END
