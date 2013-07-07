/**/
//  ViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-21.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//c oc ui ios sqlite codate github代码管理，第三方，组件 json hml 

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DetailCell.h"
#import "DetailData.h"
#import "JSON.h"
#import "DetailBasicViewController.h"
#import "SpellRetrieveViewController.h"
#import "pinyin.h"
#import "MainViewController.h"
#import "ZuiJinSouSuo.h"
@interface ViewController ()
@end
@implementation ViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {        
        self.urlStr  = [[[NSString alloc]init]autorelease];
    }
    return self;
}
//在将要显示的方法里将单元的选中的状态取消
-(void)viewWillAppear:(BOOL)animated{   
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.num=10;//初始设为显示两条，点击加载更多就再增加10条
    [self getData:self.num];//调用解析的方法    
    
    self.tableView=[[[UITableView alloc]init]autorelease];
    self.tableView=[[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 480-44-70)]autorelease];
    self.tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    //[self.tableView setSeparatorColor:[UIColor lightGrayColor]];//设置单元格分隔线颜色
    [self.view addSubview:self.tableView];
  

    //顶部===================================================================================================
	self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.topLabel=[[[UILabel alloc]initWithFrame:CGRectMake(0, -0.5, 320, 44)]autorelease];
    self.topLabel.textAlignment=NSTextAlignmentCenter;
    self.topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    self.topLabel.userInteractionEnabled=YES;
    self.topLabel.textColor=[UIColor whiteColor];
    self.topLabel.shadowColor=[UIColor blackColor];
    self.topLabel.shadowOffset=CGSizeMake(0, 3);
    [self.topLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:19]];
    [self.view addSubview:self.topLabel];
    //==============================================//最初效果，没有高亮      
    self.backButton=[[[UIButton alloc]initWithFrame:CGRectMake(20, (44-21)/2, 22, 21)]autorelease];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];
    
    [self.backButton addTarget:self action:@selector(backMainView:) forControlEvents:UIControlEventTouchUpInside];
    //[self.backButton setImage:[UIImage imageNamed:@"penlow"] forState:UIControlStateHighlighted];
    [self.topLabel addSubview:self.backButton];    
     //==============================================主页按钮
    self.mainButton=[[[UIButton alloc]initWithFrame:CGRectMake(282,(44-18)/2, 17, 18)]autorelease];
    self.mainButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"home.png"]];
    [self.topLabel addSubview:self.mainButton];    
    [self.mainButton addTarget:self action:@selector(mainView:) forControlEvents:UIControlEventTouchUpInside];    
    UILabel *left=[[[UILabel alloc]initWithFrame:CGRectMake(60, 1, 1, 44)]autorelease];
    left.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:left];    
    UILabel *right=[[[UILabel alloc]initWithFrame:CGRectMake(260, 1, 1, 44)]autorelease];
    right.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:right];    
    
    UIView *lineView=[[[UIView alloc]initWithFrame:CGRectMake(0, 480-20-47+2, 320,1)]autorelease];
    lineView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"dividing-line.png"]];
    [self.view addSubview:lineView];    
    //底部===================================================================================================    
    UIButton *btnDown=[UIButton buttonWithType:0];
    btnDown.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    btnDown.frame=CGRectMake((320-320)/2, 460-44, 320, 44);
    [btnDown addTarget:self action:@selector(downLoad:) forControlEvents:UIControlEventTouchUpInside];
    [btnDown setTitle:@"加载更多...      " forState:UIControlStateNormal];
    [btnDown setTitleColor:[UIColor colorWithRed:123/255.0 green:44/255.0 blue:18/255.0 alpha:1]forState:UIControlStateNormal];
    [self.view addSubview:btnDown];    
    //[self.view addSubview:self.act];
}
//-(void)getData:(int)num{//JSON解析方法
//    NSString *urlStr=[NSString stringWithFormat:@""];
//    
//    
//    NSURL *jsonUrl=[NSURL URLWithString:[NSString stringWithFormat:@"http://www.chazidian.com/service/pinyin/ban/1/%d",num]];//   ban/2/10 ban字读音，第二页，每页显示十条
//    NSError *error=nil;
//    NSString *jsonStr=[NSString stringWithContentsOfURL:jsonUrl encoding:NSUTF8StringEncoding error:&error];
//    NSDictionary *jsonDic=[jsonStr JSONValue];//NSLog(@"内容＝＝＝＝%@",jsonDic);
//    NSDictionary *dataDic=[jsonDic objectForKey:@"data"];//NSLog(@"data=====%@",dataDic);
//    self.ary=[dataDic objectForKey:@"words"];//解析到数组，里面包含多个同样读音的汉字包括所有信息
//    //NSLog(@"words====%@",self.ary);
//    
//}
   
//    NSURL *jsonUrl=[NSURL URLWithString:self.urlStr];
//    NSError *error=nil;
//    NSString *jsonStr=[NSString stringWithContentsOfURL:jsonUrl encoding:NSUTF8StringEncoding error:&error];
//    NSDictionary *jsonDic=[jsonStr JSONValue];//NSLog(@"内容＝＝＝＝%@",jsonDic);
//    NSDictionary *dataDic=[jsonDic objectForKey:@"data"];//NSLog(@"data=====%@",dataDic);
//    self.ary=[dataDic objectForKey:@"words"];//解析到数组，里面包含多个同样读音的汉字包括所有信息
//    //NSLog(@"words====%@",self.ary);
//    
//}
-(void)getData:(int)num { //JSON解析方法
    //SpellRetrieveViewController *spell=[[SpellRetrieveViewController alloc]init];
    //    NSURL *jsonUrl=[NSURL URLWithString:[NSString stringWithFormat:@"http://www.chazidian.com/service/pinyin/ /1/%d",num]];//   ban/2/10 ban字读音，第二页，每页显示十条
    
    NSURL *jsonUrl=[NSURL URLWithString:self.urlStr];
    NSError *error=nil;
    NSString *jsonStr=[NSString stringWithContentsOfURL:jsonUrl encoding:NSUTF8StringEncoding error:&error];
    NSDictionary *jsonDic=[jsonStr JSONValue];//NSLog(@"内容＝＝＝＝%@",jsonDic);
    NSDictionary *dataDic=[jsonDic objectForKey:@"data"];//NSLog(@"data=====%@",dataDic);
    self.ary=[dataDic objectForKey:@"words"];//解析到数组，里面包含多个同样读音的汉字包括所有信息
}
-(void)downLoad:(id)sender{//点击加载时，每次加载10条，并将单元格内容重新加载
    self.num+=10;
    [self getData:self.num];
    [self.tableView reloadData];
}
-(void)mainView:(id)sender{
    MainViewController *main=[[[MainViewController alloc]init]autorelease];
    [self.navigationController pushViewController:main animated:YES];
}
-(void)backMainView:(id)sender{    
    [self.navigationController popViewControllerAnimated:YES];
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
    return self.ary.count;
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
    
    //**************************
   
    
    
       DetailBasicViewController *detailBasic=[[[DetailBasicViewController alloc]init]autorelease];
        [self.navigationController pushViewController:detailBasic animated:YES];
    //进度轮 
    //创建活动指示器
    //在加载详细页面时开始，加载完毕后结束
    detailBasic.act=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    detailBasic.act.center=self.view.center;
    detailBasic.act.color=[UIColor redColor];
    [self.view addSubview:detailBasic.act];
    [detailBasic.act startAnimating];//开始
    
    //***************************
    detailBasic.topLabel.text=[[self.ary objectAtIndex:indexPath.row]objectForKey:@"simp"];//顶端文字
    detailBasic.titleLabel.text=[[self.ary objectAtIndex:indexPath.row]objectForKey:@"simp"];//汉字
    detailBasic.pinYinLab.text=[NSString stringWithFormat:@"拼音：%@",[[[self.ary objectAtIndex:indexPath.row]objectForKey:@"yin"]objectForKey:@"pinyin"]];//拼音
    detailBasic.zhuYinLab.text=[NSString stringWithFormat:@"注音：%@",[[[self.ary objectAtIndex:indexPath.row]objectForKey:@"yin"]objectForKey:@"zhuyin"]];//注音
    detailBasic.fanTiLab.text=detailBasic.buShouLab.text=[NSString stringWithFormat:@"繁体：%@",[[self.ary objectAtIndex:indexPath.row]objectForKey:@"tra"]];//繁体
    detailBasic.jieGouLab.text=detailBasic.buShouLab.text=[NSString stringWithFormat:@"结构：%@",[[self.ary objectAtIndex:indexPath.row]objectForKey:@"frame"]];//结构
    detailBasic.buShouLab.text=[NSString stringWithFormat:@"部首：%@",[[self.ary objectAtIndex:indexPath.row]objectForKey:@"bushou"]];//部首
    detailBasic.buShouBiHuaLab.text=[NSString stringWithFormat:@"部首笔画：%@",[[self.ary objectAtIndex:indexPath.row]objectForKey:@"bsnum"]];//部首笔画
    detailBasic.biHuaLab.text=[NSString stringWithFormat:@"笔画：%@",[[self.ary objectAtIndex:indexPath.row]objectForKey:@"num"]];//笔画
    detailBasic.biShunLab.text=[NSString stringWithFormat:@"笔顺：%@",[[self.ary objectAtIndex:indexPath.row]objectForKey:@"seq"]];//笔顺

    NSString *nextTitle = detailBasic.titleLabel.text;        
    NSURL *jsonUrl=[NSURL URLWithString:[NSString stringWithFormat:@"http://www.chazidian.com/service/word/%@",nextTitle]];
    NSLog(@"jsonUrl==%@",jsonUrl);
    NSError *error=nil;
    NSString *jsonStr=[NSString stringWithContentsOfURL:jsonUrl encoding:NSUTF8StringEncoding error:&error];
    NSDictionary *jsonDic=[jsonStr JSONValue];//NSLog(@"内容＝＝＝＝%@",jsonDic);
    NSDictionary *dataDic=[jsonDic objectForKey:@"data"];
    
    NSString *jiBenXinXiStr=[dataDic objectForKey:@"base"];
    NSLog(@"汉字＝＝＝＝＝＝＝＝＝＝%@",jiBenXinXiStr);    
    NSString *testStr=[dataDic objectForKey:@"base"];//NSLog(@"基本信息:%@",testStr);    
    NSString *hanYuZiDianStr=[dataDic objectForKey:@"hanyu"];//NSLog(@"汉语字典：%@",hanYuZiDianStr);    
    NSString *zuCiChengYu=[dataDic objectForKey:@"idiom"];//NSLog(@"组词成语：%@",zuCiChengYu);    
    NSString *yinWenFanYi=[dataDic objectForKey:@"english"];//NSLog(@"英文翻译：%@",yinWenFanYi);    

    detailBasic.jiBenStr=jiBenXinXiStr;
    detailBasic.hanYuStr=hanYuZiDianStr;
    detailBasic.zuCeStr=zuCiChengYu;
    detailBasic.yinWenStr=yinWenFanYi;
    detailBasic.textView.text=testStr;
  
    //**********************
    //把最近搜索的标示代码写在这里目的是让输入笔画数后，最近搜索显示的不是笔画数，而是通过笔画数找到的详细页面的汉字
    NSDateFormatter *datefro=[[NSDateFormatter alloc]init];
    [datefro setDateFormat:@"YYYYMMddHHmmss"];
    NSString *dateTime=[datefro stringFromDate:[NSDate date]];
    NSLog(@"date=%@",dateTime);
    [ZuiJinSouSuo updateTime:[NSString stringWithFormat:@"%@",dateTime] andZiTi:detailBasic.titleLabel.text];

}

#pragma mark - 单元格内容设置
//------------------------------------定义每个单元格内的具体内容-----------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellStr=@"cell";
    DetailCell *cell=[[[DetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr]autorelease];
    if (cell==nil) {
        cell=[[DetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.titleLab.text=[[self.ary objectAtIndex:indexPath.row]objectForKey:@"simp"];
    cell.pinYinLab.text=[[[self.ary objectAtIndex:indexPath.row]objectForKey:@"yin"]objectForKey:@"pinyin"];
    cell.buShouLab.text=[NSString stringWithFormat:@"部首：%@",[[self.ary objectAtIndex:indexPath.row]objectForKey:@"bushou"]];
    cell.biHuaLab.text=[NSString stringWithFormat:@"笔画：%@",[[self.ary objectAtIndex:indexPath.row]objectForKey:@"num"]];         
    return  cell;  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    
}
@end