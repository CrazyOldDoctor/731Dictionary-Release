//
//  BuShouRetrievalViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "BuShouRetrievalViewController.h"
#import "BuShou.h"
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"

@interface BuShouRetrievalViewController ()

@end

@implementation BuShouRetrievalViewController
@synthesize topLabel,backButton,tabView,tabelCellArray,tabArray,sections,bihuaArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.sections=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17", nil];
        self.bihuaArray=[NSArray arrayWithObjects:@"笔画一",@"笔画二",@"笔画三",@"笔画四",@"笔画五",@"笔画六",@"笔画七",@"笔画八",@"笔画九",@"笔画十",@"笔画十一",@"笔画十二",@"笔画十三",@"笔画十四",@"笔画十五",@"笔画十六",@"笔画十七", nil];
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{//在将要显示的方法里将单元的选中的状态取消
    [self.tabView deselectRowAtIndexPath:[self.tabView indexPathForSelectedRow] animated:NO];
}
#pragma mark  viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing.png"]];
    //创建label充当导航条
    self.topLabel=[[[UILabel alloc]initWithFrame:CGRectMake(0, -0.7, 320, 44)]autorelease];
    self.topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher@2x.png"]];
    self.topLabel.text=@"部首检索";
    self.topLabel.textAlignment=NSTextAlignmentCenter;
    self.topLabel.textColor=[UIColor whiteColor];
    self.topLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:19];//加粗
    self.topLabel.shadowColor=[UIColor blackColor];//字体阴影
    topLabel.shadowOffset=CGSizeMake(0, 3);
    [self.view addSubview:self.topLabel];
    
    //创建返回上一页button
    backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame=CGRectMake(20, (44-20)/2, 22, 21);
    // backButton.backgroundColor=[UIColor yellowColor];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];
    
    //返回事件
    [backButton addTarget:self action:@selector(fanhui:) forControlEvents:UIControlEventTouchUpInside];
    [topLabel addSubview:backButton];
    topLabel.userInteractionEnabled=YES;//因为button贴在label上，所以点击不了，必须给label开启用户交互，才可以点击
    
    //左边线条
    UILabel *leftLine=[[[UILabel alloc]initWithFrame:CGRectMake(55, 0.2, 2, 44)]autorelease];
    leftLine.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top@2x.png"]];
    [topLabel addSubview:leftLine];
    
    //创建单元格
    tabView=[[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 480)]autorelease];
    [self.view addSubview:tabView];
    tabView.dataSource=self;
    tabView.delegate=self;
    tabView.backgroundColor = [UIColor clearColor];//设置单元格背景颜色为透明
    [tabView setSeparatorColor:[UIColor lightGrayColor]];//设置单元格分割线颜色,要不然不明显
    
    //    //添加字母和部首搜索图片
    //    rightImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Key-frame3.png"]];
    //    rightImageView.frame=CGRectMake(290, 45, 27, 400);
    //    [self.view addSubview:rightImageView];
    /*****************/
    //    for (BuShou *s in [BuShou findAll]) {
    //        NSLog(@"所得到的结果为:%d",s.bihua);
    //    }
    tabelCellArray=[[[NSMutableArray alloc]init]autorelease];
    self.tabArray=[[[NSMutableArray alloc]init]autorelease];
    for (int i=0; i<self.sections.count; i++){
        tabelCellArray=[BuShou findbyBiHua:i];
        [self.tabArray addObject:tabelCellArray];
        
    }
  	// Do any additional setup after loading the view.
}
#pragma mark fanhui:(UIButton *)sender 返回单击事件
-(void)fanhui:(UIButton *)sender{
    //NSLog(@"上一页");
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 单元格分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  sections.count;
    
}
#pragma mark 分区中的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.tabArray objectAtIndex:section] count];
    // 分区中的行数是动态值，tabArray是自己定义的用来接收从那26个字母中取到的值，然后分别返回他们所对应的值的count
}
#pragma mark 单元格行数编辑
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr1=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableHeaderFooterViewWithIdentifier:cellStr1];
    
    if (cell==nil) {
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr1]autorelease];
    }
    
    BuShou *s=[[self.tabArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    //[self.tabArray objectAtIndex:indexPath.section]取出对应的分区
    //objectAtIndex:indexPath.row 再取出对应每个分区中的对应行
    cell.textLabel.text=s.title;
    
    return cell;
    
}
#pragma mark  每个分区的行高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0f;
}
#pragma mark 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0f;
}
#pragma mark 分区头的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [bihuaArray objectAtIndex:section];
}
#pragma mark 设置表格的分区的标题文字数组
//下列方法返回一个数组，目的是设置表格分区的标题文字，所以用之前声明的数组去接。
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    
    return sections;
    
}
#pragma mark 单击单元格事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    ViewController *vie=[[ViewController alloc]init];
    //    [self.navigationController pushViewController: vie animated:YES];
    
    //    PinYinManage*pinyin=[[self.pinYinKuaiArrayN objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    //    SelectViewController *detailViewController = [[SelectViewController alloc] init];
    //    NSString*pinyinURL=[NSString stringWithFormat:@"http://www.chazidian.com/service/pinyin/%@/0/1000",pinyin.title];
    //    detailViewController.urlStr=pinyinURL;
    //    [self.navigationController pushViewController:detailViewController animated:YES];
    //    [detailViewController release];
    BuShou *bShou=[[self.tabArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    ViewController *viee=[[[ViewController alloc]init]autorelease];
    self.buShouURL=[NSString stringWithFormat:@"http://www.chazidian.com/service/bushou//%d/0/2000",bShou.id];
    //NSLog(@"%@",self.buShouURL);
    
    viee.urlStr=self.buShouURL;
    [self.navigationController pushViewController:viee animated:YES];
    viee.topLabel.text=bShou.title;
  
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
