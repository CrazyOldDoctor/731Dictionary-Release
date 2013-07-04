//
//  MainViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "MainViewController.h"
#import "MoreViewController.h"
#import "ViewController.h"
#import "SpellRetrieveViewController.h"
#import "BuShouRetrievalViewController.h"
#import "DetailCell.h"
#import "RegexKitLite.h"
#import "DetailBasicViewController.h"
#import "DetailBasicShuXing.h"
#import "ZuiJinSouSuo.h"
#import "JSON.h"
#import "YLProgressBar.h"

@interface MainViewController ()
@property (nonatomic, SAFE_ARC_PROP_RETAIN) NSTimer * progressTimer;
@end

@implementation MainViewController
@synthesize progressView,progressTimer;
//定时控制进度条

- (void)changeProgressValue{
    float progressValue=self.progressView.progress;
    progressValue+=0.005f;
    if (progressValue>1) {
//        [progressTimer invalidate];
       // [progressTimer performSelector:@selector(viewDidLoad) withObject:nil afterDelay:1.0f];
//        [self.beijingImgV removeFromSuperview];
//        [self.progressValueLabel removeFromSuperview];
//        [self.progressView removeFromSuperview];
        
        [self performSelector:@selector(fireBlockAfterDelay:)
         
                   withObject:nil
         
                   afterDelay:1];
    }
    [self.progressValueLabel setText:[NSString stringWithFormat:@"%.0f%%", (progressValue * 100)]];
    [self.progressView setProgress:progressValue];
}


- (void)fireBlockAfterDelay:(void (^)(void))block {
    [progressTimer invalidate];
    [self.beijingImgV removeFromSuperview];
    [self.progressValueLabel removeFromSuperview];
    [self.progressView removeFromSuperview];

}



//***********************

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.beijingImgV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480-20)];
    self.beijingImgV.image=[UIImage imageNamed:@"startup-interface"];
    
    //添加进度条显示label
    self.progressValueLabel=[[[UILabel alloc]initWithFrame:CGRectMake(115, 425, 70, 30)]autorelease];
    //***********如何实现动态效果？还有就是label里的百分比随着进度条进度的增加而增加。
    
    self.progressValueLabel.textColor=[UIColor whiteColor];
    self.progressValueLabel.backgroundColor=[UIColor clearColor];
    self.progressValueLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.progressValueLabel];

    
    
    //========================================测试用，暂勿删！！！

	//顶部控件设置===================================================================================================
    
	self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.topLabel=[[[UILabel alloc]initWithFrame:CGRectMake(0, -0.5, 320, 44)]autorelease];
    self.topLabel.text=@"汉语字典";
    self.topLabel.shadowColor=[UIColor blackColor];
    self.topLabel.shadowOffset=CGSizeMake(0, 3);
    [self.topLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:19]];
    self.topLabel.textAlignment=NSTextAlignmentCenter;
    self.topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    self.topLabel.userInteractionEnabled=YES;
    self.topLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:self.topLabel];
    //==============================================主页按钮        
    UILabel *bgLab=[[[UILabel alloc]initWithFrame:CGRectMake(282, 44/2, 23, 5)]autorelease];
    bgLab.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"more.png"]];
    bgLab.userInteractionEnabled=YES;
   [self.topLabel addSubview:bgLab];    
    self.mainButton=[[[UIButton alloc]initWithFrame:CGRectMake(320-60,1, 60, 44)]autorelease];
    //self.mainButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"more.png"]];
    self.mainButton.backgroundColor=[UIColor clearColor];    
    [self.mainButton addTarget:self action:@selector(moreView:) forControlEvents:UIControlEventTouchUpInside];    
   [self.topLabel addSubview:self.mainButton];

    UILabel *right=[[[UILabel alloc]initWithFrame:CGRectMake(260, 1, 1, 44)]autorelease];
    right.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:right];    
    //////////////////////////////////////////////
    self.pyziButton=[[[UIButton alloc]initWithFrame:CGRectMake(20, 66, 142, 33)]autorelease];
    self.pyziButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pyjz_normal"]];
    [self.pyziButton setTitle:@"拼音检字" forState:UIControlStateNormal];
    [self.pyziButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.pyziButton setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed1.png"] forState:UIControlStateSelected];
    //选择状态为黄色*****setBackgroundImage才不会遮挡文字******
    self.pyziButton.selected=YES;
    [self.pyziButton addTarget:self action:@selector(py:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.pyziButton];
        
    self.bsziButton=[[[UIButton alloc]initWithFrame:CGRectMake(162, 66, 142, 33)]autorelease];
    self.bsziButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bs1"]];
    [self.bsziButton setTitle:@"部首检字" forState:UIControlStateNormal];
    [self.bsziButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.bsziButton setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed1.png"] forState:UIControlStateSelected];    
    [self.bsziButton addTarget:self action:@selector(bs:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bsziButton];
    
    _txtField=[[UITextField alloc]initWithFrame:CGRectMake(20, 114, 284, 33)];//284
    _txtField.borderStyle=UITextBorderStyleRoundedRect;
    _txtField.placeholder=@"请输入部首笔划数、拼音或单个汉字..";
    _txtField.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:16];
    _txtField.contentVerticalAlignment=UIControlContentHorizontalAlignmentCenter;
    self.txtField.delegate=self;//指定代理
    [self.view addSubview:_txtField];
    
    UILabel * zjLabel=[[[UILabel alloc]initWithFrame:CGRectMake(20, 167, 100, 20)]autorelease];
    zjLabel.backgroundColor=[UIColor clearColor];
    zjLabel.text=@"最近搜索:";
    UIColor*color= [UIColor colorWithRed:142.0/255.0 green:54.0/255.0 blue:16.0/255.0 alpha:1];
    zjLabel.textColor=color;
    zjLabel.font=[UIFont boldSystemFontOfSize:20];
    [self.view addSubview:zjLabel];
    
    UIImageView *imgView=[[[UIImageView alloc]initWithFrame:CGRectMake(20, 197, 272, 1)]autorelease];
    imgView.image=[UIImage imageNamed:@"dividing-line"];
    [self.view addSubview:imgView];
    
    UIImageView *imgView2=[[[UIImageView alloc]initWithFrame:CGRectMake(20, 208, 277, 32)]autorelease];
    imgView2.image=[UIImage imageNamed:@"jintian"];
    [self.view addSubview:imgView2];
    //拼音字母检索********
    self.pyzmLabel=[[[UILabel alloc]initWithFrame:CGRectMake(20, 253, 200, 20)]autorelease];
    self.pyzmLabel.backgroundColor=[UIColor clearColor];
    self.pyzmLabel.text=@"按照拼音字母检索:";
    UIColor*color2= [UIColor colorWithRed:142.0/255.0 green:54.0/255.0 blue:16.0/255.0 alpha:1];
    self.pyzmLabel.textColor=color2;
    self.pyzmLabel.font=[UIFont boldSystemFontOfSize:20];
    [self.view addSubview:self.pyzmLabel];
    
    UIView *pyView=[[[UIView alloc]initWithFrame:CGRectMake(20, 283, 277, 1)]autorelease];
    pyView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"dividing-line"]];
    [self.view addSubview:pyView];
    
    //拼音字母ABCD
    self.ABCView=[[[UIView alloc]initWithFrame:CGRectMake(20, 290, 280, 150)]autorelease];
    self.ABCView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Key-frame2"]];
    [self.view addSubview:self.ABCView];
    
    self.pyArray=[[NSArray alloc]initWithObjects:@"A",@"B", @"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    for (int i=0; i<self.pyArray.count; i++) {
        UIButton *pyBtn=[[UIButton alloc]initWithFrame:CGRectMake(20+35*(i%8), 290+35*(i/8), 30, 30)];
        [pyBtn setTitle:[NSString stringWithFormat:@"%@",[self.pyArray objectAtIndex:i]] forState:UIControlStateNormal];
        
        [pyBtn setTitleColor:[UIColor colorWithRed:120/250.0 green:39/255.0 blue:16/255.0 alpha:1] forState:UIControlStateNormal];
        pyBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        pyBtn.tag=1000+i;
        [pyBtn addTarget:self action:@selector(pyChaXun:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:pyBtn];//贴ABCView中不行??相对于ABCView主视图的坐标
    }
    //部首查询*****
    for (int i=0; i<17; i++) {
        UIButton *bsBtn=[[UIButton alloc]initWithFrame:CGRectMake(20+47*(i%6), 290+40*(i/6), 40, 40)];
        [bsBtn setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [bsBtn setTitleColor:[UIColor colorWithRed:120/250.0 green:39/255.0 blue:16/255.0 alpha:1] forState:UIControlStateNormal];
        bsBtn.titleLabel.font = [UIFont systemFontOfSize: 20];
        bsBtn.tag=2000+i;
        [bsBtn addTarget:self action:@selector(bsChaXun:) forControlEvents:UIControlEventTouchUpInside];
        bsBtn.hidden=YES;
        [self.view addSubview:bsBtn];//贴ABCView中不行??相对于ABCView主视图的坐标        
    }
    
   // [self.view addSubview:self.zjBtn];

}
int flag=0;
//将要出现时重新加载赋值
-(void)viewWillAppear:(BOOL)animated{

    self.ziTiArray=[ZuiJinSouSuo findAll];
    for (int i=0; i<10; i++) {
        self.zjBtn=[[UIButton alloc]initWithFrame:CGRectMake(22+28*(i%10), 214, 20, 20)];
        [self.zjBtn addTarget:self action:@selector(zuijin:) forControlEvents:UIControlEventTouchUpInside];        
        [self.zjBtn setTitle:[[self.ziTiArray objectAtIndex:i] ziTi] forState:UIControlStateNormal];
        self.zjBtn.tag=3000+i;
        self.zjBtn.backgroundColor=[UIColor clearColor];
        [self.zjBtn setTitleColor:[UIColor colorWithRed:120/250.0 green:39/255.0 blue:16/255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.view addSubview:self.zjBtn];
    }
        //////////////////
 
    if (flag==0) {
            self.progressView=[[[YLProgressBar alloc]initWithFrame:CGRectMake(50,415, 220, 10)]autorelease];
           self.progressTimer=[NSTimer scheduledTimerWithTimeInterval:0.02f target:self selector:@selector(changeProgressValue) userInfo:nil repeats:YES];
        
        [self.view addSubview:self.beijingImgV];
        [self.view addSubview:self.progressValueLabel];
        [self.view addSubview:self.progressView];
        flag=1;
    }
    
}
//****************************************************************
//最近搜索的方法
-(void)zuijin:(UIButton *)sender{
    NSLog(@"测试最近搜索");
    DetailBasicViewController *detail=[[DetailBasicViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
    detail.urlSt=[NSString stringWithFormat:@"http://www.chazidian.com/service/word/%@",[sender titleForState:UIControlStateNormal]];
    NSLog(@"===???%@",detail.urlSt);
    detail.topLabel.text=[sender titleForState:UIControlStateNormal];    
    detail.titleLabel.text=[sender titleForState:UIControlStateNormal];
    //json 解析，本来打算卸载detailBasic类上面的，可是变量调不过来，只好写这里了。
    detail.urlSt=[NSString stringWithFormat:@"http://www.chazidian.com/service/word/%@",[sender titleForState:UIControlStateNormal]];
    NSURL *jsonUrl=[NSURL URLWithString:detail.urlSt];
    NSError *error=nil;
    NSString *jsonStr=[NSString stringWithContentsOfURL:jsonUrl encoding:NSUTF8StringEncoding error:&error];
    NSDictionary *jsonDic=[jsonStr JSONValue];
    //NSLog(@"内容＝＝＝＝%@",jsonDic);
    NSDictionary *dataDic=[jsonDic objectForKey:@"data"];
    // NSLog(@"data=====%@",dataDic);
    NSDictionary *baseInfo=[dataDic objectForKey:@"baseinfo"];
    NSDictionary *yin=[baseInfo objectForKey:@"yin"];
    NSLog(@"内容为：%@",yin);
    
    NSString *pinyin=[yin objectForKey:@"pinyin"];
    detail.pinYinLab.text=[NSString stringWithFormat:@"拼音：%@",pinyin];
    
    NSLog(@"*******%@",pinyin);
    NSString *zhuyin=[yin objectForKey:@"zhuyin"];
    detail.zhuYinLab.text=[NSString stringWithFormat:@"注音：%@",zhuyin];
    NSString *tra=[baseInfo objectForKey:@"tra"];
    detail.fanTiLab.text=[NSString stringWithFormat:@"繁体：%@",tra];
    NSString *frame=[baseInfo objectForKey:@"frame"];
    detail.jieGouLab.text=[NSString stringWithFormat:@"结构：%@",frame];
    NSString *bushou=[baseInfo objectForKey:@"bushou"];
    detail.buShouLab.text=[NSString stringWithFormat:@"部首：%@",bushou];
    NSString *bsnum=[baseInfo objectForKey:@"bsnum"];
    detail.buShouBiHuaLab.text=[NSString stringWithFormat:@"部首笔画：%@",bsnum];
    NSString *num=[baseInfo objectForKey:@"num"];
    detail.biHuaLab.text=[NSString stringWithFormat:@"笔画：%@",num];
    NSString *seq=[baseInfo objectForKey:@"seq"];
    detail.biShunLab.text=[NSString stringWithFormat:@"笔顺：%@",seq];
    NSString *hanyu=[dataDic objectForKey:@"hanyu"];
    detail.hanYuStr=hanyu;
    NSString *base=[dataDic objectForKey:@"base"];
    detail.jiBenStr=base;
    
    NSString *english=[dataDic objectForKey:@"english"];
    detail.yinWenStr=english;
    NSString *idiom=[dataDic objectForKey:@"idiom"];
    detail.zuCeStr=idiom;
    detail.textView.text=base;    
}

#pragma mark 点击界面空白处可以回收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.txtField resignFirstResponder];
}


#pragma mark 取消第一响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.txtField resignFirstResponder];
    if (self.txtField.text!=nil) {
        // "RegexKitLite.h"第三方类库，需要导入头文件,另外还需导入libicucore.dylib 这个框架，否则报错
        if ([self.txtField.text isMatchedByRegex:@"^[A-Za-z]+$"]) {//输英文        ///////////////////////////////////////////////////////
            ViewController *viee=[[[ViewController alloc]init]autorelease];
            [self.navigationController pushViewController:viee animated:YES];
            self.pinYinURL=[NSString stringWithFormat:@"http://www.chazidian.com/service/pinyin/%@/0/1000",self.txtField.text];
            
            viee.urlStr=self.pinYinURL;
            [viee getData:0];
            viee.title=self.txtField.text;
            viee.topLabel.text=self.txtField.text;
            
            //***********************
            
            
            
            ///////////////////////////////////////////////////////
        }else if ([self.txtField.text isMatchedByRegex:@"[\\u4e00-\\u9fa5]"]){//输汉字                
                DetailBasicViewController *detail=[[[DetailBasicViewController alloc]init]autorelease];
                [self.navigationController pushViewController:detail animated:YES];
                detail.urlSt=[NSString stringWithFormat:@"http://www.chazidian.com/service/word/%@",self.txtField.text];
                detail.topLabel.text=self.txtField.text;                
                detail.titleLabel.text=self.txtField.text;
                //json 解析，本来打算卸载detailBasic类上面的，可是变量调不过来，只好写这里了。
                detail.urlSt=[NSString stringWithFormat:@"http://www.chazidian.com/service/word/%@",detail.titleLabel.text];
                NSURL *jsonUrl=[NSURL URLWithString:detail.urlSt];
                NSError *error=nil;
                NSString *jsonStr=[NSString stringWithContentsOfURL:jsonUrl encoding:NSUTF8StringEncoding error:&error];
                NSDictionary *jsonDic=[jsonStr JSONValue];
                //NSLog(@"内容＝＝＝＝%@",jsonDic);
                NSDictionary *dataDic=[jsonDic objectForKey:@"data"];
                // NSLog(@"data=====%@",dataDic);
                NSDictionary *baseInfo=[dataDic objectForKey:@"baseinfo"];
                NSDictionary *yin=[baseInfo objectForKey:@"yin"];
                NSLog(@"内容为：%@",yin);
                
                NSString *pinyin=[yin objectForKey:@"pinyin"];
                detail.pinYinLab.text=[NSString stringWithFormat:@"拼音：%@",pinyin];
                NSLog(@"*******%@",pinyin);
                NSString *zhuyin=[yin objectForKey:@"zhuyin"];
                detail.zhuYinLab.text=[NSString stringWithFormat:@"注音：%@",zhuyin];
                NSString *tra=[baseInfo objectForKey:@"tra"];
                detail.fanTiLab.text=[NSString stringWithFormat:@"繁体：%@",tra];
                NSString *frame=[baseInfo objectForKey:@"frame"];
                detail.jieGouLab.text=[NSString stringWithFormat:@"结构：%@",frame];
                NSString *bushou=[baseInfo objectForKey:@"bushou"];
                detail.buShouLab.text=[NSString stringWithFormat:@"部首：%@",bushou];
                NSString *bsnum=[baseInfo objectForKey:@"bsnum"];
                detail.buShouBiHuaLab.text=[NSString stringWithFormat:@"部首笔画：%@",bsnum];
                NSString *num=[baseInfo objectForKey:@"num"];
                detail.biHuaLab.text=[NSString stringWithFormat:@"笔画：%@",num];
                
                NSString *seq=[baseInfo objectForKey:@"seq"];
                detail.biShunLab.text=[NSString stringWithFormat:@"笔顺：%@",seq];
                NSString *hanyu=[dataDic objectForKey:@"hanyu"];
                detail.hanYuStr=hanyu;
                NSString *base=[dataDic objectForKey:@"base"];
                detail.jiBenStr=base;
                
                NSString *english=[dataDic objectForKey:@"english"];
                detail.yinWenStr=english;
                NSString *idiom=[dataDic objectForKey:@"idiom"];
                detail.zuCeStr=idiom;
                detail.textView.text=base;
     //***************************
            //其他两项都写在详细页面上了，这里因为直接输入文字，那么我们就把它直接赋值给输入的文字，然后跳转到详细界面。
            NSDateFormatter *datefro=[[NSDateFormatter alloc]init];
            [datefro setDateFormat:@"YYYYMMddHHmmss"];
            NSString *dateTime=[datefro stringFromDate:[NSDate date]];
            NSLog(@"date=%@",dateTime);
            [ZuiJinSouSuo updateTime:[NSString stringWithFormat:@"%@",dateTime] andZiTi:self.txtField.text];
        
        }else if ([self.txtField.text isMatchedByRegex:@"^[0-9]*$"]){//输数字
            BuShouRetrievalViewController *buShou=[[[BuShouRetrievalViewController alloc]init]autorelease];
            buShou.tabArray=self.TabArray;//TabArray是我们在此定义的，tabArray是我们在BuShouRetrievalViewController中定义的，这里让他们相等，让TabArray把tabArray的值接过来。
            
            [self.navigationController pushViewController:buShou animated:YES];            
            //注意：要想自己在输入框中输入的数字和进入字典数字相对应，那么就必须先push，然后才能按照输入的数字进入响应的位置，不过，这里在把输入的数字转成整型时一定要减1，否则就会进入比数字大1的位置
            
            int t=[self.txtField.text intValue]-1;
            int h1=t*40;
            int h2=0;
            for (int i=0; i<t; i++) {
                h2+=[[buShou.tabArray objectAtIndex:i]count];
            }
            h2*=40;
            int h3=h1+h2;
            [buShou.tabView reloadData];
            [buShou.tabView scrollRectToVisible:CGRectMake(0, h3+460-20+40, 320, 1) animated:NO];
     
        }
        else{
            UIAlertView *alertView= [[UIAlertView alloc]initWithTitle:@"警告" message:@"请输入汉字、拼音或部首笔画数" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    
    return YES;
}

-(void)moreView:(id)sender{
    NSLog(@"更多");
    MoreViewController *more=[[[MoreViewController alloc]init]autorelease];
    [self.navigationController pushViewController:more animated:YES];}
-(void)pyChaXun:(UIButton *)sender{
    NSLog(@"拼音查询按钮");
    SpellRetrieveViewController *spell=[[[SpellRetrieveViewController alloc]init]autorelease];
    [self.navigationController pushViewController:spell animated:YES];
    int t=sender.tag-1000;
    int h1=t*40;
    int h2=0;
    for (int i=0; i<t; i++) {
        h2+=[[spell.tabArray objectAtIndex:i]count];      
    }
    h2*=40;
    int h3=h1+h2;
    [spell.tabView reloadData];
    [spell.tabView scrollRectToVisible:CGRectMake(0, h3+460-20+40, 320, 1) animated:NO]; }
-(void)bsChaXun:(UIButton *)sender{    
    NSLog(@"部首查询按钮");   
    BuShouRetrievalViewController *buShou=[[[BuShouRetrievalViewController alloc]init]autorelease];
    [self.navigationController pushViewController:buShou animated:YES];
    int t=sender.tag-2000;
    int h1=t*40;
    int h2=0;
    for (int i=0; i<t; i++) {
        h2+=[[buShou.tabArray objectAtIndex:i]count];    }
    h2*=40;
    int h3=h1+h2;
    [buShou.tabView reloadData];
    [buShou.tabView scrollRectToVisible:CGRectMake(0, h3+460-20+40, 320, 1) animated:NO];  }
-(void)py:(id)sender{    
    self.pyziButton.selected=YES;
    self.bsziButton.selected=NO;
    for (int i=0; i<self.pyArray.count; i++) {
        UIButton *ABCBtn=(UIButton*)[self.view viewWithTag:1000+i];
        ABCBtn.hidden=NO;    }
    for (int i=0; i<17; i++) {
        UIButton *bsBtn=(UIButton*)[self.view viewWithTag:2000+i];
        bsBtn.hidden=YES;    }
    self.pyzmLabel.text=@"按照拼音字母检索:";    //NSLog(@"当前字母是-----%@",);
}
-(void)bs:(id)sender{
    self.pyziButton.selected=NO;
    self.bsziButton.selected=YES;    
    for (int i=0; i<self.pyArray.count; i++) {
        UIButton *ABCBtn=(UIButton*)[self.view viewWithTag:1000+i];
        ABCBtn.hidden=YES;    }
    for (int i=0; i<17; i++) {
        UIButton *bsBtn=(UIButton*)[self.view viewWithTag:2000+i];
        bsBtn.hidden=NO;    }    
    self.pyzmLabel.text=@"按照部首笔画检索:";    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    
}
@end
