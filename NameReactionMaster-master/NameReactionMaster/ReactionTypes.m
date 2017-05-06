//
//  ReactionTypes.m
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/29/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//


#import "ReactionTypes.h"
#import "AllReactions.h"

@implementation ReactionTypes

- (NSDictionary *) getTypesInfoAsDictionary{
    NSDictionary *reactionTypesInfoAsDictionary = @{@"Oxidation": [self getTypeArray:@"Oxidation"],
                                                    @"Rearrangement": [self getTypeArray:@"Rearrangement"],
                                                    @"Reduction": [self getTypeArray:@"Reduction"],
                                                    @"Cross Coupling" : [self getTypeArray:@"Coupling"],
                                                    @"Indole Synthesis" : [self getTypeArray:@"Indole"],
                                                    @"Olefination" : [self getTypeArray:@"Olefination"],
                                                    @"Heterocyclic Reaction" : [self getHeterocyclicReactionTypeArray],
                                                    @"Multi-Component Reaction" : [self getMultiComponentReactionTypeArray]
                                                    };
    return reactionTypesInfoAsDictionary;
}


- (NSArray *) getTypeArray: (NSString *) typeName{
    NSMutableDictionary *allReactionObjects = [AllReactions getAllReactionObjects];
    NSArray *allReactionNames = [allReactionObjects allKeys];
    NSMutableArray *typeMutableArray = [[NSMutableArray alloc]init];
    
    for (NSString *rxnName in allReactionNames){
        if ([rxnName.lowercaseString containsString:typeName.lowercaseString]){
            [typeMutableArray addObject:rxnName];
        }
    }
    NSArray *typeArray = [typeMutableArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){return [(NSString *)obj1 compare:(NSString *)obj2 options:NSNumericSearch];}];
    return typeArray;
}

- (NSArray *) getHeterocyclicReactionTypeArray{
    NSArray *heterocyclicReactionNameArray = @[@"Bartoli Indole Synthesis",
                                               @"Biginelli Reaction",
                                               @"Bischler-Napieralski Reaction",
                                               @"Fischer Indole Synthesis",
                                               @"Hantzsch Pyridine Synthesis",
                                               @"Knorr Pyrazole Synthesis",
                                               @"Madelung Indole Synthesis",
                                               @"Paal–Knorr Synthesis",
                                               @"Pictet-Spengler Reaction",
                                            ];
    return heterocyclicReactionNameArray;
}

- (NSArray *) getMultiComponentReactionTypeArray{
    NSArray *multiComponentReactionNameArray = @[@"Biginelli Reaction",
                                                 @"Bucherer-Bergs Reaction",
                                                 @"Hantzsch Pyridine Synthesis",
                                                 @"Kabachnik-Fields Reaction",
                                                 @"Mannich Reaction",
                                                 @"Passerini Reaction",
                                                 @"Petasis Reaction",
                                                 @"Strecker Amino Acid Synthesis",
                                                 @"Ugi Reaction",
                                                 ];

    return multiComponentReactionNameArray;
}

@end
