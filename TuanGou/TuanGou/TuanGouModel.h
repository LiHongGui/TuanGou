//
//  TuanGouModel.h
//  TuanGou
//
//  Created by lihonggui on 2016/12/15.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TuanGouModel : NSObject

@property(nonatomic,copy) NSString *buyCount;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *price;
@property(nonatomic,copy) NSString *title;
//@property(nonatomic,weak) CGFloat height;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)tuanGouModelWithDict:(NSDictionary *)dict;
@end
