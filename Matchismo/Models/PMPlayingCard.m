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

- (NSString *) contents {
    
    NSArray *ranks = [PMPlayingCard rankStrings];
    return [ranks[self.rank] stringByAppendingString: self.suit];
}

@end
