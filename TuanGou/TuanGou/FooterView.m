//
//  FooterView.m
//  TuanGou
//
//  Created by lihonggui on 2016/12/16.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
    }
    return self;
}



-(void)setButton:(UIButton *)button
{
    _button = button;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"加载更多..." forState:UIControlStateNormal];
    
    self.activeView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(120, 0, 40, 40)];
//    self.activeView.center = button.center;
    
    
//    NSLog(@"activeview%@-----%@",NSStringFromCGRect(_activeView.frame),NSStringFromCGPoint(_activeView.center));
//    [self.activeView setBackgroundColor:[UIColor grayColor]];
//    [self.activeView startAnimating];
//    [button addSubview:self.activeView];
    
//    UIView *view = [[UIView alloc]init];
//    NSLog(@"activeview%@",NSStringFromCGRect(self.activeView.frame));
//    self.activeView.center = button.center;
//        NSLog(@"%f",view.alpha);
//    [view setBackgroundColor:[UIColor redColor]];
//        [button addSubview:view];
    
//    [button setTitle:@"正在加载中..." forState:UIControlStateHighlighted];
     [button setBackgroundColor:[UIColor orangeColor]];
    [button addTarget:self action:@selector(didButton:) forControlEvents:UIControlEventTouchUpInside];
  

}
//-(void)setActiveView:(UIActivityIndicatorView *)activeView
//{
//    _activeView = activeView;
//     [activeView setBackgroundColor:[UIColor redColor]];
//    [activeView startAnimating];
//}

-(void)didButton:(UIButton *)button
{
    NSLog(@"hahahah");
//    self.activeView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//     self.activeView.center = button.center;
//    [self.activeView setBackgroundColor:[UIColor grayColor]];
//    [button addSubview:self.activeView];
//    UIView *view = [[UIView alloc]initWithFrame:button.frame];
//    NSLog(@"%f",view.alpha);
//    [view setBackgroundColor:[UIColor redColor]];
//    [button addSubview:view];
    
    self.activeView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(110, 0, 40, 40)];
    [button addSubview:self.activeView];
    [self.activeView startAnimating];
    
    
    [button setTitle:@"正在加载中..." forState:UIControlStateNormal];
//    NSLog(@"activeview%@",NSStringFromCGRect(activeview.frame));
    if ([self.delegate respondsToSelector:@selector(footerViewWith:andButton: andWithActiveView:)]) {
        [self.delegate footerViewWith:self andButton:button andWithActiveView:self.activeView];
    }
}
@end
