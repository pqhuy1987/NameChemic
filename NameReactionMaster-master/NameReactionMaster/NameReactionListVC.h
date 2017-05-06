//
//  NameReactionListVC.h
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/28/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "ViewController.h"
#import "AllReactions.h"
#import "SingleReactionVC.h"
#import "Reaction.h"

@interface NameReactionListVC : ViewController <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UITableView *nrListTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *nrListSearchBar;

@property (strong, nonatomic) NSArray *totalReactionNames;
@property (strong, nonatomic) NSMutableArray *filteredReactionNames;
@property (strong, nonatomic) NSArray *currentShownReactionNameArray;
@property BOOL isFiltered;

@end
