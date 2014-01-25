//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by kingleo on 2013. 12. 27..
//  Copyright (c) 2013년 LovelyElla Studio. All rights reserved.
//

#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardDeck


-(instancetype)init
{
    self = [super init];
    if(self)
    {
        for(NSString *suit in [PlayingCard validSuits])
        {
            for(NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++)
            {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
        
    }
    return self;
}
@end
