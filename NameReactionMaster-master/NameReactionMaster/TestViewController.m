//
//  TestViewController.m
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/29/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "TestViewController.h"
#import <UIKit/UIKit.h>

@interface TestViewController (){
    UIRefreshControl *refreshControl;
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answersTableView.delegate = self;
    self.answersTableView.dataSource = self;
    
    refreshControl = [[UIRefreshControl alloc]init];
    [refreshControl addTarget:self action:@selector(refreshAnswersTableView) forControlEvents:UIControlEventAllEvents];
    [self.answersTableView addSubview:refreshControl];
    
    self.randomReactionGenerator = [[RandomReactionGenerator alloc]init];
    self.testReactionImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.testReactionImageView.clipsToBounds = YES;
    [self refreshTestReactionInfo];
}

- (void) refreshTestReactionInfo{
    self.reactionForTest = [self.randomReactionGenerator generateRandomReaction];
    self.wrongAnswerReactionNamesArray = [self.randomReactionGenerator generateRandomReactionNames:3];
    NSMutableArray *unsortedAllAnswerOptions = self.wrongAnswerReactionNamesArray;
    [unsortedAllAnswerOptions addObject:self.reactionForTest.name];
//    NSString *header = @"    ●   ";
//    NSMutableArray *unsortedAllAnswerOptionsWithHeader = [[NSMutableArray alloc]init];
//    for(NSString *str in unsortedAllAnswerOptions){
//        NSString *newStrWithHeader = [header stringByAppendingString:str];
//        [unsortedAllAnswerOptionsWithHeader addObject:newStrWithHeader];
//    };
    
    self.allAnswerOptions = [unsortedAllAnswerOptions sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){return [(NSString *)obj1 compare:(NSString *)obj2 options:NSNumericSearch];}];
    self.testReactionImageView.image = self.reactionForTest.image;
}

- (void) refreshAnswersTableView{
    [self refreshTestReactionInfo];
    [self.answersTableView reloadData];
    [refreshControl endRefreshing];
}

#pragma mark - tableView data source
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allAnswerOptions count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Choices: ";
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"TestCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [self.allAnswerOptions objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark - choose an answer from tableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reactionNameUserSelected = self.allAnswerOptions[indexPath.row];   
    if ([reactionNameUserSelected isEqualToString:self.reactionForTest.name]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Congratulation!" message: @"You are right!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *correctOKButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction: correctOKButton];
        [self presentViewController:alert animated:YES completion:nil];
        [self refreshAnswersTableView];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Incorrect Answer!" message: @"Choose Again!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *incorrectOKButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction: incorrectOKButton];
        [self presentViewController:alert animated:YES completion:nil];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
