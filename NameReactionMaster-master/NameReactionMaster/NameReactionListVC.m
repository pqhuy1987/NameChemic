//
//  NameReactionListVC.m
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/28/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "NameReactionListVC.h"

@interface NameReactionListVC ()
@end

@implementation NameReactionListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nrListTableView.delegate = self;
    self.nrListSearchBar.delegate = self;
    self.nrListTableView.dataSource = self;
    NSArray *unsortedReactionNames = [self.allReactionObjects allKeys];
    self.totalReactionNames = [unsortedReactionNames sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){return [(NSString *)obj1 compare:(NSString *)obj2 options:NSNumericSearch];}];
}

#pragma mark - searchBar delegate

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.nrListTableView resignFirstResponder];
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0){
        self.isFiltered = NO;
    }else{
        self.isFiltered = YES;
        self.filteredReactionNames = [[NSMutableArray alloc] init];
        for (NSString *str in self.totalReactionNames){
            NSRange stringRange = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(stringRange.location != NSNotFound){
                [self.filteredReactionNames addObject:str];
            }
        }
    }
    [self.nrListTableView reloadData];
}

#pragma mark - tableView data source


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.isFiltered){
        return [self.filteredReactionNames count];
    }else{
        return [self.totalReactionNames count];
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if(!self.isFiltered){
        self.currentShownReactionNameArray = self.totalReactionNames;
    }else{
        self.currentShownReactionNameArray =  self.filteredReactionNames;
    }
    cell.textLabel.text = [self.currentShownReactionNameArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - tableView delegate

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *path = [self.nrListTableView indexPathForSelectedRow];
    NSString *reactionNameSelected = self.currentShownReactionNameArray[path.row];
    Reaction *reactionSelected = self.allReactionObjects[reactionNameSelected];
    SingleReactionVC *singleReactionVC = segue.destinationViewController;
    singleReactionVC.namePassedIn = reactionSelected.name;
    singleReactionVC.imagePassedIn = reactionSelected.image;
}



#pragma mark - MemoryControl
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
