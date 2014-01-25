//
//  Card.m
//  Matchismo
//
//  Created by kingleo on 2013. 12. 1..
//  Copyright (c) 2013년 LovelyElla Studio. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)othercards
{
    int score = 0;
    
    for(Card *card in othercards)
    {
        if([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    
    return score;
}
@end
