//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by kingleo on 2014. 1. 5..
//  Copyright (c) 2014년 LovelyElla Studio. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, readwrite) NSInteger cardMatchMode;
@property (nonatomic, strong) NSMutableArray *cards; //of card
@end

@implementation CardMatchingGame

-(NSString *)gameStatusString
{
    if(!_gameStatusString) _gameStatusString = [NSString stringWithFormat:@""];
    return _gameStatusString;
    
}

-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count])? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;



-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    
    if(!card.isMatched)
    {
        //선택된 카드인 경우 다시 뒤집는다.
        if(card.isChosen)
        {
            card.chosen = NO;
            self.gameStatusString = [NSString stringWithFormat:@""];
            
        }
        else
        {
            NSMutableArray *matchingCards = [[NSMutableArray alloc]init];
            //match against other chosen cards
            for(Card *otherCard in self.cards)
            {
                if(otherCard.isChosen && !otherCard.isMatched)
                {
                    [matchingCards addObject:otherCard];
                    if([matchingCards count] >= self.cardMatchMode - 1) break;
                }
            }
            
            if([matchingCards count]>= self.cardMatchMode - 1)
            {
                int matchScore = [card match:matchingCards];
                NSMutableString *statusMutableString = [NSMutableString stringWithFormat:@"%@ ",card.contents];
                
                for(Card *otherCard in matchingCards)
                {
                    [statusMutableString appendString:[NSString stringWithFormat:@"%@ ",otherCard.contents]];
                }
                
                
                if(matchScore)
                {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for(Card *otherCard in matchingCards) otherCard.matched = YES;
                    
                    [statusMutableString appendString:[NSString stringWithFormat:@" Match! for %d point",(matchScore*MATCH_BONUS)-COST_TO_CHOOSE]];
                }
                else
                {
                    self.score -= MISMATCH_PENALTY;
                    for(Card *otherCard in matchingCards) otherCard.chosen = NO;
                    
                    [statusMutableString appendString:[NSString stringWithFormat:@" Mismatch! -%d point",MISMATCH_PENALTY-COST_TO_CHOOSE]];
                }
                self.gameStatusString = statusMutableString;
            }
            else
            {
                self.gameStatusString = [NSString stringWithFormat:@"%@",card.contents];
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            
        }
    }
}

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck
                  withMatchingMode:(NSInteger)mode
{
    if(mode!=2 && mode!=3)
    {
        self = nil;
        
    }
    else
    {
        self = [super init]; //super's designated initializer
        
        if(self)
        {
            for(int i =0; i< count; i++)
            {
                Card *card = [deck drawRandomCard];
                if(card)
                {
                    [self.cards addObject:card];
                }
                else
                {
                    self = nil;
                    break;
                }
            }
        }
        self.cardMatchMode = mode;
    }
    return self;
}



@end
