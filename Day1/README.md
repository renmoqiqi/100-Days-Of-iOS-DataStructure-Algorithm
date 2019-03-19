
#  100天iOS数据结构与算法实战 Day02 - 栈
## 栈的特性
栈 的特性是先进后出。
## 动画描述
![进栈动画](https://upload-images.jianshu.io/upload_images/1304277-f3d53727a40f52cb.gif?imageMogr2/auto-orient/strip)
![出栈动画](https://upload-images.jianshu.io/upload_images/1304277-611d295b2a69a863.gif?imageMogr2/auto-orient/strip)

## 栈最常见的场景
* 栈在iOS开发中常见的是导航栈，push pop 操作就是这种进栈出栈的操作。
* 你调用函数的时候，这个返回地址被放到栈中，当函数结束时，使用该返回地址跳回调用者，这是记录函数调用过程的完美体现。

## 和栈有关的算法题目
* [Valid Parentheses](https://www.programcreek.com/2012/12/leetcode-valid-parentheses-java/)
* [Basic Calculator](https://www.programcreek.com/2014/06/leetcode-basic-calculator-java/)
* [Evaluate Reverse Polish Notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation)
* [Implement Queue using Stacks](https://leetcode.com/problems/implement-queue-using-stacks/)
* [Implement Stack using Queues](https://leetcode.com/problems/implement-stack-using-queues/)
* [Simplify Path](https://leetcode.com/problems/simplify-path/)

## 实现方式
主要有两种方法来实现栈：使用数组，使用链表。我们代码是用数组来实现的。

## 栈的基本操作方式
```
DSStack *testStack = [[DSStack alloc] initWithSize:4];
    [testStack push:@"1"];
    [testStack push:@"2"];
    [testStack push:@"5"];
    [testStack popLastObject];
    NSLog(@"%@",testStack);
```
## 主要代码
```
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
```
初始化给定大小，这样是有好处的。因为如果数组容量满的时候为了增加容量，频繁的动态创建数组 copy数组会消耗一定的内存

```
- (void)push:(id)object
{
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
```
如果当前数组填充满了 则创建一个两倍容量的数组copy一份给原来的数组 
```
- (id)popLastObject

{

    id object = [self peek];

    [self.stackArray removeLastObject];

    return object;

}
```
如果当前数组不为空，存在数组最后一个对象则直接返回 并移除掉。

## 优化：
提供了一个初始化传入size的值是为了预估空间比较合理。如果没有预估好，频繁扩容会造成不断申请内存然后copy。举个例子提前初始化容量和不指定容量的对比效果图看下图：
![对比图](https://upload-images.jianshu.io/upload_images/1304277-eff0708a048c4a18.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 为了避免这个问题提供一个压缩空间的方法
```
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
```
如果当前栈内元素个数小于容量的90% ，那么压缩栈把容量设置为当前栈的实际元素个数。
## 栈操作复杂度
压栈操作是将新元素压入数组的尾部，而不是头部。在数组的头部插入元素是一个很耗时的操作，它的时间复杂度为 O(n)，因为需要将现有元素往后移位为新元素腾出空间。而在尾部插入元素的时间复杂度为 O(1)；无论数组有多少元素，这个操作所消耗的时间都是一个常量。
## 栈的实现Demo
[https://github.com/renmoqiqi/100-Days-Of-iOS-DataStructure-Algorithm/tree/master/Day1)
