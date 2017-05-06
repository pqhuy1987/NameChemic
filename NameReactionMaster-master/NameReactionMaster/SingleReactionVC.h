//
//  SingleReactionVC.h
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/28/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface SingleReactionVC : ViewController
@property (strong, nonatomic) IBOutlet UILabel *reactionName;
@property (strong, nonatomic) IBOutlet UIImageView *reactionImage;
@property (strong, nonatomic) NSString *namePassedIn;
@property (strong, nonatomic) UIImage *imagePassedIn;

@end
