//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "PMCardMatchingGame.h"
#import "PMDeck.h"
#import "PMCard.h"

@interface PMCardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card

@end

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

@implementation PMCardMatchingGame

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(PMDeck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            PMCard *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject: card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (PMCard *) cardAtIndex: (NSUInteger) index {
    
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (void) chooseCardAtIndex: (NSUInteger) index
{
    PMCard *card = [self cardAtIndex: index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against another card
            for (PMCard *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match: @[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}


@end
