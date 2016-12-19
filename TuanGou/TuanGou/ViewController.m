//
//  ViewController.m
//  TuanGou
//
//  Created by lihonggui on 2016/12/15.
//  Copyright © 2016年 lihonggui. All rights reserved.
//

#import "ViewController.h"
#import "TuanGouModel.h"
#import "TuanGouViewCell.h"
#import "TuanGouHeaderView.h"
#import "FooterView.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,FooterViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation ViewController
#pragma mark
#pragma mark-懒加载
 int count = 5;
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        //拼接路径
        NSString *pathFile = [[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil];
        NSArray *temp = [NSArray arrayWithContentsOfFile:pathFile];
        for (NSDictionary *dict in temp) {
            TuanGouModel *model = [TuanGouModel tuanGouModelWithDict:dict];
            [_dataArray addObject: model];
        }
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置图片
    TuanGouHeaderView *headerView = [[TuanGouHeaderView alloc]initWithFrame:CGRectMake(0, 0, 414, 200)];
    NSArray *imageArray = @[@"ad_00",@"ad_01",@"ad_02",@"ad_03",@"ad_04"];
    //关联
    headerView.imageArray = imageArray;
    //设置header
    self.tableView.tableHeaderView = headerView;
    
    /****footerView****/
    //默认footerView 的width  无效
    FooterView *footerView = [[FooterView alloc]initWithFrame:CGRectMake(0, 0, 100, 60)];
    footerView.delegate = self;
//    [footerView setBackgroundColor:[UIColor redColor]];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 394, 40)];
//    [button setBackgroundColor: [UIColor whiteColor]];
    [footerView addSubview:button];
    footerView.button = button;
    
//    
//    UIActivityIndicatorView *activeView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
////    activeView.center = button.center;
//    [activeView setBackgroundColor:[UIColor grayColor]];
//    [footerView addSubview:activeView];
//    footerView.activeView = activeView;
    
    
    self.tableView.tableFooterView = footerView
    ;
    
  
    
    
}
#pragma mark
#pragma mark-实现代理
-(void)footerViewWith:(FooterView *)footerView andButton:(UIButton *)button andWithActiveView:(UIActivityIndicatorView *)activeView
{
    NSLog(@"点我了");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //取出数组
        TuanGouModel *model = [[TuanGouModel alloc]init];
//        UIImage *image = [UIImage imageNamed:@"7003217f16ed29bab85e635a3bd6b60d"];
        model.icon = @"7003217f16ed29bab85e635a3bd6b60d";
        model.buyCount = @"20";
        model.price = @"132";
        model.title = @"好吃不得了";
        //存储
        [self.dataArray addObject:model];
        //刷新
//        [self.tableView reloadData];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count -1 inSection:0];
        #warning 刷新cell 刷新单个cell ----增加一个数组:要插入
//        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [button setTitle:@"加载更多..." forState:UIControlStateNormal];
        activeView.hidden = YES;
        #warning 滚到最后一行
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom  animated:YES];
    });
}

#pragma mark
#pragma mark-组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark
#pragma mark-行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
#pragma mark
#pragma mark-cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *identifier = @"TuanGou";
    TuanGouViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell ==nil) {
//        cell = [[TuanGouViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //如果找不到,就去xib中找
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TuanGouViewCell" owner:nil options:nil]lastObject];
    
        TuanGouModel *model = self.dataArray[indexPath.row];
        cell.model = model;
        NSLog(@"1");
    }
    return cell;
}
#pragma mark
#pragma mark-cell height预设高度
//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"预设高度");
//    return 80;
//}
#pragma mark
#pragma mark-设置cell 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark
#pragma mark-section headerHeight
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//   
//    return 200;
//    
//}

   
   
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
