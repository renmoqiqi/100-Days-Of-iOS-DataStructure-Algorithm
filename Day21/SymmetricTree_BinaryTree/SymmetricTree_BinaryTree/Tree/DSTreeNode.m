//
//  DSTreeNode.m
//  DSBinaryTree
//
//  Created by penghe on 2018/11/22.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "DSTreeNode.h"

@implementation DSTreeNode

- (instancetype)initNode:(NSObject *)node
{
    self = [super init];

    if (self)
    {
        self.object = node;
        self.leftChild = nil;
        self.rightChild = nil;

    }
    return self;
}

- (void)printDescription
{
    NSLog(@"%@", self.object);
    
    if (self.leftChild) {
        NSLog(@"Left child of %@ will be the -->", self.object);
        [self.leftChild printDescription];
    }
    
    if (self.rightChild) {
        NSLog(@"Right child of %@ will be the -->", self.object);
        [self.rightChild printDescription];
    }
}

- (BOOL)isLeftChildOfParent
{
    return self.parent.leftChild == self ? YES : NO;
}
@end
