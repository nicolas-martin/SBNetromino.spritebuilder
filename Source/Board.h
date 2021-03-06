//
// Created by Nicolas Martin on 2014-07-08.
// Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCControl.h"

@class Tetromino;
@class Block;
extern NSString *const BlocksToAdd;
extern NSString *const BlocksToDelete;
extern NSString *const BlocksToMove;
extern NSUInteger const Nbx;
extern NSUInteger const Nby;

@interface Board : CCNode

@property int NbBlocks;

- (id)init;

- (void)touchMoved:(CCTouch *)touch;

- (void)touchBegan:(CCTouch *)touch;

- (void)touchEnded:(CCTouch *)touch;

- (BOOL)isBlockAt:(CGPoint)point;

- (NSMutableArray *)getAllBlocksInBoard;

- (Block *)getBlockAt:(CGPoint)point;

- (void)DeleteBlockFromBoard:(NSMutableArray *)blocks;

- (void)DeleteBlocksFromBoardAndSprite:(NSMutableArray *)blocks;

- (void)MoveBlock:(Block *)block to:(CGPoint)after;

- (BOOL)boardRowFull:(NSUInteger)y;

- (void)moveColumnUp:(NSUInteger)x;

- (NSMutableArray *)DeleteRow:(NSUInteger)y;

- (void)removeBlockAtPosition:(CGPoint)position;

- (NSMutableArray *)MoveBoardDown:(NSUInteger)y nbRowsToMoveDownTo:(NSUInteger)step;

- (void)addTetrominoToBoard:(NSMutableArray *)blocksToAdd;

- (void)printCurrentBoardStatus:(BOOL)withPosition;

- (void)addBlocks:(NSMutableArray *)blocksToAdd;

- (void)setPositionUsingFieldValue:(NSMutableArray *)arrayOfBlocks;

- (BOOL)moveDownOrCreate;

- (NSMutableArray *)checkForRowsToClear;

- (NSMutableArray *)deleteRowsAndReturnSpells:(NSMutableArray *)rowsToDelete;

@end