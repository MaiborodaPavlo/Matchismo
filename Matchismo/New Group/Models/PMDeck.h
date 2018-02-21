//
//  PMDeck.h
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMCard;

@interface PMDeck : NSObject

- (void) addCard: (PMCard *) card atTop: (BOOL) atTop;
- (void) addCard: (PMCard *) card;

- (PMCard *) drawRandomCard;

@end
