//
//  PMPlayingDeck.m
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "PMPlayingCardDeck.h"
#import "PMPlayingCard.h"

@implementation PMPlayingCardDeck

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        for (NSString *suit in [PMPlayingCard validSuits]) {
            for (int rank = 1; rank <= [PMPlayingCard maxRank]; rank++) {
                PMPlayingCard *card = [[PMPlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard: card];
            }
        }
    }
    return self;
}

@end
