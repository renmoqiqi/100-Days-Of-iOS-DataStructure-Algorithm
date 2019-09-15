//
//  ViewController.m
//  Path_sum_III_BinaryTree
//
//  Created by penghe on 2019/9/15.
//  Copyright © 2019 renmoqiqi. All rights reserved.
//

#import "ViewController.h"
#import "DSBinaryTree.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation ViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    DSBinaryTree *tree = [[DSBinaryTree alloc] initWithObject:@10];
    [tree insertNode:@5 parent:@10 isLeftChild:YES];
    [tree insertNode:@-3 parent:@10 isLeftChild:NO];
    [tree insertNode:@3 parent:@5 isLeftChild:YES];
    [tree insertNode:@2 parent:@5 isLeftChild:NO];
    [tree insertNode:@11 parent:@-3 isLeftChild:NO];
    [tree insertNode:@3 parent:@3 isLeftChild:YES];
    [tree insertNode:@-2 parent:@3 isLeftChild:NO];
    [tree insertNode:@1 parent:@2 isLeftChild:NO];
    [self printPathUtil:tree.root sum:8];


}

- (void)printPathUtil:(DSTreeNode *)root sum:(int)sum
{
    
    if (!root) {
        return;
    }
    NSNumber *rootNodeNumber = (NSNumber *)root.object;
    [self.dataArray addObject:rootNodeNumber];
    [self printPathUtil:root.leftChild sum:sum];
    [self printPathUtil:root.rightChild sum:sum];

    int tempSum = 0;

    for (int j = (int)self.dataArray.count - 1; j>=0; j--)
    {
        int dataElemet = [self.dataArray[j] intValue];
        tempSum += dataElemet;

        if (tempSum == sum)
        {
            [self printArrayPath:self.dataArray index:j];
        }
    }
    [self.dataArray removeObjectAtIndex:self.dataArray.count-1];

}

- (void)printArrayPath:(NSMutableArray *)pathArray index:(int)index
{
    NSMutableString *tempPathString = [@"" mutableCopy];
    for (int j = index; j < (int)pathArray.count; j++)
    {
        [tempPathString appendString:[NSString stringWithFormat:@"%@ ",pathArray[j]]];
    }
    NSLog(@"%@",tempPathString);


}
@end
