//
//  NameReactionTypeVC.h
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/29/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "ViewController.h"
#import "ReactionTypes.h"
#import "ReactionOfOneTypeVC.h"

@interface NameReactionTypeVC : ViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *reactionTypeTableView;
@property (strong, nonatomic) NSDictionary *reactionTypesInfo;
@property (strong, nonatomic) NSArray *reactionTypesNames;

@end
