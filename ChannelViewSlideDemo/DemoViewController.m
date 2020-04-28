//
//  DemoViewController.m
//  EsenseDemo
//
//  Created by wenbin on 2020/4/28.
//  Copyright © 2020 im.zhaowenbin@icloud.com. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftButtonLeftConstraint;

@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightButtonRightConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewRightConstraint;

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)buttonAction:(UIButton *)sender {
    
    if (sender.tag == 10) {
        
        CGFloat leftPointConstant = CGRectGetMinX(self.leftButton.frame);
        
        if (self.lineViewLeftConstraint.constant == leftPointConstant) {
            NSLog(@"lineView is already on the left");
            return;
        }
        
        NSLog(@"click left button");
        
        self.lineViewLeftConstraint.constant = leftPointConstant;
        
        [UIView animateWithDuration:1.0f animations:^{
            
            [self.view layoutSubviews];
        } completion:^(BOOL finished) {
            
            self.lineViewRightConstraint.constant = CGRectGetMaxX(self.leftButton.frame) - CGRectGetMinX(self.rightButton.frame);
            
            [UIView animateWithDuration:1.0f animations:^{
                
                [self.view layoutSubviews];
                
            } completion:nil];
        }];
        
        
    } else {
        
        CGFloat rightPointConstant = CGRectGetMaxX(self.rightButton.frame) - CGRectGetMaxX(self.leftButton.frame);
        
        if (self.lineViewRightConstraint.constant == rightPointConstant) {
            NSLog(@"lineView is already on the right");
            return;
        }
        
        NSLog(@"click right button");
        
        self.lineViewRightConstraint.constant = rightPointConstant;
        
        [UIView animateWithDuration:1.0f animations:^{
            
            [self.view layoutSubviews];
            
        } completion:^(BOOL finished) {
            
            self.lineViewLeftConstraint.constant = CGRectGetMinX(self.rightButton.frame);
            
            [UIView animateWithDuration:1.0f animations:^{
                
                [self.view layoutSubviews];
                
            } completion:nil];
        }];
    }
}

@end
