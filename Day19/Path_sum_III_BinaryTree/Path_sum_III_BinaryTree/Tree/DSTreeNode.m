//
//  DSTreeNode.m
//  DSBinaryTree
//
//  Created by penghe on 2018/11/22.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "DSTreeNode.h"

@implementation DSTreeNode

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
