//
//  TuanGouModel.m
//  TuanGou
//
//  Created by lihonggui on 2016/12/15.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "TuanGouModel.h"

@implementation TuanGouModel


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)tuanGouModelWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
