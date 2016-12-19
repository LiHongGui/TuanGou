//
//  TuanGouViewCell.m
//  TuanGou
//
//  Created by lihonggui on 2016/12/15.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "TuanGouViewCell.h"
#import "TuanGouModel.h"
@interface TuanGouViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelBuyCount;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;

@end
@implementation TuanGouViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(TuanGouModel *)model
{
    _model = model;
    
    self.imageViewIcon.image = [UIImage imageNamed:model.icon];
    self.labelTitle.text = model.title;
    self.labelPrice.text = [NSString stringWithFormat:@"$%@",model.price];
    [self.labelPrice setTextColor: [UIColor orangeColor]];
    self.labelBuyCount.text = [NSString stringWithFormat:@"已卖出%@",model.buyCount];
}
@end
