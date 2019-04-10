//
//  DSQueue.m
//  DataStructure_Queue
//
//  Created by penghe on 2018/5/11.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "DSQueue.h"

#pragma mark - Constants Define

//默认给数组一个默认的容量
static const int kDefaultCapacity = 10;
static const int kQueueCapacity = 100;

@interface DSQueue()
//队列容器
@property (nonatomic, strong) NSMutableArray *queueArray;
//头部索引
@property (nonatomic, assign) NSUInteger     headIndex;

@end

@implementation DSQueue

- (instancetype)init
{
    self = [super init];

    if (self) {
        _queueArray = [[NSMutableArray alloc] initWithCapacity:kDefaultCapacity];
        _headIndex = 0;
    }
    return self;
}

#pragma mark - Init with limited size of queue

- (instancetype)initWithSize:(NSUInteger)size
{
    self = [super init];
    
    if (self) {
        if (size > 0) {
            _queueArray = [[NSMutableArray alloc] initWithCapacity:size];
            _headIndex = 0;

        }
        else {
            NSAssert(size != 0, @"Queue size must be > 0");
        }
    }
    return self;
}


- (void)enqueue:(id)object
{

    if (object != nil) {
        [self.queueArray addObject:object];
        
    }
    else {
        NSAssert(object != nil, @"You can't push nil object to queue");
    }
}



//- (id)dequeue
//{
//    if ([self.queueArray count] > 0)
//    {
//        id object = [self peek];
//        [self.queueArray removeObjectAtIndex:0];
//        return object;
//    }
//
//    return nil;
//}

- (id)dequeue
{
    id object;
    if (self.headIndex < self.queueArray.count)
    {
        object = self.queueArray[self.headIndex];
    }
    else
    {
        return nil;

    }
    self.queueArray[self.headIndex] = [NSNull null];
    self.headIndex += 1;
    double percentage = (double)self.headIndex/(double)(self.queueArray.count);
    if (self.queueArray.count > kQueueCapacity && percentage > 0.25)
    {
        [self.queueArray removeObjectsInRange:NSMakeRange(0, self.headIndex)];
        self.headIndex = 0;
    }
    return object;
}

- (id)peek
{
    if ([self.queueArray count] > 0) {
        return (self.queueArray)[0];
    }
    
    return nil;
}

- (BOOL)isEmpty
{
    if (self.queueArray.count == 0)
    {
        return YES;
    }
    return NO;
}


- (NSInteger)countOfQueue
{
    return self.queueArray.count;
}

@end
