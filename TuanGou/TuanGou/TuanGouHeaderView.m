//
//  TuanGouHeaderView.m
//  TuanGou
//
//  Created by lihonggui on 2016/12/15.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "TuanGouHeaderView.h"
@interface TuanGouHeaderView ()<UIScrollViewDelegate>

@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UIPageControl *pageControl;
@property(nonatomic,assign) NSInteger index;

@end
@implementation TuanGouHeaderView


#warning 在ViewController中已经定义了header的frame,所以这里要重写frameø
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self setScrollView];
        [self setPageController];
   
    }
    return self;
}
#warning 重写ViewController的set方法
-(void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    for (int i = 0; i < imageArray.count; i++) {
        NSLog(@"count%ld",self.imageArray.count);
//        NSString *imageNamed = [NSString stringWithFormat:@"ad_%02d",i];
        NSString *imageNamed = imageArray[i];
        UIImage *image = [UIImage imageNamed:imageNamed];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width*i, 0, self.bounds.size.width, self.bounds.size.height)];
        imageView.image = image;
        
        NSLog(@"imageView%@",imageView);
        [self.scrollView addSubview:imageView];
        
     
    }
    [self startTimer];
}

//-(void)setTimer:(NSTimer *)timer
//{
//    _timer = timer;
//    [self StartTimer];
//}
#pragma mark
#pragma mark-UI------是一个scrollView的View
-(void)setScrollView
{
    CGFloat width = self.bounds.size.width;
    #warning message
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    self.scrollView.contentSize = CGSizeMake(width*5 ,0);
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    [self addSubview:self.scrollView];
    NSLog(@"width%f---%lu",self.scrollView.bounds.size.width,(unsigned long)self.imageArray.count);
    
    
}

#pragma mark
#pragma mark-设置pageController
-(void)setPageController
{
    self.index = 0;
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 50,2)];
    self.pageControl.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height*0.9);
    self.pageControl.numberOfPages = 5;
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    [self addSubview:self.pageControl];

}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self startTimer];
    NSLog(@".origin.x%ld",(long)self.scrollView.contentOffset.x);
    self.index = 0;
    self.index = (NSInteger)self.scrollView.contentOffset.x/self.bounds.size.width;
    self.pageControl.currentPage = self.index;
    NSLog(@"self.index%ld",(long)self.index);
    
}

#pragma mark
#pragma mark-设置定时器
-(void)startTimer
{
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(beginTimer:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)beginTimer:(NSTimer *)timer
{
//    int count = 5;
//    //取值
//    NSInteger page = self.pageControl.currentPage;
//    CGPoint setX = self.scrollView.contentOffset;
//    if (self.pageControl.currentPage == count -1) {
//        page = 0;
//        setX = CGPointZero;
//    }else {
//        page ++;
//        setX.x = page*self.bounds.size.width;
//
//    }
//   
//    NSLog(@"page%ld",(long)page);
//    self.pageControl.currentPage = page;
//    [self.scrollView setContentOffset:setX animated:YES];
    
    //图片滚动,pageController不滚动
//    int count = 5;
//    CGPoint setX = self.scrollView.contentOffset;
//    NSInteger page =  setX.x/self.bounds.size.width;
//    
//    setX.x = page*self.bounds.size.width;
//    NSLog(@"page%ld",(long)page);
//    if (setX.x == self.bounds.size.width*(count -1)) {
//        page = 0;
//        
//    }else {
//        page++;
//        
//    }
//     setX.x = page*self.bounds.size.width;
//    NSLog(@"page%ld",(long)page);
//    [self.scrollView setContentOffset:setX animated:YES];
    
    int count = 5;
    NSInteger page = self.pageControl.currentPage;
    CGPoint setOffX = self.scrollView.contentOffset;
    if (setOffX.x == self.bounds.size.width*(count -1)) {
        page = 0;
        setOffX = CGPointZero;
    }else {
        page ++;
        setOffX.x = self.bounds.size.width*page;
    }
    self.pageControl.currentPage = page;
    [self.scrollView setContentOffset:setOffX animated:YES];
}

-(void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
@end
