//
//  ReactionHandler.m
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/28/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "ReactionHandler.h"

@implementation ReactionHandler

+ (NSString *) getCleanReactionName: (NSString *) rawReactionName{
    NSString *reactionName = [[rawReactionName componentsSeparatedByString:@".png"][0] componentsSeparatedByString:@"NR_"][1];
    return reactionName;
}

+ (UIImage *) getReactionFigures: (NSString *) rawReactionName{
    UIImage *reactionImage = [UIImage imageNamed:rawReactionName];
    return reactionImage;
}


@end
