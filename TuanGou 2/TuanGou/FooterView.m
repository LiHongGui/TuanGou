//
//  FooterView.m
//  TuanGou
//
//  Created by lihonggui on 2016/12/19.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "FooterView.h"
@interface FooterView()

@property (weak, nonatomic) IBOutlet UIView *loadView;
@property (weak, nonatomic) IBOutlet UIButton *loadButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *active;

@end
@implementation FooterView

- (IBAction)clickButton:(UIButton *)sender {
    
    /*
     初始时,只显示加载更多
     1.点击加载更多:显示正在加载中,隐藏点击加载更多
     */
    self.loadView.hidden = NO;;
    self.loadButton.hidden = NO;
    self.active.hidden = NO;
    
    if ([self.delegate respondsToSelector:@selector(footerView:andbutton:andView:andActive:)]) {
        [self.delegate footerView:self andbutton:self.loadButton andView:self.loadView andActive:self.active];
    }
}


@end
