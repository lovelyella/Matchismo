//
//  PlayingCard.m
//  Matchismo
//
//  Created by kingleo on 2013. 12. 26..
//  Copyright (c) 2013년 LovelyElla Studio. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSArray *)validSuits
{
    return @[@"♥︎",@"♦︎",@"♠︎",@"♣︎"];
}

+(NSUInteger)maxRank
{
    return [[self rankStrings] count]-1;
}

-(int)match:(NSArray *)othercards
{
    int score = 0;
    if([othercards count] == 1)
    {
        PlayingCard *otherCard = [othercards firstObject];
        
        if(otherCard.rank == self.rank)
        {
            score = 4;
        }
        else if([otherCard.suit isEqualToString:self.suit])
        {
            score = 1;
        }
    }
    
    return score;
}

-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

-(void) setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

-(void)setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}
@end
