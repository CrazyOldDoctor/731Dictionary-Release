//
//  SpellRetrieveViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "SpellRetrieveViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "pinyin.h"
#import "ViewController.h"
@interface SpellRetrieveViewController ()

@end

@implementation SpellRetrieveViewController
@synthesize topLabel,backButton,tabView,tabelCellArray,tabArray,sections;//rightImageView
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       self.sections=[NSMutableArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z", nil];
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
    topLabel=[[[UILabel alloc]initWithFrame:CGRectMake(0, -0.7, 320, 44)]autorelease];
    topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher@2x.png"]];
    topLabel.text=@"拼音检索";
    topLabel.textAlignment=NSTextAlignmentCenter;
    topLabel.textColor=[UIColor whiteColor];
    topLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:19];//加粗
    topLabel.shadowColor=[UIColor blackColor];//字体阴影
    topLabel.shadowOffset=CGSizeMake(0, 3);
    [self.view addSubview:topLabel];
    
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
    //这里480-44-20可以让区头的索引完全显示
    tabView=[[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 480-44-20)]autorelease];
    [self.view addSubview:tabView];
    tabView.dataSource=self;
    tabView.delegate=self;
    tabView.backgroundColor = [UIColor clearColor];//设置单元格背景颜色为透明
    [tabView setSeparatorColor:[UIColor lightGrayColor]];//设置单元格分割线颜色,要不然不明显
    
//        //添加字母和部首搜索图片
//       self.rightImageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Key-frame3.png"]];
//        self.rightImageView.frame=CGRectMake(290, 45, 27, 400);
//        [self.view addSubview:self.rightImageView];
    
    

    tabArray=[[NSMutableArray alloc]init];
    for (int i=0; i<26; i++){
        //        pinyin *s = nil;
        //        [sections objectAtIndex:i];
        //        NSLog(@"所得结果为：%@",s.pinyin);
        tabelCellArray=[pinyin findbypinyin:[sections objectAtIndex:i]];
        // [tabArray addObject:[pinyin findbypinyin:[sections objectAtIndex:i]]];
        [tabArray addObject:tabelCellArray];
        //NSLog(@"*******%@",tabArray);
    }
    
    
    //显示索引背景
//    self.tabView.sectionIndexTrackingBackgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Key-frame3@2x"]];
    
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
    //
    return [[self.tabArray objectAtIndex:section] count];
    // 分区中的行数是动态值，tabArray是自己定义的用来接收从那26个字母中取到的值，然后分别返回他们所对应的值的count
}
#pragma mark 单元格行数编辑
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr1=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableHeaderFooterViewWithIdentifier:cellStr1];
    
    if (cell==nil) {
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr1]autorelease];
        pinyin *s=[[[pinyin alloc]init]autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        NSArray *sectionArray=[self.tabArray objectAtIndex:indexPath.section];//取到所对应字母下面的区内容
        //NSLog(@"---%@",sectionArrray);
        s=[sectionArray objectAtIndex:indexPath.row];//每行所对应的值
        //NSLog(@"+++%@",s);        
        cell.textLabel.text=s.pinyin;//单元格内容为索取到的各个字母对应的内容
       
    }
    self.zilab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.zilab.backgroundColor=[UIColor lightGrayColor];
    self.zilab.text=[self.sections objectAtIndex:indexPath.section];
    [self.zilab setTextColor:[UIColor whiteColor]];
    self.zilab.backgroundColor=[UIColor clearColor];
    self.zilab.textAlignment=NSTextAlignmentCenter;
    [self.zilab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    self.vie=[[UIView alloc]initWithFrame:CGRectMake(320/2, (480-20-44)/2, 40, 40)];
    self.vie.layer.cornerRadius=21;
    [self.vie setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"round.png"]]];
    
    [self.view addSubview:self.vie];
    [self.vie addSubview:self.zilab];
    [UIView animateWithDuration:0.2 delay:1 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.vie.alpha=0;
    } completion:^(BOOL finished) {
        self.zilab.alpha=1;
    }];

    
    
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
    return [sections objectAtIndex:section];
}
#pragma mark 设置表格的分区的标题索引
//下列方法返回一个数组，目的是设置表格分区的标题文字，所以用之前声明的数组去接。
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    sections = [[NSMutableArray alloc]init];
//    for(char c = 'A';c<='Z';c++)
//        [sections addObject:[NSString stringWithFormat:@"%c",c]];
    
    return sections;
}







//***************************************
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    pinyin *pyin=[[self.tabArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    ViewController *viee=[[[ViewController alloc]init]autorelease];
    self.pinYinURL=[NSString stringWithFormat:@"http://www.chazidian.com/service/pinyin/%@/0/1000",pyin.pinyin];    
    viee.urlStr=self.pinYinURL;    
    [self.navigationController pushViewController:viee animated:YES];
    viee.topLabel.text=pyin.pinyin;     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
