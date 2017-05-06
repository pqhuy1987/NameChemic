//
//  AllReactions.m
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/28/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "AllReactions.h"
#import <UIKit/UIKit.h>

@implementation AllReactions

static NSMutableDictionary *allReactionObjects = nil;

+ (NSMutableDictionary *) getAllReactionObjects{
        if(allReactionObjects == nil){
            allReactionObjects = [[NSMutableDictionary alloc]init];
            NSArray *fileList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[[NSBundle mainBundle] resourcePath] error: nil];
            for(id i in fileList){
                if ([i isKindOfClass:[NSString class]] && [i containsString:@".png"] && [i containsString:@"NR_"]){
                    NSString *fileName = [NSString stringWithFormat:@"%@", i];
                    NSString *reactionNameFromFile = [ReactionHandler getCleanReactionName:fileName];
                    UIImage *reactionImageFromFile = [ReactionHandler getReactionFigures:fileName];
                    Reaction *reaction = [[Reaction alloc]init];
                    reaction.name = reactionNameFromFile;
                    reaction.image = reactionImageFromFile;
                    [allReactionObjects setObject:reaction forKey:reaction.name];
                }
            }
            return allReactionObjects;
        }else{
            return allReactionObjects;
        }
}


@end
