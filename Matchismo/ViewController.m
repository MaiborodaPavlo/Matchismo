//
//  ViewController.m
//  Matchismo
//
//  Created by Pavel on 21.02.2018.
//  Copyright © 2018 Pavel Maiboroda. All rights reserved.
//

#import "ViewController.h"
#import "PMPlayingCardDeck.h"
#import "PMPlayingCard.h"
#import "PMCardMatchingGame.h"


@interface ViewController ()

@property (nonatomic, strong) PMCardMatchingGame *game;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UISegmentedControl *stateControl;

@end

@implementation ViewController

#pragma mark - Actions

- (IBAction) touchCardAction: (UIButton *) sender {
    
    self.stateControl.enabled = NO;
    
    NSUInteger cardIndex = [self.cardButtons indexOfObject: sender];
    [self.game chooseCardAtIndex: cardIndex];
    [self updateUI];
}

- (IBAction) refreshAction: (UIButton *) sender {
    
    self.game = nil;
    [self updateUI];
    
    self.stateControl.enabled = YES;
}

#pragma mark - Setters&Getters

- (PMCardMatchingGame *) game {
    
    if (!_game) {
        _game = [[PMCardMatchingGame alloc] initWithCardCount: [self.cardButtons count]
                                                    usingDeck: [self createDeck]
                                                         mode: self.stateControl.selectedSegmentIndex];
    }
    return _game;
}

#pragma mark - Help Methods

- (PMDeck *) createDeck {
    
    return [[PMPlayingCardDeck alloc] init];
}

- (void) updateUI {
    
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject: cardButton];
        PMCard *card = [self.game cardAtIndex: cardIndex];
        [cardButton setTitle: [self titleForCard: card]
                    forState: UIControlStateNormal];
        [cardButton setBackgroundImage: [self backgroundImageForCard: card]
                              forState: UIControlStateNormal];
        cardButton.enabled = !card.matched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
}

- (NSString *) titleForCard: (PMCard *) card {
    
    return card.chosen ? card.contents : @"";
}

- (UIImage *) backgroundImageForCard: (PMCard *) card {
    
    return [UIImage imageNamed: card.chosen ? @"cardFront" : @"cardBack"];
}

@end
