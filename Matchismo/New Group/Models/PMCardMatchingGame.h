//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMDeck, PMCard;

@interface PMCardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;

// designated initializer
- (instancetype)initWithCardCount: (NSUInteger) count
                        usingDeck: (PMDeck *) deck
                             mode: (NSInteger) mode;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (PMCard *)cardAtIndex:(NSUInteger)index;

@end
