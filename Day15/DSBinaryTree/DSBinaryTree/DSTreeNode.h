//
//  DSTreeNode.h
//  DSBinaryTree
//
//  Created by penghe on 2018/11/22.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DSTreeNode : NSObject

@property (nonatomic, strong) NSObject   *object;
@property (nonatomic, strong) DSTreeNode *leftChild;
@property (nonatomic, strong) DSTreeNode *rightChild;
@property (nonatomic, strong) DSTreeNode *parent;
@property (nonatomic, assign) SEL         compareSelector;


- (void)printDescription;
//是否是左还是结点
- (BOOL)isLeftChildOfParent;


@end

NS_ASSUME_NONNULL_END
