//
//  DSQueue.h
//  DataStructure_Queue
//
//  Created by penghe on 2018/5/11.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSQueue : NSObject

//初始化队列的方法最好提前定义好size 的大小后面避免频繁的动态扩容影响性能
- (instancetype)initWithSize:(NSUInteger)size;
//进队列
- (void)enqueue:(id)object;
//出队列
- (id)dequeue;
//是否为空
- (BOOL)isEmpty;
//队列的大小
- (NSInteger)countOfQueue;




@end
