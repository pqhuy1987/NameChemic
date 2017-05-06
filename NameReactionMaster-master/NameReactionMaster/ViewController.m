//
//  ViewController.m
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/28/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "ViewController.h"
#import "ReactionHandler.h"
#import "NameReactionListVC.h"


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allReactionObjects = [AllReactions getAllReactionObjects];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)showNRListButtonPressed:(UIButton *)sender {
}

- (IBAction)reactionTypeButtonPressed:(UIButton *)sender {
}

- (IBAction)randomTestButtonPressed:(UIButton *)sender {
}
@end
