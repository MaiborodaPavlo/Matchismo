//
//  Card.h
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMCard : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int) match: (NSArray *) otherCards;


@end
