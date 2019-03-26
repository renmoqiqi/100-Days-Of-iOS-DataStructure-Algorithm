//
//  DSMinStack.m
//  Stack_MinStack
//
//  Created by penghe on 2019/3/26.
//  Copyright © 2019年 WondersGroup. All rights reserved.
//

#import "DSMinStack.h"
#import "DSStack.h"

@interface DSMinStack ()
@property (strong, nonatomic) DSStack *stack;
@property (strong, nonatomic) DSStack *minStack;

@end

@implementation DSMinStack

- (instancetype)initWithSize:(NSUInteger)size
{
    self = [super init];
    
    if (self) {
        
        _stack = [[DSStack alloc] initWithSize:20];
        _minStack = [[DSStack alloc] initWithSize:20];

        
    }
    return self;
}

- (void)popLastObject
{
    if (![_stack isEmpty])
    {
        [_stack popLastObject];
        [_minStack popLastObject];
    }
}
- (void)push:(id)object
{
    if ([_stack isEmpty])
    {
        [_stack push:[NSNumber numberWithInteger:[object integerValue]]];
        [_minStack push:[NSNumber numberWithInteger:[object integerValue]]];

    }
    else
    {
        [_stack push:[NSNumber numberWithInteger:[object integerValue]]];
        NSNumber *minObj;
        NSComparisonResult r = [[_stack peek] compare:[_minStack peek]];

        if (r == NSOrderedAscending)
        {
            minObj = [_stack peek];
            
        }
        else if(r == NSOrderedSame)
        {
            minObj = [_minStack peek];

        }
        else if(r == NSOrderedDescending)
        {
            minObj = [_minStack peek];
        }
       
        [_minStack push:minObj];
        
    }
}
- (id)peek
{
    if (![_stack isEmpty])
    {
        return [_stack peek];
    }
    return nil;
}
- (id)getMin
{
    if (![_minStack isEmpty])
    {
        return [_minStack peek];
    }
    return nil;
}
@end
