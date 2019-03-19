//
//  DSStack.h
//  DataStructure_Stack
//
//  Created by penghe on 2018/5/7.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSStack : NSObject

- (instancetype)initWithSize:(NSUInteger)size;

- (id)popLastObject;
- (void)push:(id)object;
- (id)peek;
- (NSInteger)sizeOfStack;
- (BOOL)isEmpty;
- (BOOL)isFull;
- (void)clear;
- (NSArray *)allObjectsFromStack;

@end
