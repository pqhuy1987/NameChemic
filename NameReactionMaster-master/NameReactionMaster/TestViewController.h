//
//  TestViewController.h
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/29/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "ViewController.h"
#import "RandomReactionGenerator.h"


@interface TestViewController : ViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *answersTableView;
@property (strong, nonatomic) IBOutlet UIImageView *testReactionImageView;
@property (strong, nonatomic) RandomReactionGenerator *randomReactionGenerator;
@property (strong, nonatomic) Reaction *reactionForTest;
@property (strong, nonatomic) NSMutableArray *wrongAnswerReactionNamesArray;
@property (strong, nonatomic) NSArray *allAnswerOptions;
@end
