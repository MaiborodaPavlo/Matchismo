//
//  PMPlayingCard.h
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMCard.h"

@interface PMPlayingCard : PMCard

@property (strong, nonatomic) NSString *suit;
@property (assign, nonatomic) NSInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
