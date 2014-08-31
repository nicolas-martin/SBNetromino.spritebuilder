//
// Created by Nicolas Martin on 2014-07-09.
// Copyright (c) 2014 Apportable. All rights reserved.
//

#import "RandomRemove.h"
#import "Board.h"
#import "Field.h"


@implementation RandomRemove {
    NSString *spellName;
}

- (id)init {
    self = [super init];
    if (self) {
        spellName = @"Random Remove";
        self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"Assets/RandomRemove.png"];

    }

    return self;
}

- (NSString *)LogSpell:(Board *)targetBoard {
    return [NSString stringWithFormat:@"%@ was casted on %@", spellName, targetBoard.Name];


}

- (void)CastSpell:(Board *)targetBoard Sender:(Field *)senderField {
    NSMutableArray *allBlockInBoard = [targetBoard getAllBlocksInBoard];
    NSMutableArray *blocksToDelete = [NSMutableArray array];

    NSUInteger nbBlockInBoard = allBlockInBoard.count;

    //Removes 20% of all the blocks

    NSUInteger nbBlocksToRemove = (NSUInteger )(nbBlockInBoard / 20);

    for (NSUInteger i = 0; i < nbBlocksToRemove; i++)
    {
        NSUInteger random = arc4random() % nbBlockInBoard;

        Block *block = [allBlockInBoard objectAtIndex:random];

        if (block)
        {
            [blocksToDelete addObject:block];
        }

    }


    [targetBoard DeleteBlockFromBoardAndSprite:blocksToDelete];

    CCLOG(@"%@", [self LogSpell:targetBoard]);
}


@end