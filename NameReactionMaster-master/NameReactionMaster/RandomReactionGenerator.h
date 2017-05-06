//
//  RandomReactionGenerator.h
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/29/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Reaction.h"
#import "AllReactions.h"

@interface RandomReactionGenerator : NSObject

@property int randomIntSelected;
@property (strong, nonatomic) NSMutableDictionary *allReactionObjects;
@property (strong, nonatomic) NSArray *allReactionNames;

- (Reaction *) generateRandomReaction;
- (NSMutableArray *) generateRandomReactionNames: (int) numberOfNamesRequested;

@end
