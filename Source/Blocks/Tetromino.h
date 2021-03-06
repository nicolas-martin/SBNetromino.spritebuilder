//
// Created by Nicolas Martin on 2014-07-19.
// Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLastColumn 9
#define kLastRow 19
#define rowoffset 3

typedef enum {
    T_block,
    L_block,
    J_block,
    Z_block,
    S_block,
    O_block,
    I_block,


} tetrominoType;
typedef enum {
    rotateCounterclockwise = -1,
    rotateNone = 0,
    rotateClockwise = 1
} RotationDirection;

typedef enum {
    moveLeft = -1,
    moveNone = 0,
    moveRight = 1
} MoveDirection;

@interface Tetromino : CCNode {
    BOOL stuck;
    CGPoint leftMostPosition;
    CGPoint rightMostPosition;
}
@property NSUInteger orientation;
@property NSMutableArray *blocksInTetromino;
@property BOOL stuck;
@property NSUInteger anchorX;
@property NSUInteger anchorY;
@property(nonatomic) CGPoint leftMostPosition;
@property(nonatomic) CGPoint rightMostPosition;
@property(nonatomic) CGPoint highestPosition;
@property(nonatomic) CGPoint lowestPosition;
@property tetrominoType type;

+ (Tetromino *)CreateRandomTetromino;

- (BOOL)isBlockInTetromino:(id)block;

- (void)moveTetrominoInDirection:(MoveDirection)direction;

- (void)moveTetrominoDown;

- (NSString *)description;

@end