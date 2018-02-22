//
//  PMPlayingCard.m
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "PMPlayingCard.h"

@implementation PMPlayingCard

@synthesize suit = _suit;

+ (NSArray *) validSuits {
    
    return @[@"♥️", @"♦️", @"♠️", @"♣️"];
}

+ (NSArray *) rankStrings {
    
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",@"7", @"8", @"9",@"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank {
    
    return [[self rankStrings] count] - 1;
}

#pragma mark - Setters&Getters

- (NSString *) suit {
    
    return _suit ? _suit : @"?";
}

- (void) setSuit:(NSString *)suit {
    
    if ([[PMPlayingCard validSuits] containsObject: suit]) {
        _suit = suit;
    }
}

- (void) setRank: (NSInteger) rank {
    
    if (rank <= [PMPlayingCard maxRank]) {
        _rank = rank;
    }
}

#pragma mark - Override

- (NSString *) contents {
    
    NSArray *ranks = [PMPlayingCard rankStrings];
    return [ranks[self.rank] stringByAppendingString: self.suit];
}

- (int) match: (NSArray *) otherCards {
    
    int score = 0;
    
    if ([otherCards count] == 1) {
        PMPlayingCard *otherCard = [otherCards firstObject];
        if ([self.suit isEqualToString: otherCard.suit]) {
            score = 1;
        } else if (self.rank == otherCard.rank) {
            score = 4;
        }
    } else if ([otherCards count] == 2) {
        
        for (PMPlayingCard *otherCard in otherCards) {
            if ([self.suit isEqualToString: otherCard.suit]) {
                score += 1;
            } else if (self.rank == otherCard.rank) {
                score += 4;
            }
        }
        
        if ([[[otherCards firstObject] suit] isEqualToString: [[otherCards lastObject] suit]]) {
            score += 1;
        } else if ([[otherCards firstObject] rank] == [[otherCards lastObject] rank]) {
            score += 4;
        }
        
    }
    
    return score;
}

@end
