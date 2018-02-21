//
//  ViewController.m
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "ViewController.h"
#import "PMDeck.h"
#import "PMPlayingCardDeck.h"
#import "PMPlayingCard.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (assign, nonatomic) NSInteger flipsCount;


@property (strong, nonatomic) PMDeck *deck;

@end

@implementation ViewController

#pragma mark - Actions

- (IBAction)touchCardAction:(UIButton *)sender {

    if ([sender.currentTitle length]) {
        [sender setBackgroundImage: [UIImage imageNamed: @"cardBack"] forState: UIControlStateNormal];
        [sender setTitle: @"" forState: UIControlStateNormal];
    } else {
        
        PMPlayingCard *card = (PMPlayingCard *)[self.deck drawRandomCard];
        
        if (card) {
            [sender setBackgroundImage: [UIImage imageNamed: @"cardFront"] forState: UIControlStateNormal];
            [sender setTitle: [card contents] forState: UIControlStateNormal];
        }
    }
    self.flipsCount++;
}

#pragma mark - Setters&Getters

- (void) setFlipsCount:(NSInteger)flipsCount {
    
    _flipsCount = flipsCount;
    self.flipsLabel.text = [NSString stringWithFormat: @"Flips: %ld", self.flipsCount];
}

- (PMDeck *) deck {
    
    if (!_deck) {
        _deck = [[PMPlayingCardDeck alloc] init];
    }
    
    return _deck;
}


@end
