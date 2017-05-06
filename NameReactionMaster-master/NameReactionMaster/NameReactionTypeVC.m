//
//  NameReactionTypeVC.m
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/29/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "NameReactionTypeVC.h"

@interface NameReactionTypeVC ()

@end

@implementation NameReactionTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.reactionTypeTableView.delegate = self;
    self.reactionTypeTableView.dataSource = self;
    
    ReactionTypes *reactionTypes = [[ReactionTypes alloc]init];
    self.reactionTypesInfo = [reactionTypes getTypesInfoAsDictionary];
    self.reactionTypesNames = [self.reactionTypesInfo allKeys];
}

#pragma mark - tableView data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.reactionTypesNames count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"TypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.reactionTypesNames objectAtIndex:indexPath.row];    
    return cell;
}


#pragma mark - tableView delegate

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *path = [self.reactionTypeTableView indexPathForSelectedRow];
    NSString *reactionTypeSelected = self.reactionTypesNames[path.row];
    
    NSArray *reactionsIncludedInTypeSelected = self.reactionTypesInfo[reactionTypeSelected];
    
    ReactionOfOneTypeVC *reactionOfOneTypeVC = segue.destinationViewController;
    reactionOfOneTypeVC.reactionsArrayOfThisType = reactionsIncludedInTypeSelected;
}

# pragma mark - memoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
