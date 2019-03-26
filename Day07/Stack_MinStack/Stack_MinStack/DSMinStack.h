//
//  DSMinStack.h
//  Stack_MinStack
//
//  Created by penghe on 2019/3/26.
//  Copyright © 2019年 WondersGroup. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DSMinStack : NSObject

- (instancetype)initWithSize:(NSUInteger)size;

- (void)popLastObject;
- (void)push:(id)object;
- (id)peek;
- (id)getMin;

@end


