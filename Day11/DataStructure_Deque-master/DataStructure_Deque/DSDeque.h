//
//  DSDeque.h
//  DataStructure_Deque
//
//  Created by penghe on 2018/5/30.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSDeque : NSObject

- (instancetype)init;
- (BOOL)isEmpty;
- (NSInteger)countOfQueue;
- (void)enqueue:(id)object;
- (void)enqueueFront:(id)object;
- (id)dequeue;
- (id)dequeueBack;
- (id)peekFront;
- (id)peekBack;

@end
