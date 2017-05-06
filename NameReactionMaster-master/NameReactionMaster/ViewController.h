//
//  ViewController.h
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/28/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *backGround;
@property (strong, nonatomic) NSMutableDictionary *allReactionObjects;
@property (strong, nonatomic) IBOutlet UIButton *showNRListButton;
@property (strong, nonatomic) IBOutlet UIButton *reactionTypeButton;
@property (strong, nonatomic) IBOutlet UIButton *randomTestButton;

- (IBAction)showNRListButtonPressed:(UIButton *)sender;
- (IBAction)reactionTypeButtonPressed:(UIButton *)sender;
- (IBAction)randomTestButtonPressed:(UIButton *)sender;


@end

