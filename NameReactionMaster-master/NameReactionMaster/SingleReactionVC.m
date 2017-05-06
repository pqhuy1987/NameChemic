//
//  SingleReactionVC.m
//  NameReactionMaster
//
//  Created by Qingquan Zhao on 12/28/16.
//  Copyright © 2016 Qingquan Zhao. All rights reserved.
//

#import "SingleReactionVC.h"

@interface SingleReactionVC ()

@end

@implementation SingleReactionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.reactionName.text = self.namePassedIn;
    
    self.reactionImage.contentMode = UIViewContentModeScaleAspectFit;
    self.reactionImage.clipsToBounds = YES;
    self.reactionImage.image = self.imagePassedIn;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.reactionImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
