//
//  RandomReactionGenerator.m
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/29/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//


#import "RandomReactionGenerator.h"

@implementation RandomReactionGenerator

- (RandomReactionGenerator *)init{
    self.randomIntSelected = 0;
    self.allReactionObjects = [AllReactions getAllReactionObjects];
    self.allReactionNames = [self.allReactionObjects allKeys];
    return self;
}

- (Reaction *) generateRandomReaction{
    int randomIndex = arc4random() % [self.allReactionNames count];
    NSString *randomReactionName = self.allReactionNames[randomIndex];
    self.randomIntSelected = randomIndex;
    Reaction *randomReactionObjectsSelected = self.allReactionObjects[randomReactionName];
    return randomReactionObjectsSelected;
}

- (NSMutableArray *) generateRandomReactionNames:(int)numberOfNamesRequested{
    NSMutableArray *arrayOfOtherReactionNamesOtherThanSelected = [[NSMutableArray alloc]init];
    int i = 0;
    while (i < numberOfNamesRequested){
        int randomIndex = arc4random() % [self.allReactionNames count];
        if (randomIndex != self.randomIntSelected){
            NSString *randomReactionName = self.allReactionNames[randomIndex];
            [arrayOfOtherReactionNamesOtherThanSelected addObject:randomReactionName];
            i++;
        }
    }
    return arrayOfOtherReactionNamesOtherThanSelected;
}

@end
