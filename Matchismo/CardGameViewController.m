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
#import "Card.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSegmentControl;
@property (weak, nonatomic) IBOutlet UILabel *gameStatusLabel;


@end

@implementation CardGameViewController

- (IBAction)touchGameModeSegment:(UISegmentedControl *)sender {
    NSInteger selectedSegment = [self.gameModeSegmentControl selectedSegmentIndex];
    self.game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                 usingDeck:[self createDeck]
                                          withMatchingMode:selectedSegment+2];
    [self updateUI];
}

- (IBAction)touchNewGameButton:(UIButton *)sender
{
    NSInteger selectedSegment = [self.gameModeSegmentControl selectedSegmentIndex];
    NSLog(@"selected segment:%d",selectedSegment);
    self.game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                 usingDeck:[self createDeck]
                                          withMatchingMode:selectedSegment+2];
    
    self.gameModeSegmentControl.enabled = YES;
    [self updateUI];
}




-(CardMatchingGame *)game
{
    
    NSInteger selectedSegment = [self.gameModeSegmentControl selectedSegmentIndex];
    if(!_game) _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                        usingDeck:[self createDeck]
                                                 withMatchingMode:selectedSegment+2];
    
    return _game;
}


-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    self.gameModeSegmentControl.enabled = NO;
    [self updateUI];
}

-(void)updateUI
{
    for(UIButton *cardButton in self.cardButtons)
    {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
        self.gameStatusLabel.text = [NSString stringWithFormat:@"%@",self.game.gameStatusString];
    }
}

-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen? @"cardfront" : @"cardback"];
}

@end
