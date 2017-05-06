//
//  ReactionOfOneTypeVC.m
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/29/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "ReactionOfOneTypeVC.h"

@interface ReactionOfOneTypeVC ()

@end

@implementation ReactionOfOneTypeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.oneTypeTableView.delegate = self;
    self.oneTypeTableView.dataSource = self;
}

#pragma mark - tableView data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.reactionsArrayOfThisType count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"rxnOfOneTypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [self.reactionsArrayOfThisType objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - tableView delegate

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *path = [self.oneTypeTableView indexPathForSelectedRow];
    NSString *reactionNameSelected = self.reactionsArrayOfThisType[path.row];
    Reaction *reactionSelected = self.allReactionObjects[reactionNameSelected];
    SingleReactionVC *singleReactionVC = segue.destinationViewController;
    singleReactionVC.namePassedIn = reactionSelected.name;
    singleReactionVC.imagePassedIn = reactionSelected.image;
}

# pragma mark - memoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
