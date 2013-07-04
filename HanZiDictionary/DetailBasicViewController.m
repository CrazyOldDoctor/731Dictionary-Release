//
//  DetailBasicViewController.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//
#import "DetailBasicViewController.h"
#import "DetailBasicShuXing.h"
#import "AboutUSViewController.h"
#import "MoreViewController.h"
#import "MyCollectViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "SpellRetrieveViewController.h"
#import "MainViewController.h"
#import "ASIHTTPRequest.h"
#import "ShouChanrShuXing.h"
#import "JSON.h"
#import <ShareSDK/ShareSDK.h>
@interface DetailBasicViewController ()
@end
@implementation DetailBasicViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
                
    }
    return self;
}
//-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
////    [self.textView resignFirstResponder];
////    return YES;
//    
//}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //*****************
      
//    self.urlSt=[NSString stringWithFormat:@"http://www.chazidian.com/service/word/%@",self.titleLabel.text];
//    NSURL *jsonUrl=[NSURL URLWithString:self.urlSt];
//    NSError *error=nil;
//    NSString *jsonStr=[NSString stringWithContentsOfURL:jsonUrl encoding:NSUTF8StringEncoding error:&error];
//    NSDictionary *jsonDic=[jsonStr JSONValue];//NSLog(@"内容＝＝＝＝%@",jsonDic);
//    NSDictionary *dataDic=[jsonDic objectForKey:@"data"];//NSLog(@"data=====%@",dataDic);
//    NSDictionary *baseInfo=[dataDic objectForKey:@"baseinfo"];
//    NSDictionary *simp=[baseInfo objectForKey:@"simp"];
//    NSLog(@"内容为：%@",simp);
//   // NSDictionary *
    //*****************
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.topLabel=[[[UILabel alloc]initWithFrame:CGRectMake(0, -0.5, 320, 44)]autorelease];
//    self.topLabel.text=@"汉字字典";
    self.topLabel.textAlignment=NSTextAlignmentCenter;
    self.topLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    self.topLabel.userInteractionEnabled=YES;
    self.topLabel.textColor=[UIColor whiteColor];
    self.topLabel.shadowOffset=CGSizeMake(0, 3);
    self.topLabel.shadowColor=[UIColor blackColor];
    [self.topLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:19]];
    [self.view addSubview:self.topLabel];
    
    self.backButton=[[[UIButton alloc]initWithFrame:CGRectMake(20, (44-21)/2, 22, 21)]autorelease];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backMainView:) forControlEvents:UIControlEventTouchUpInside];
    [self.topLabel addSubview:self.backButton];    
    
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
    //===================================================================================================
    self.titleLabel=[[[UILabel alloc]initWithFrame:CGRectMake(10-2, 57, 60, 61)]autorelease];
    self.titleLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"banmizige"]];
    self.titleLabel.textAlignment=NSTextAlignmentCenter;
    [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:50]];
    [self.view addSubview:self.titleLabel];    
    
    self.pinYinLab=[[[UILabel alloc]initWithFrame:CGRectMake(80-2, 50, 80, 15)]autorelease];
    //self.pinYinLab.text=[NSString stringWithFormat:@"拼音：%@",];
    self.pinYinLab.text=@"拼音:";
    [self.pinYinLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [self.pinYinLab setTextColor:[UIColor colorWithRed:123/255.0 green:44/255.0 blue:18/255.0 alpha:1]];
    self.pinYinLab.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.pinYinLab];
    
    self.fanTiLab=[[[UILabel alloc]initWithFrame:CGRectMake(80-2, 70, 80, 15)]autorelease];
    //self.fanTiLab.text=[NSString stringWithFormat:@"拼音：%@",];
    self.fanTiLab.text=@"繁体:";
    [self.fanTiLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [self.fanTiLab setTextColor:[UIColor colorWithRed:123/255.0 green:44/255.0 blue:18/255.0 alpha:1]];
    self.fanTiLab.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.fanTiLab];    
    
    self.buShouLab=[[[UILabel alloc]initWithFrame:CGRectMake(80-2, 90, 80, 15)]autorelease];
    //self.buShouLab.text=[NSString stringWithFormat:@"拼音：%@",];
    //self.buShouLab.text=@"部首:";
    [self.buShouLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [self.buShouLab setTextColor:[UIColor colorWithRed:123/255.0 green:44/255.0 blue:18/255.0 alpha:1]];
    self.buShouLab.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.buShouLab];   
    
    self.biShunLab=[[[UILabel alloc]initWithFrame:CGRectMake(80-2, 110, 320-80, 15)]autorelease];
    //self.biShunLab.text=[NSString stringWithFormat:@"拼音：%@",];
    self.biShunLab.text=@"笔顺:";
    [self.biShunLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [self.biShunLab setTextColor:[UIColor colorWithRed:123/255.0 green:44/255.0 blue:18/255.0 alpha:1]];
    self.biShunLab.backgroundColor=[UIColor clearColor];
    //self.biShunLab.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:self.biShunLab];    
    
    self.zhuYinLab=[[[UILabel alloc]initWithFrame:CGRectMake(180-2, 50, 80, 15)]autorelease];
    //self.zhuYinLab.text=[NSString stringWithFormat:@"拼音：%@",];
    self.zhuYinLab.text=@"注音:";
    [self.zhuYinLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [self.zhuYinLab setTextColor:[UIColor colorWithRed:123/255.0 green:44/255.0 blue:18/255.0 alpha:1]];
    self.zhuYinLab.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.zhuYinLab];
    
    self.jieGouLab=[[[UILabel alloc]initWithFrame:CGRectMake(180-2, 70, 320-180-10, 15)]autorelease];
    //self.jieGouLab.text=[NSString stringWithFormat:@"拼音：%@",];
    self.jieGouLab.text=@"结构:";
    [self.jieGouLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [self.jieGouLab setTextColor:[UIColor colorWithRed:123/255.0 green:44/255.0 blue:18/255.0 alpha:1]];
    self.jieGouLab.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.jieGouLab];    
    
    self.buShouBiHuaLab=[[[UILabel alloc]initWithFrame:CGRectMake(180-2, 90, 80, 15)]autorelease];
    //self.buShouBiHuaLab.text=[NSString stringWithFormat:@"拼音：%@",];
    self.buShouBiHuaLab.text=@"部首笔画:";
    [self.buShouBiHuaLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];
    [self.buShouBiHuaLab setTextColor:[UIColor colorWithRed:123/255.0 green:44/255.0 blue:18/255.0 alpha:1]];
    self.buShouBiHuaLab.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.buShouBiHuaLab];
    
    self.biHuaLab=[[[UILabel alloc]initWithFrame:CGRectMake(260-2, 90, 50, 15)]autorelease];
    //self.biHuaLab.text=[NSString stringWithFormat:@"拼音：%@",];
    //self.biHuaLab.text=@"笔画:";
    [self.biHuaLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13]];//Arial  Verdana
    [self.biHuaLab setTextColor:[UIColor colorWithRed:123/255.0 green:44/255.0 blue:18/255.0 alpha:1]];
    self.biHuaLab.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.biHuaLab];
    //===================================================================================================
    self.pinYinButton=[UIButton buttonWithType:0];
    self.pinYinButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"loud"]];
    [self.pinYinButton addTarget:self action:@selector(pinYinFaYin:) forControlEvents:UIControlEventTouchUpInside];
    
    self.pinYinButton.frame=CGRectMake(150, 46, 25, 23);
    [self.view addSubview:self.pinYinButton];        
    self.zhuYinButton=[UIButton buttonWithType:0];
    self.zhuYinButton.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"loud"]];
    [self.zhuYinButton addTarget:self action:@selector(zhuYinFaYin:) forControlEvents:UIControlEventTouchUpInside];
    self.zhuYinButton.frame=CGRectMake(250, 46, 25, 23);
    [self.view addSubview:self.zhuYinButton];
        
    self.jiBenXinXi=[[[UIButton alloc]initWithFrame:CGRectMake(10, 130, 75, 33)]autorelease];
    self.jiBenXinXi.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pyjz_normal01"]];
    [self.jiBenXinXi setTitle:@"基本信息" forState:UIControlStateNormal];
    [self.jiBenXinXi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.jiBenXinXi.titleLabel.font=[UIFont systemFontOfSize:14.0];
    [self.jiBenXinXi setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed1"] forState:UIControlStateSelected];
    //选择状态为黄色*****setBackgroundImage才不会遮挡文字******
    self.jiBenXinXi.selected=YES;
    [self.jiBenXinXi addTarget:self action:@selector(jiBenXinXi:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.jiBenXinXi];      
        
    self.hanYuZiDian=[[[UIButton alloc]initWithFrame:CGRectMake(10+74, 130, 75, 33)]autorelease];
    self.hanYuZiDian.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pyjz_normal01"]];
    [self.hanYuZiDian setTitle:@"汉语字典" forState:UIControlStateNormal];
    [self.hanYuZiDian setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.hanYuZiDian.titleLabel.font=[UIFont systemFontOfSize:14.0];
    [self.hanYuZiDian setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed1"] forState:UIControlStateSelected];
    //选择状态为黄色*****setBackgroundImage才不会遮挡文字******
    self.hanYuZiDian.selected=NO;
    [self.hanYuZiDian addTarget:self action:@selector(hanYuZiDian:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.hanYuZiDian];  
    
    self.zuCiChengYu=[[[UIButton alloc]initWithFrame:CGRectMake(84+74, 130, 75, 33)]autorelease];
    self.zuCiChengYu.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pyjz_normal01"]];
    [self.zuCiChengYu setTitle:@"组词成语" forState:UIControlStateNormal];
    [self.zuCiChengYu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.zuCiChengYu.titleLabel.font=[UIFont systemFontOfSize:14.0];
    [self.zuCiChengYu setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed1"] forState:UIControlStateSelected];
    //选择状态为黄色*****setBackgroundImage才不会遮挡文字******
    self.zuCiChengYu.selected=NO;
    [self.zuCiChengYu addTarget:self action:@selector(zuCiChengYu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.zuCiChengYu]; 
    
    self.yingWenFanYi=[[[UIButton alloc]initWithFrame:CGRectMake(84+74+74, 130, 75, 33)]autorelease];
    self.yingWenFanYi.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"pyjz_normal01"]];
    [self.yingWenFanYi setTitle:@"英文翻译" forState:UIControlStateNormal];
    [self.yingWenFanYi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.yingWenFanYi.titleLabel.font=[UIFont systemFontOfSize:14.0];
    [self.yingWenFanYi setBackgroundImage:[UIImage imageNamed:@"pyjz_pressed1"] forState:UIControlStateSelected];
    //选择状态为黄色*****setBackgroundImage才不会遮挡文字******
    self.yingWenFanYi.selected=NO;
    [self.yingWenFanYi addTarget:self action:@selector(yingWenFanYi:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.yingWenFanYi];   
    
    //===================================================================================================
    self.jiBenView =[[[UIView alloc]initWithFrame:CGRectMake(2,175, 316, 291)]autorelease];
    self.jiBenView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"informatianlow"]];   
   
    self.huangXingZhengView=[[[UIView alloc]initWithFrame:CGRectMake(255, -13, 35, 54)]autorelease];
    self.huangXingZhengView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"brooch"]];    
    [self.jiBenView addSubview:self.huangXingZhengView];
    
    [self.view addSubview:self.jiBenView];
    self.jiBenXinXiLab=[[[UILabel alloc]initWithFrame:CGRectMake(20,10, 80, 20)]autorelease];
    self.jiBenXinXiLab.text=@"基本信息:";
    [self.jiBenView addSubview:self.jiBenXinXiLab];
    
    self.textView=[[[UITextView alloc]initWithFrame:CGRectMake(27, 40, 260, 205)]autorelease];
    self.textView.backgroundColor=[UIColor clearColor];
    [self.textView setEditable:NO];//设置为不可编辑
    [self.jiBenView addSubview:self.textView];    
    //===================================================================================================
    self.backLab=[[[UILabel alloc]initWithFrame:CGRectMake(0, 420, 320, 40)]autorelease];
    self.backLab.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"calligrapher.png"]];
    self.backLab.userInteractionEnabled=YES;
    [self.view addSubview:self.backLab];    
        
    self.view=[self setAA:CGRectMake(37, 2, 25 , 28) andFimg:@"pen" andFLabel:CGRectMake(32, 28, 60, 12) andText:@"书法家" andbtnCG:CGRectMake(20, 480-61, 60, 44) andBtn:@selector(shuFaJia:)];       
    self.view=[self setAA:CGRectMake(37+72, 4, 29 , 21) andFimg:@"document" andFLabel:CGRectMake(32+79, 28, 60, 12) andText:@"复制" andbtnCG:CGRectMake(20+71, 480-61, 60, 43) andBtn:@selector(fuZhi:)];
    self.view=[self setAA:CGRectMake(60+60+63, 1, 28 , 27) andFimg:@"star" andFLabel:CGRectMake(50+70+63, 28, 60, 12) andText:@"收藏" andbtnCG:CGRectMake(40+60+66, 480-61, 60, 43) andBtn:@selector(shouChang:)];
    
    self.view=[self setAA:CGRectMake(60+60+60+72, 3, 24 , 24) andFimg:@"share" andFLabel:CGRectMake(50+70+60+72, 28, 60, 12) andText:@"分享" andbtnCG:CGRectMake(40+60+60+72, 480-61, 60, 43) andBtn:@selector(fenXiang:)];    
}
//创建便利构造器来布局底部控件
-(id)setAA:(CGRect)FCG andFimg:(NSString *)img andFLabel:(CGRect) FLabel andText:(NSString *)txt andbtnCG:(CGRect)btCG andBtn:(SEL)btn{
    self.downFourthView=[[[UIView alloc]initWithFrame:FCG]autorelease];
    self.downFourthView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:img]];
    self.downFourthView.userInteractionEnabled=YES;
    [self.backLab addSubview:self.downFourthView];
    
    self.downFourthLab=[[[UILabel alloc]initWithFrame:FLabel]autorelease];
    self.downFourthLab.backgroundColor=[UIColor clearColor];
    self.downFourthLab.userInteractionEnabled=YES;
    self.downFourthLab.font=[UIFont systemFontOfSize:11.0];
    self.downFourthLab.text=txt;    
    self.downFourthLab.userInteractionEnabled=YES;
    self.downFourthLab.textColor=[UIColor whiteColor];
   [self.backLab addSubview:self.downFourthLab];
    
    UIButton *btnFour=[UIButton buttonWithType:0];
    btnFour.frame=btCG;
    btnFour.backgroundColor=[UIColor clearColor];
    [btnFour addTarget:self action:btn forControlEvents:UIControlEventTouchUpInside];
    [btnFour setImage:[UIImage imageNamed:@"penlow"] forState:UIControlStateHighlighted];
    [self.view addSubview:btnFour];    
    return self.view;
}
-(void)fenXiang:(id)sender{
    NSLog(@"分享");
    //--------------------------
    //创建分享内容
    NSString *imagePath =  [[NSBundle mainBundle] pathForResource:@"ShareSDK"
                                                           ofType:@"jpg"];
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:self.textView.text
                                       defaultContent:@"默认分享内容，没内容时显示"
                                                image:nil//[ShareSDK imageWithPath:imagePath]
                                                title:@"汉字字典"
                                                  url:@"http://www.zhizhang.com"
                                          description:imagePath
                                            mediaType:SSPublishContentMediaTypeNews];
    
    NSArray *shareList1=[ShareSDK getShareListWithType:ShareTypeSinaWeibo,ShareTypeQQSpace,ShareTypeTencentWeibo,ShareTypeSohuWeibo,nil];
    
    [ShareSDK showShareActionSheet:nil
                         shareList:shareList1
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSPublishContentState state, id<ISSStatusInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSPublishContentStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSPublishContentStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode],  [error errorDescription]);
                                }
                            }];

    
    
//    MoreViewController *moreView=[[MoreViewController alloc]init];
//    [self.navigationController pushViewController:moreView animated:YES];
}
-(void)shouChang:(id)sender{
    NSLog(@"收藏");    
    [ShouChanrShuXing insertWithZiTi:self.titleLabel.text andPinYin:self.pinYinLab.text andFanTi:self.fanTiLab.text andBuShou:self.buShouLab.text andBiShun:self.biHuaLab.text andZhuYin:self.zhuYinLab.text andJieGou:self.jieGouLab.text andBushouBiHua:self.buShouBiHuaLab.text andBiHua:self.biHuaLab.text andJinBenXinXi:self.jiBenStr andHyZiDian:self.hanYuStr andZuCiChengYu:self.zuCeStr andYiWenFanYi:self.yinWenStr];    
    //跳出窗口提示收藏成功
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"收藏成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    for (ShouChanrShuXing *s in [ShouChanrShuXing findAll]) {
           NSLog(@"字体=%@,拼音=%@,繁体=%@,部首=%@,笔顺=%@",s.ziTi,s.pinYin,s.fanTi,s.buShou,s.biShun);
        }
}
-(void)fuZhi:(id)sender{    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"复制成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    NSString *zitiStr=[NSString stringWithFormat:@"%@\n",self.titleLabel.text];         
    NSString *pinyinStr=[NSString stringWithFormat:@"%@\n",self.pinYinLab.text];
    NSString *zhuyinStr=[NSString stringWithFormat:@"%@\n",self.zhuYinLab.text];
    NSString *fantiStr=[NSString stringWithFormat:@"%@\n",self.fanTiLab.text];
    NSString *jiegouStr=[NSString stringWithFormat:@"%@\n",self.jieGouLab.text];
    NSString *bushouStr=[NSString stringWithFormat:@"%@\n",self.buShouLab.text];
    NSString *bushoubihuaStr=[NSString stringWithFormat:@"%@\n",self.buShouBiHuaLab.text];
    NSString *bihuaStr=[NSString stringWithFormat:@"%@\n",self.biHuaLab.text];
    NSString *bishunStr=[NSString stringWithFormat:@"%@\n",self.biShunLab.text];
    NSString *jiben=[NSString stringWithFormat:@"%@\n",self.jiBenStr];
    NSString *hanyu=[NSString stringWithFormat:@"%@\n",self.hanYuStr];
    NSString *zuci=[NSString stringWithFormat:@"%@\n",self.zuCeStr];;
    NSString *yingwen=[NSString stringWithFormat:@"%@\n",self.yinWenStr];    
   
    NSString *s1=[zitiStr stringByAppendingString:pinyinStr];
    NSString *s2=[s1 stringByAppendingString:zhuyinStr];
    NSString *s3=[s2 stringByAppendingString:fantiStr];
    NSString *s4=[s3 stringByAppendingString:jiegouStr];
    NSString *s5=[s4 stringByAppendingString:bushouStr];
    NSString *s6=[s5 stringByAppendingString:bushoubihuaStr];
    NSString *s7=[s6 stringByAppendingString:bihuaStr];    
    NSString *s8=[s7 stringByAppendingString:bishunStr];
    NSString *s9=[s8 stringByAppendingString:jiben];
    NSString *s10=[s9 stringByAppendingString:hanyu];
    NSString *s11=[s10 stringByAppendingString:zuci];
    NSString *s12=[s11 stringByAppendingString:yingwen];
    //创建粘贴板，将所有字段拷贝，实现复制当前视图的文字内容
    UIPasteboard *past=[UIPasteboard generalPasteboard];
    past.string=s12;
    NSLog(@"复制内容====%@/",past.string);    
}
-(void)shuFaJia:(id)sender{
    NSLog(@"书法家");
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"即将推出，谢谢关注！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)yingWenFanYi:(id)sender{   
    self.jiBenXinXiLab.text=@"英文翻译";
    self.textView.text=self.yinWenStr;
    self.yingWenFanYi.selected=YES;
    self.hanYuZiDian.selected=NO;
    self.jiBenXinXi.selected=NO;
    self.zuCiChengYu.selected=NO;
    if (self.textView.text.length<=0) {
        self.textView.text=@"抱歉，暂时没有您所要查询的内容";
    }
}
-(void)zuCiChengYu:(id)sender{    
    self.jiBenXinXiLab.text=@"组词成语";
    self.textView.text=self.zuCeStr;
    self.zuCiChengYu.selected=YES;
    self.yingWenFanYi.selected=NO;
    self.jiBenXinXi.selected=NO;
    self.hanYuZiDian.selected=NO;
    if (self.textView.text.length<=0) {
        self.textView.text=@"抱歉，暂时没有您所要查询的内容";
    }
}
-(void)hanYuZiDian:(id)sender{    
    self.jiBenXinXiLab.text=@"汉语字典";
    self.textView.text=self.hanYuStr;
    self.hanYuZiDian.selected=YES;
    self.yingWenFanYi.selected=NO;
    self.jiBenXinXi.selected=NO;
    self.zuCiChengYu.selected=NO;
    if (self.textView.text.length<=0) {
        self.textView.text=@"抱歉，暂时没有您所要查询的内容";
    }
}
-(void)jiBenXinXi:(id)sender{    
    self.jiBenXinXiLab.text=@"基本信息";
    self.textView.text=self.jiBenStr;
    self.jiBenXinXi.selected=YES;
    self.yingWenFanYi.selected=NO;
    self.hanYuZiDian.selected=NO;
    self.zuCiChengYu.selected=NO;
    if (self.textView.text.length<=0) {
        self.textView.text=@"抱歉，暂时没有您所要查询的内容";
    }
}
//-(void)zhuYinFaYin:(id)sender{
//    NSLog(@"注音发音");    
//    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://api.ispeech.org/api/rest?apikey=8d1e2e5d3909929860aede288d6b974e&format=mp3&action=convert&voice=chchinesemale&text=%@",self.zhuYinLab.text]];
//    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
//    request.delegate=self;
//    [request startAsynchronous];//异步下载
//    [request setCompletionBlock:^{
//        NSData *sound=[request responseData];
//        NSError *error=nil;
//        AVAudioPlayer *soundPlay=[[AVAudioPlayer alloc]initWithData:sound error:&error];
//        [soundPlay play];               
//    }];      
//}

-(void)zhuYinFaYin:(UIButton *)sender{//注音发音    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.ispeech.org/api/rest?apikey=8d1e2e5d3909929860aede288d6b974e&format=mp3&action=convert&voice=chchinesemale&text=%@",self.titleLabel.text]];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    request.delegate = self;
    [request startAsynchronous];
    [request setCompletionBlock:^{
        NSData *sound = [request responseData];
        NSError *error = nil;
        AVAudioPlayer *soundPlay=[[AVAudioPlayer alloc]initWithData:sound error:&error];
        [soundPlay play];
    }];
}
-(void)pinYinFaYin:(id)sender{//拼音发音        
    NSURL *url=[NSURL URLWithString:[NSString stringWithFormat:@"http://api.ispeech.org/api/rest?apikey=8d1e2e5d3909929860aede288d6b974e&format=mp3&action=convert&voice=chchinesemale&text=%@",self.titleLabel.text]];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    request.delegate=self;
    [request startAsynchronous];//异步下载
    [request setCompletionBlock:^{
        NSData *sound=[request responseData];
        NSError *error=nil;
        AVAudioPlayer *soundPlay=[[AVAudioPlayer alloc]initWithData:sound error:&error];
        [soundPlay play];
    }];    
}
-(void)backMainView:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)mainView:(id)sender{
    NSLog(@"返回主页");
    MainViewController *main=[[[MainViewController alloc]init]autorelease];
    [self.navigationController pushViewController:main animated:YES];    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    
}
@end
