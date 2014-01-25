//
//  PlayingCard.h
//  Matchismo
//
//  Created by kingleo on 2013. 12. 26..
//  Copyright (c) 2013년 LovelyElla Studio. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic)NSString *suit;
@property (nonatomic)NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
