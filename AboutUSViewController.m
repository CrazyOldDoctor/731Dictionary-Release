//
//  AboutUSViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "AboutUSViewController.h"

@interface AboutUSViewController ()

@end

@implementation AboutUSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)openurl
{
    NSLog(@"网址测试");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.booksir.com/"]];
}
-(void)openWeiBo{
    NSLog(@"网址测试");
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.sina.com/"]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.topLabel=[[[UILabel alloc]initWithFrame:CGRectMake(0, -0.5, 320, 44)]autorelease];
    self.topLabel.text=@"关于我们";
    [self.topLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:19]];
    self.topLabel.shadowColor=[UIColor blackColor];
    self.topLabel.shadowOffset=CGSizeMake(0, 3);
    self.topLabel.textAlignment=NSTextAlignmentCenter;
    self.topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    self.topLabel.userInteractionEnabled=YES;
    self.topLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:self.topLabel];
    
    self.backButton=[[[UIButton alloc]initWithFrame:CGRectMake(20, (44-21)/2, 22, 21)]autorelease];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [self.topLabel addSubview:self.backButton];
    
    UILabel *left=[[[UILabel alloc]initWithFrame:CGRectMake(60, 1, 1, 44)]autorelease];
    left.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:left];   
    
    
    self.middleLabel=[[[UILabel alloc]initWithFrame:CGRectMake(320-296, 65, 296, 43)]autorelease];
    self.middleLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"z"]];
    [self.view addSubview:self.middleLabel];
    
    self.topTitleLabel=[[[UILabel alloc]initWithFrame:CGRectMake(50, 0, 150, 40)]autorelease];
    self.topTitleLabel.backgroundColor=[UIColor clearColor];
    self.topTitleLabel.text=@"指掌无线";
    [self.topTitleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:27]];
    [self.middleLabel addSubview:self.topTitleLabel];
    
    self.downTitleLabel=[[[UILabel alloc]initWithFrame:CGRectMake(250, 103, 80, 30)]autorelease];
    self.downTitleLabel.backgroundColor=[UIColor clearColor];
    self.downTitleLabel.text=@"汉语字典";
    [self.downTitleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [self.view addSubview:self.downTitleLabel];    
    
    self.imagee=[[[UIImageView alloc]initWithFrame:CGRectMake(120, 140, 90, 90)]autorelease];
    self.imagee.image=[UIImage imageNamed:@"zidian@2x.png"];
    [self.view addSubview:self.imagee];
    
    self.titleLab=[[[UILabel alloc]initWithFrame:CGRectMake(20, 235, 280, 110)]autorelease];
    [self.titleLab setNumberOfLines:4];
    [self.titleLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    self.titleLab.lineBreakMode=NSLineBreakByCharWrapping;
    self.titleLab.backgroundColor=[UIColor  clearColor];
    self.titleLab.text=@"        汉语是世界上最精密的语言之一，语义丰富，耐人寻味。本词典篇幅简短，内容丰富，既求融科学性、知识性、实用性，规范性于一体，又注意突出时代特色。";
    [self.view addSubview:self.titleLab];       
    
    
    self.bgView=[[[UIView alloc]initWithFrame:CGRectMake((320-250)/2, 360, 250, 81)]autorelease];
    self.bgView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"kuang"]];    
    [self.view addSubview:self.bgView];
    
    self.netWebLab=[[[UILabel alloc]initWithFrame:CGRectMake(11, 4, 230, 25)]autorelease];
    self.netWebLab.text=@"官方网站：";
    self.netWebLab.backgroundColor=[UIColor clearColor];
    [self.netWebLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    self.netWebLab.userInteractionEnabled=YES;
    [self.bgView addSubview:self.netWebLab];
        
    self.weiBoLab=[[[UILabel alloc]initWithFrame:CGRectMake(11, 2+25, 230, 25)]autorelease];
    self.weiBoLab.text=@"官方微博：";
    self.weiBoLab.backgroundColor=[UIColor clearColor];
    self.weiBoLab.userInteractionEnabled=YES;
    [self.weiBoLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:12]];
    [self.bgView addSubview:self.weiBoLab];
    
    
    self.weiXinLab=[[[UILabel alloc]initWithFrame:CGRectMake(11, 2+25+25, 230, 25)]autorelease];
    self.weiXinLab.text=@"微信公共账号：指掌无线";
    self.weiXinLab.backgroundColor=[UIColor clearColor];
    [self.weiXinLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [self.bgView addSubview:self.weiXinLab];
    
    self.textView=[[[UITextView alloc]initWithFrame:CGRectMake(20, 270, 280, 100)]autorelease];
    self.textView.text=@"官方网站：www.zhizhang.com  官方微博：e.weibo.com/u/3385145102  微信公共账号：指掌无线";
    //[self.view addSubview:self.textView];
    
    UIButton *urlBtn=[UIButton buttonWithType:0];
    urlBtn.frame=CGRectMake(55, 0, 150, 25);
    [urlBtn setTitle:@"www.zhizhang.com" forState:UIControlStateNormal];    
    urlBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [urlBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [urlBtn addTarget:self action:@selector(openurl) forControlEvents:UIControlEventTouchUpInside];
    [self.netWebLab addSubview:urlBtn];    
        
    UIButton *weiBoBtn=[UIButton buttonWithType:0];
    weiBoBtn.frame=CGRectMake(40, 0, 200, 25);    
    [weiBoBtn setTitle:@"e.weibo.com/u/3385145102" forState:UIControlStateNormal];    
    weiBoBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [weiBoBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [weiBoBtn addTarget:self action:@selector(openWeiBo) forControlEvents:UIControlEventTouchUpInside];
    [self.weiBoLab addSubview:weiBoBtn];
    
}


-(void)back:(id)sender{    
    [self.navigationController popViewControllerAnimated:YES];   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    
}

@end
