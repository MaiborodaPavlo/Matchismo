//
//  Card.m
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "PMCard.h"

@implementation PMCard

- (int) match: (NSArray *) otherCards {
    
    int score = 0;
    
    for (PMCard *card in otherCards) {
        if ([self.contents isEqualToString: card.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
