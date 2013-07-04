//
//  MyCollectViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "MyCollectViewController.h"
#import "ShouChanrShuXing.h"
#import "MyCollectCell.h"
#import "DetailBasicShuXing.h"
#import "DetailBasicViewController.h"
@interface MyCollectViewController ()

@end

@implementation MyCollectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {        
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{//在将要显示的方法里将单元的选中的状态取消
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.showArray=[ShouChanrShuXing findAll];
    //    for (ShouChanrShuXing *s in [ShouChanrShuXing findAll]) {
//        NSLog(@"字体=%@,拼音=%@,繁体=%@,部首=%@,笔顺=%@",s.ziTi,s.pinYin,s.fanTi,s.buShou,s.biShun);
//    }    
	//顶部===================================================================================================
	self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.topLabel=[[[UILabel alloc]initWithFrame:CGRectMake(0, -0.5, 320, 44)]autorelease];
    self.topLabel.text=@"我的收藏";
    self.topLabel.shadowOffset=CGSizeMake(0, 3);
    self.topLabel.shadowColor=[UIColor blackColor];
    [self.topLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:19]];
    self.topLabel.textAlignment=NSTextAlignmentCenter;
    self.topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    self.topLabel.userInteractionEnabled=YES;
    self.topLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:self.topLabel];
    //==============================================
    self.backButton=[[[UIButton alloc]initWithFrame:CGRectMake(20, (44-21)/2, 22, 21)]autorelease];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];    
    [self.backButton addTarget:self action:@selector(backMainView:) forControlEvents:UIControlEventTouchUpInside];   
    [self.topLabel addSubview:self.backButton];    
    
    UIView *lineView=[[[UIView alloc]initWithFrame:CGRectMake(0, 480-20-47+2, 320,1)]autorelease];
    lineView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"dividing-line.png"]];
    [self.view addSubview:lineView];    
    //====================================================
    self.tableView=[[[UITableView alloc]init]autorelease];
    self.tableView=[[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 480-44)]autorelease];
    self.tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView setSeparatorColor:[UIColor lightGrayColor]];//设置单元格分隔线颜色
    [self.view addSubview:self.tableView];    
}
-(void)backMainView:(id)sender{
    NSLog(@"收藏界面");
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark - 单元格分区数量
//------------------------------------说明表格中分区数量------------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;//只设置一个分区，return为1
}
#pragma mark - 单元格行数
//------------------------------------说明每个分区中的单元格行数---------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.showArray.count;
}
#pragma mark - 单元格行高
//------------------------------------说明每个单元格行高----------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 51;
}
#pragma mark - 单元格点击事件处理
//-------------------------单元格单击事件处理函数(推送到具体显示页面)--------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"测试收藏");
    DetailBasicViewController *detailBasic=[[[DetailBasicViewController alloc]init]autorelease];
    [self.navigationController pushViewController:detailBasic animated:YES];   
    ShouChanrShuXing *sc=[self.showArray objectAtIndex:indexPath.row];
    detailBasic.topLabel.text=sc.ziTi;
    detailBasic.titleLabel.text=sc.ziTi;
    detailBasic.pinYinLab.text=sc.pinYin;
    detailBasic.fanTiLab.text=sc.fanTi;
    detailBasic.zhuYinLab.text=sc.zhuYin;
    detailBasic.jieGouLab.text=sc.jieGou;
    detailBasic.buShouLab.text=sc.jieGou;
    detailBasic.buShouBiHuaLab.text=sc.buShouBiHua;
    detailBasic.biHuaLab.text=sc.biHua;
    detailBasic.biShunLab.text=sc.biShun;
    detailBasic.textView.text=sc.jinBenXinXi;   
    detailBasic.jiBenStr=sc.jinBenXinXi;
    detailBasic.hanYuStr=sc.hyZiDian;
    detailBasic.zuCeStr=sc.zuCiChengYu;
    detailBasic.yinWenStr=sc.yinWenFanYi;        
}
#pragma mark - 单元格内容设置
//------------------------------------定义每个单元格内的具体内容-----------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   
    static NSString *cellStr=@"cell";    
    MyCollectCell  *cell=[[[MyCollectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr]autorelease];
    if (cell==nil) {
        cell=[[[MyCollectCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr]autorelease];
    }        
    ShouChanrShuXing *sc=[self.showArray objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.titleLab.text=sc.ziTi;
    cell.pinYinLab.text=sc.pinYin;
    cell.buShouLab.text=sc.buShou;
    cell.biHuaLab.text=sc.biHua;
    return cell;    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
