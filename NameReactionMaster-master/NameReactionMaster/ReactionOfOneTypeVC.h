//
//  ReactionOfOneTypeVC.h
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/29/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "ViewController.h"
#import "SingleReactionVC.h"
#import "Reaction.h"

@interface ReactionOfOneTypeVC : ViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *oneTypeTableView;
@property (strong, nonatomic) NSArray *reactionsArrayOfThisType;

@end
