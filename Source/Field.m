//
// Created by Nicolas Martin on 2014-07-08.
// Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Field.h"
#import "Inventory.h"
#import "Board.h"
#import "Tetromino.h"
#import "Block.h"


@implementation Field {
    Inventory *_inventory;
    Board *_board;
    CCLabelTTF *_nbRowCleared;

}

- (void) didLoadFromCCB {

}

-(void) addSpellsToInventory:(NSMutableArray *)spellsToAdd{
    for (id <ICastable> spell in spellsToAdd)
    {
        [_inventory addSpell:spell];
    }
}

- (void) moveDownOrCreate {

    NSMutableArray *rows = _board.checkForRowsToClear;
    if (rows.count > 0)
    {
        NSMutableArray *spellsToAdd = [_board deleteRowsAndReturnSpells:rows];
        if (spellsToAdd.count > 0)
        {
            [self addSpellsToInventory:spellsToAdd];

        }
        _nbRowCleared.string = [NSString stringWithFormat:@"%d", (int) _nbRowCleared.string.integerValue + rows.count];

    }
    _board.moveDownOrCreate;


}


@end