//
//  DSDeque.m
//  DataStructure_Deque
//
//  Created by penghe on 2018/5/30.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "DSDeque.h"

static const int kDequeCapacity = 100;
static const int kSpaceCapacity = 0.75;


@interface DSDeque()

@property (nonatomic, assign) NSUInteger headIndex;
@property (nonatomic, assign) NSUInteger capacity;
@property (nonatomic, strong) NSMutableArray *dequeArray;

@end

@implementation DSDeque
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.capacity = 10;
        
        _dequeArray = [[NSMutableArray alloc] initWithCapacity:self.capacity];
        
        for (int i=0; i<self.capacity;i++)
        {
            _dequeArray[i] = [NSNull null];

        }
        self.headIndex  = self.capacity;
    }
    return self;
}

- (BOOL)isEmpty
{
    if (self.dequeArray.count == 0)
    {
        return YES;
    }
    return NO;
    
}
- (NSInteger)countOfQueue
{
    return self.dequeArray.count;

}
- (void)enqueue:(id)object
{
    [self.dequeArray addObject:object];
}
- (void)enqueueFront:(id)object
{
    //如果头部没有更多的空间
    if (self.headIndex == 0)
    {
        //创建之前大小容量的空白的元素 就是容量翻倍 注意由于iOS的数组不能插入nil 所以我们用NSNull占位
        for (int i=0; i<self.capacity;i++)
        {
            [self.dequeArray insertObject:[NSNull null] atIndex:0];
            
        }
        self.capacity *=2;
        //然后头部的索引移动到容器最后面
        self.headIndex = self.capacity;
    }
    //如果头部还有很多的空间 然后索引前移
    self.headIndex -= 1;
    self.dequeArray[self.headIndex] = object;
    
}
- (id)dequeue
{
    //正常的出队列 当前容器null占位 索引后移
    id object;
    if (self.headIndex < self.countOfQueue)
    {
        object = self.dequeArray[self.headIndex];
    }
    else
    {
        return nil;
    }
    self.dequeArray[self.headIndex] = [NSNull null];
    self.headIndex += 1;
    //清理机制
    double percentage = (double)self.headIndex/(double)(self.dequeArray.count);
    if (self.capacity > kDequeCapacity && percentage>kSpaceCapacity) {
        NSInteger amountToRemove = self.capacity*kSpaceCapacity;
        [self.dequeArray removeObjectsInRange:NSMakeRange(0, amountToRemove)];
        //注意清理了数组前面的空白元素指向头部元素的索引移动
        self.headIndex -= amountToRemove;
        self.capacity = self.dequeArray.count;
    }
    return object;
    
}
- (id)dequeueBack
{
    if (self.isEmpty)
    {
        return nil;
    }
    else
    {
        id object = self.dequeArray.lastObject;
        [self.dequeArray removeLastObject];
        return object;
    }
}
- (id)peekFront
{
    if (self.isEmpty)
    {
        return nil;
    }
    else
    {
        return self.dequeArray.firstObject;
    }
}
- (id)peekBack
{
    if (self.isEmpty)
    {
        return nil;
    }
    else
    {
        return self.dequeArray.lastObject;
    }
}
@end
