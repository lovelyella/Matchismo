//
//  Card.h
//  Matchismo
//
//  Created by kingleo on 2013. 12. 1..
//  Copyright (c) 2013년 LovelyElla Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

-(int)match:(NSArray *)othercards;

@end
