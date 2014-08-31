//
// Created by Nicolas Martin on 2014-07-09.
// Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Nuke.h"
#import "Field.h"
#import "Board.h"


@implementation Nuke {
    NSString *spellName;
}

- (id)init {
    self = [super init];
    if (self) {
        spellName = @"Nuke";
        self.spriteFrame = [CCSpriteFrame frameWithImageNamed: @"Assets/Nuke.png"];
    }

    return self;
}

- (void)CastSpell:(Board *)targetBoard Sender:(Field *)senderField {

    [targetBoard DeleteBlockFromBoardAndSprite:[targetBoard getAllBlocksInBoard]];

    CCLOG(@"%@", [self LogSpell:targetBoard]);
}

- (NSString *)LogSpell:(Board *)targetBoard {
    return [NSString stringWithFormat:@"%@ was casted on %@", spellName, targetBoard.Name];
}

@end