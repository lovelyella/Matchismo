//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by kingleo on 2014. 1. 5..
//  Copyright (c) 2014년 LovelyElla Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject


//designated initializer

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck withMatchingMode:(NSInteger)mode;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSInteger cardMatchMode;

@end
