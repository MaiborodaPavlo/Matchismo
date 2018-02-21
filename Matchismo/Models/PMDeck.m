//
//  PMDeck.m
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "PMDeck.h"
#import "PMCard.h"

@interface PMDeck ()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation PMDeck

- (NSMutableArray *) cards {
    
    if (!_cards) {
        _cards = [NSMutableArray array];
    }
    
    return _cards;
}

- (void) addCard: (PMCard *) card atTop: (BOOL) atTop {
    
    if (atTop) {
        [self.cards insertObject: card atIndex: 0];
    } else {
        [self.cards addObject: card];
    }
    
}

- (void) addCard: (PMCard *) card {
    
    [self addCard: card atTop: NO];
}

- (PMCard *) drawRandomCard {
    
    PMCard *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObject: randomCard];
    }
    
    return randomCard;
}

@end
