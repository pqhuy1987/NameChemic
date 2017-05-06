//
//  ReactionHandler.h
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/28/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ReactionHandler : NSObject

+ (NSString *) getCleanReactionName: (NSString *) rawReactionName;
+ (UIImage *) getReactionFigures: (NSString *) reactionName;

@end
