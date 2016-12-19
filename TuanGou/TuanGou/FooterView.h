//
//  FooterView.h
//  TuanGou
//
//  Created by lihonggui on 2016/12/16.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FooterView;
@protocol FooterViewDelegate <NSObject>

-(void)footerViewWith:(FooterView *)footerView andButton:(UIButton *)button andWithActiveView:(UIActivityIndicatorView *)activeView;

@end
@interface FooterView : UIView

@property(nonatomic,strong) UIButton *button;
@property(nonatomic,strong) UIActivityIndicatorView *activeView;
@property(nonatomic,weak) id<FooterViewDelegate>delegate;
@end
