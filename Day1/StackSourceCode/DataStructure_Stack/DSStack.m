//
//  DSStack.m
//  DataStructure_Stack
//
//  Created by penghe on 2018/5/7.
//  Copyright © 2018年 WondersGroup. All rights reserved.
//

#import "DSStack.h"

#pragma mark - Constants Define

//默认给数组一个默认的容量
static const int kDefaultCapacity = 4;

@interface DSStack ()
//数组容器
@property (nonatomic, strong) NSMutableArray *stackArray;
//容器可存储元素的最大容量
@property (nonatomic, assign) NSUInteger     maxStackSize;

@end

@implementation DSStack

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _stackArray = [[NSMutableArray alloc] initWithCapacity:kDefaultCapacity];
        _maxStackSize = kDefaultCapacity;

    }
    return self;
}

#pragma mark - Init with limited size of stack

- (instancetype)initWithSize:(NSUInteger)size
{
    self = [super init];
    
    if (self) {
        if (size > 0) {
            _stackArray = [[NSMutableArray alloc] initWithCapacity:size];
            _maxStackSize = size;
        }
        else {
            NSAssert(size != 0, @"Stack size must be > 0");
        }
    }
    return self;
}

#pragma mark - Public API

- (id)popLastObject
{
    id object = [self peek];
    [self.stackArray removeLastObject];
    
    return object;
}

- (void)push:(id)object
{
    //如果当前数组填充满了 则创建一个两倍容量的数组copy一份给原来的数组 用容量的方式初始化数组为了避免容量满的时候的频繁创建内容 copy等操作会有一个效率问题
    if ([self isFull] && self.maxStackSize) {
        
        NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:_maxStackSize*2];
        self.stackArray = [newArray mutableCopy];
        _maxStackSize = _maxStackSize*2;

    }
    if (object != nil) {
        [self.stackArray addObject:object];

    }
    else {
        NSAssert(object != nil, @"You can't push nil object to stack");
    }
}

- (id)peek
{
    if ([self.stackArray count] > 0) {
        return [self.stackArray lastObject];
    }
    
    return nil;
}

- (NSInteger)sizeOfStack
{
    return (NSInteger)[self.stackArray count];
}

- (BOOL)isEmpty
{
    return [self.stackArray count] == 0;
}

- (BOOL)isFull
{
    return ([self sizeOfStack] == (NSInteger)self.maxStackSize) ? YES : NO;
}

- (void)clear
{
    [self.stackArray removeAllObjects];
}

- (NSArray *)allObjectsFromStack
{
    NSMutableArray *buffer = [NSMutableArray array];
    
    for (id object in self.stackArray) {
        [buffer addObject:object];
    }
    
    return [buffer copy];
}

//如果当前栈内元素个数小于容量的90% 那么压缩栈把容量设置为当前栈的实际元素个数
- (void)compressedStack
{
    int capacitySize = (int)(_maxStackSize * 0.9);
    int stackSize = (int)(self.stackArray.count);
    if( stackSize < capacitySize ) {
        NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:stackSize];
        self.stackArray = [newArray mutableCopy];
        _maxStackSize = stackSize;

    }
}
@end
