//
//  Deck.h
//  Matchismo
//
//  Created by kingleo on 2013. 12. 27..
//  Copyright (c) 2013년 LovelyElla Studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;


-(Card *)drawRandomCard;

@end
