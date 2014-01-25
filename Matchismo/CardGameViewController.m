//
//  CardGameViewController.m
//  Matchismo
//
//  Created by kingleo on 2013. 11. 30..
//  Copyright (c) 2013년 LovelyElla Studio. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation CardGameViewController


-(CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:0 usingDeck:[self createDeck]];
    
    return _game;
}
-(Deck *)deck
{
    if(!_deck)
    {
        _deck = [self createDeck];
    }
    
    return _deck;
}


-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    NSLog(@"flipCount changed to %d",self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    
    if([sender.currentTitle length]>0)
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else
    {
        Card *randomCard = [self.deck drawRandomCard];
        if(randomCard)
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
        
            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
        }
    }
    self.flipCount++;
}


@end
