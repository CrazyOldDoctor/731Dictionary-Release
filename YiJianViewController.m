//
//  YiJianViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-25.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//
#import "YiJianViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface YiJianViewController ()
@end
@implementation YiJianViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {        
    }
    return self;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder]; return NO;
    }
    return YES; 
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	//顶部===================================================================================================
	self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.topLabel=[[[UILabel alloc]initWithFrame:CGRectMake(0, -0.5, 320, 44)]autorelease];
    self.topLabel.text=@"意见反馈";
    self.topLabel.textAlignment=NSTextAlignmentCenter;
    self.topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    self.topLabel.userInteractionEnabled=YES;
    self.topLabel.textColor=[UIColor whiteColor];
    [self.view addSubview:self.topLabel];
    //==============================================最初效果，没有高亮
    self.backButton=[[[UIButton alloc]initWithFrame:CGRectMake(20, (44-21)/2, 22, 21)]autorelease];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];    
    [self.backButton addTarget:self action:@selector(backMainView:) forControlEvents:UIControlEventTouchUpInside];
    //[self.backButton setImage:[UIImage imageNamed:@"penlow"] forState:UIControlStateHighlighted];
    [self.topLabel addSubview:self.backButton];
    //==============================================主页按钮
    self.mainButton=[[[UIButton alloc]initWithFrame:CGRectMake(282,(44-18)/2, 18, 20)]autorelease];
    self.mainButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"magnifier.png"]];
    [self.topLabel addSubview:self.mainButton];
    [self.mainButton addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *left=[[[UILabel alloc]initWithFrame:CGRectMake(60, 1, 1, 44)]autorelease];
    left.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:left];
    UILabel *right=[[[UILabel alloc]initWithFrame:CGRectMake(260, 1, 1, 44)]autorelease];
    right.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:right];
    
    UIView *bgView=[[[UIView alloc]initWithFrame:CGRectMake((320-306)/2, 44+7, 306, 371)]autorelease];
    bgView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"fankuikuang"]];
    [self.view addSubview:bgView];
    
    UITextView *textView=[[UITextView alloc]initWithFrame:CGRectMake(7, 7, 306-12, 371-7)];
    textView.backgroundColor=[UIColor clearColor];
    textView.font=[UIFont systemFontOfSize:16];
    textView.hidden=NO;
    textView.delegate=self;
    [bgView addSubview:textView];

    self.noLabel=[[[UILabel alloc]initWithFrame:CGRectMake(6, 4, 250, 25)]autorelease];
    self.noLabel.text=@"请输入您的反馈意见...";
    [self.noLabel setTextColor:[UIColor colorWithRed:134/255.0 green:63/255.0 blue:41/255.0 alpha:1]];
    self.noLabel.enabled=NO;//设置为不可用
    self.noLabel.backgroundColor=[UIColor clearColor];
    [textView addSubview:self.noLabel];
    
    /////////////////////////////////////
    UIView *leftView=[[[UIView alloc]initWithFrame:CGRectMake(15, 427, 64, 28)]autorelease];
    leftView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"fankuianjian"]];
    [self.view addSubview:leftView];     
    
    self.leftLab=[[[UILabel alloc]initWithFrame:CGRectMake(8, 2, 25, 21)]autorelease];
    self.leftLab.text=@"男";
    [self.leftLab setFont:[UIFont systemFontOfSize:13.0]];
    [self.leftLab setTextColor:[UIColor colorWithRed:134/255.0 green:63/255.0 blue:41/255.0 alpha:1]];
    self.leftLab.backgroundColor=[UIColor clearColor];
    self.leftLab.userInteractionEnabled=YES;
    [leftView addSubview:self.leftLab];    
    
    UIButton *leftBtn=[UIButton buttonWithType:0];
    leftBtn.frame=CGRectMake(45, 21/2, 9, 10);
    leftBtn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"downward"]];
    [leftBtn addTarget:self action:@selector(pushLeft:) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:leftBtn];
    
    self.pushLeftV=[[[UIView alloc]initWithFrame:CGRectMake(8+8, 427-21*2, 62, 21*2)]autorelease];
    self.pushLeftV.backgroundColor=[UIColor clearColor];
    self.pushLeftV.hidden=YES;
    self.pushLeftV.layer.cornerRadius=10;
    self.pushLeftV.layer.borderWidth=1.5;
    self.pushLeftV.layer.borderColor=[UIColor grayColor].CGColor;
    [self.view addSubview:self.pushLeftV];
    
    UIButton *nvBtn=[UIButton buttonWithType:1];
    [nvBtn setTitle:@"女" forState:UIControlStateNormal];
    nvBtn.frame=CGRectMake(0, 0, 62, 21);
    [nvBtn addTarget:self action:@selector(nvBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.pushLeftV addSubview:nvBtn];
    UIButton *nanBtn=[UIButton buttonWithType:1];
    [nanBtn setTitle:@"男" forState:UIControlStateNormal];
    nanBtn.frame=CGRectMake(0, 21, 62, 21);
    [nanBtn addTarget:self action:@selector(nanBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.pushLeftV addSubview:nanBtn];
    /////////////////////////////////////
    
    UIView *rightView=[[[UIView alloc]initWithFrame:CGRectMake(100, 427, 64, 28)]autorelease];
    rightView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"fankuianjian"]];
//    rightView.layer.cornerRadius=10;
//    rightView.layer.borderWidth=3;
//    rightView.layer.borderColor=[UIColor grayColor].CGColor;
    [self.view addSubview:rightView];
    
    self.rightLab=[[[UILabel alloc]initWithFrame:CGRectMake(7, 2, 50, 21)]autorelease];
    self.rightLab.text=@"年龄";
    [self.rightLab setFont:[UIFont systemFontOfSize:12.0]];
    [self.rightLab setTextColor:[UIColor colorWithRed:134/255.0 green:63/255.0 blue:41/255.0 alpha:1]];
    self.rightLab.backgroundColor=[UIColor clearColor];
    self.rightLab.userInteractionEnabled=YES;
    [rightView addSubview:self.rightLab];
    
    UIButton *rightBtn=[UIButton buttonWithType:0];
    rightBtn.frame=CGRectMake(45, 21/2, 9, 10);
    rightBtn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"downward"]];
    [rightBtn addTarget:self action:@selector(pushRight:) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:rightBtn];    
 
    self.pushRightV=[[[UIView alloc]initWithFrame:CGRectMake(100, 427-21*7, 64, 21*7)]autorelease];
    self.pushRightV.backgroundColor=[UIColor clearColor];
    self.pushRightV.hidden=YES;
    self.pushRightV.layer.cornerRadius=10;
    self.pushRightV.layer.borderWidth=1.5;
    self.pushRightV.layer.borderColor=[UIColor grayColor].CGColor;
    [self.view addSubview:self.pushRightV];    
    
    UIButton *ageBtn=[UIButton buttonWithType:1];
    [ageBtn setTitle:@"年龄" forState:UIControlStateNormal];
    //ageBtn.frame=CGRectMake(0, 12, 64, 21);
    ageBtn.frame=CGRectMake(0, 0, 64, 21);
    [ageBtn addTarget:self action:@selector(ageBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.pushRightV addSubview:ageBtn];
    
    UIButton *btn18=[UIButton buttonWithType:1];
    [btn18 setTitle:@"<18" forState:UIControlStateNormal];
    //btn18.frame=CGRectMake(0, 21+2+2+2+2+2, 64, 21);
    btn18.frame=CGRectMake(0, 21, 64, 21);
    [btn18 addTarget:self action:@selector(btn18:) forControlEvents:UIControlEventTouchUpInside];
    [self.pushRightV addSubview:btn18];
    
    UIButton *btn25=[UIButton buttonWithType:1];
    [btn25 setTitle:@"18〜25" forState:UIControlStateNormal];
    //btn25.frame=CGRectMake(0, 21+21+2+2+2+2, 64, 21);
    btn25.frame=CGRectMake(0, 21+21, 64, 21);
    [btn25 addTarget:self action:@selector(btn25:) forControlEvents:UIControlEventTouchUpInside];
    [self.pushRightV addSubview:btn25];
    
    UIButton *btn35=[UIButton buttonWithType:1];
    [btn35 setTitle:@"25〜35" forState:UIControlStateNormal];
    //btn35.frame=CGRectMake(0, 21+21+21+2+2+2, 64, 21);
    btn35.frame=CGRectMake(0, 21+21+21, 64, 21);
    [btn35 addTarget:self action:@selector(btn35:) forControlEvents:UIControlEventTouchUpInside];
    [self.pushRightV addSubview:btn35];
    
    UIButton *btn45=[UIButton buttonWithType:1];
    [btn45 setTitle:@"35〜45" forState:UIControlStateNormal];
    //btn45.frame=CGRectMake(0, 21+21+21+21+2+2, 64, 21);
    btn45.frame=CGRectMake(0, 21+21+21+21, 64, 21);
    [btn45 addTarget:self action:@selector(btn45:) forControlEvents:UIControlEventTouchUpInside];
    [self.pushRightV addSubview:btn45];
    
    UIButton *btn55=[UIButton buttonWithType:1];
    [btn55 setTitle:@"45〜50" forState:UIControlStateNormal];
    //btn55.frame=CGRectMake(0, 21+21+21+21+21+2, 64, 21);
    btn55.frame=CGRectMake(0, 21+21+21+21+21, 64, 21);
    [btn55 addTarget:self action:@selector(btn55:) forControlEvents:UIControlEventTouchUpInside];
    [self.pushRightV addSubview:btn55];
    
    UIButton *btn60=[UIButton buttonWithType:1];
    [btn60 setTitle:@">50" forState:UIControlStateNormal];
    btn60.frame=CGRectMake(0, 21+21+21+21+21+21, 64, 21);
    [btn60 addTarget:self action:@selector(btn60:) forControlEvents:UIControlEventTouchUpInside];
    [self.pushRightV addSubview:btn60];
    
    /////////////////////////////////////        
    UIButton *tiJiaoBtn=[UIButton buttonWithType:0];
    tiJiaoBtn.frame=CGRectMake(250, 427, 50, 28);
    tiJiaoBtn.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pressed1"]];
    [tiJiaoBtn setTitle:@"提交" forState:UIControlStateNormal];
    [tiJiaoBtn addTarget:self action:@selector(tiJiao:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tiJiaoBtn];
    
}
-(void)btn60:(id)sender{
    self.rightLab.text=@">50";
    self.pushRightV.hidden=YES;
}
-(void)btn55:(id)sender{
    self.rightLab.text=@"45〜50";
    self.pushRightV.hidden=YES;
}

-(void)btn45:(id)sender{
    self.rightLab.text=@"35〜45";
    self.pushRightV.hidden=YES;
}

-(void)btn35:(id)sender{
    self.rightLab.text=@"25〜35";
    self.pushRightV.hidden=YES;
}

-(void)btn25:(id)sender{
    self.rightLab.text=@"18〜25";
    self.pushRightV.hidden=YES;
}
-(void)btn18:(id)sender{
    self.rightLab.text=@"<18";
    self.pushRightV.hidden=YES;
}
-(void)ageBtn:(id)sender{
    self.rightLab.text=@"年龄";
    self.pushRightV.hidden=YES;
}
-(void)nvBtn:(id)sender{    
    self.leftLab.text=@"女";
    self.pushLeftV.hidden=YES;    
}
-(void)nanBtn:(id)sender{
    self.leftLab.text=@"男";
    self.pushLeftV.hidden=YES;
}
-(void)pushRight:(id)sende{    
    self.pushRightV.hidden=NO;
    self.pushLeftV.hidden=YES;
}
-(void)pushLeft:(id)sender{    
    self.pushLeftV.hidden=NO;
    self.pushRightV.hidden=YES;
}
-(void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length==0) {
        self.noLabel.text=@"请输入您的反馈意见...";
    }else
    {
    self.noLabel.text=@"";
    }
}
-(void)tiJiao:(id)sender{
    NSLog(@"提交成功");
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"提交成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)backMainView:(id)sender{
    NSLog(@"返回");
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)search:(id)sender{
    NSLog(@"搜索");    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];   
}

@end
