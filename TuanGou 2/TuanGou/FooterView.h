//
//  FooterView.h
//  TuanGou
//
//  Created by lihonggui on 2016/12/19.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FooterView;
@protocol FooterViewDelegate <NSObject>

-(void)footerView:(FooterView *)footerView andbutton:(UIButton *)button andView:(UIView *)view andActive:(UIActivityIndicatorView *)active;

@end
@interface FooterView : UIView

@property(nonatomic,weak) id <FooterViewDelegate>delegate;

@end
