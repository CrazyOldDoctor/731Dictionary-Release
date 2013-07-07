
#import "MoreViewController.h"
#import "AboutUSViewController.h"
#import "YiJianViewController.h"
#import "MyCollectViewController.h"
#import <ShareSDK/ShareSDK.h>
#import "UMFeedback.h"
@interface MoreViewController ()

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //顶部===================================================================================================
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
    
    self.backButton=[[[UIButton alloc]initWithFrame:CGRectMake(20, (44-21)/2, 22, 21)]autorelease];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"return@2x.png"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backMainView:) forControlEvents:UIControlEventTouchUpInside];
    [self.topLabel addSubview:self.backButton];
    
    UILabel *left=[[[UILabel alloc]initWithFrame:CGRectMake(60, 1, 1, 44)]autorelease];
    left.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"top.png"]];
    [self.topLabel addSubview:left];
    //用便利构造器创建控件
    [self setView:CGRectMake(20, 50, 150, 40) andtitle:@"我的收藏" andImgCGR:CGRectMake(280, 64-5, 25, 26) andbtnCGR:CGRectMake(0, 50, 320, 40) andBtnSel:@selector(shouChang:) andViewCGR:CGRectMake(0, 95, 320,1)];
    
    [self setView:CGRectMake(20, 50+50, 150, 40) andtitle:@"分享" andImgCGR:CGRectMake(280, 64-5+50, 25, 26) andbtnCGR:CGRectMake(0, 50+50, 320, 40) andBtnSel:@selector(share:) andViewCGR:CGRectMake(0, 95+50, 320,1)];    
    
    [self setView:CGRectMake(20, 50+50+50, 150, 40) andtitle:@"意见反馈" andImgCGR:CGRectMake(280, 64-5+50+50, 25, 26) andbtnCGR:CGRectMake(0, 50+50+50, 320, 40) andBtnSel:@selector(yiJian:) andViewCGR:CGRectMake(0, 95+50+50, 320,1)];
    
	[self setView:CGRectMake(20, 50+50+50+50, 150, 40) andtitle:@"精品应用" andImgCGR:CGRectMake(280, 64-5+50+50+50, 25, 26) andbtnCGR:CGRectMake(0, 50+50+50+50, 320, 40) andBtnSel:@selector(jingPing:) andViewCGR:CGRectMake(0, 95+50+50+50, 320,1)];
    
    [self setView:CGRectMake(20, 50+50+50+50+50, 150, 40) andtitle:@"应用打分" andImgCGR:CGRectMake(280, 64-5+50+50+50+50, 25, 26) andbtnCGR:CGRectMake(0, 50+50+50+50+50, 320, 40) andBtnSel:@selector(score:) andViewCGR:CGRectMake(0, 95+50+50+50+50, 320,1)];
    
    [self setView:CGRectMake(20, 50+50+50+50+50+50, 150, 40) andtitle:@"关于我们" andImgCGR:CGRectMake(280, 64-5+50+50+50+50+50, 25, 26) andbtnCGR:CGRectMake(0, 50+50+50+50+50+50, 320, 40) andBtnSel:@selector(aboutUs:) andViewCGR:CGRectMake(0, 95+50+50+50+50+50, 320,1)];
}
-(id)setView:(CGRect)labCGR andtitle:(NSString *)title andImgCGR:(CGRect)imgCGR andbtnCGR:(CGRect) btnCGR andBtnSel:(SEL)btnSel andViewCGR:(CGRect) viewCGR{
    UILabel *titleLab=[[[UILabel alloc]initWithFrame:labCGR]autorelease];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.text=title;
    [titleLab setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25]];
    [titleLab setTextColor:[UIColor colorWithRed:134/255.0 green:63/255.0 blue:41/255.0 alpha:1]];
    [self.view addSubview:titleLab];    
    
    UILabel *titleImg=[[[UILabel alloc]initWithFrame:imgCGR]autorelease];
    titleImg.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"continue"]];
    [self.view addSubview:titleImg];
    
    self.shouChangBtn =[UIButton buttonWithType:0];
    self.shouChangBtn.frame=btnCGR;
    self.shouChangBtn.backgroundColor=[UIColor lightGrayColor];
    [self.shouChangBtn addTarget:self action:btnSel forControlEvents:UIControlEventTouchUpInside];
    self.shouChangBtn.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.shouChangBtn];
    
    UIView *lineView=[[[UIView alloc]initWithFrame:viewCGR]autorelease];
    lineView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"dividing-line.png"]];
    [self.view addSubview:lineView];    
    return self.view;
}
-(void)aboutUs:(id)sender{
    NSLog(@"关于我们");
    AboutUSViewController *aboutUs=[[[AboutUSViewController alloc]init]autorelease];
    [self.navigationController pushViewController:aboutUs animated:YES];
}
-(void)score:(id)sender{
    NSLog(@"应用打分");
}
-(void)jingPing:(id)sender{
    NSLog(@"精品应用");
}
-(void)yiJian:(id)sender{
    NSLog(@"意见反馈");
    [UMFeedback showFeedback:self withAppkey:@"4eeb0c7b527015643b000003"];
}
-(void)share:(id)sender{
    NSLog(@"分享");
    //创建分享内容
    NSString *imagePath =  [[NSBundle mainBundle] pathForResource:@"ShareSDK"
                                                           ofType:@"jpg"];
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"有生僻字不懂，立马下载《汉语字典》，体验中华民族五千年的造字精髓。 http://www.zhizhang.com/more/download.php?appid=19"
                                       defaultContent:@"默认分享内容，没内容时显示"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"汉字字典"
                                                  url:@"http://www.zhizhang.com"
                                          description:nil
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

}
-(void)shouChang:(id)sender{
    NSLog(@"我的收藏");
    MyCollectViewController *myCollect=[[[MyCollectViewController alloc]init]autorelease];
    [self.navigationController pushViewController:myCollect animated:YES];
}
-(void)backMainView:(id)sender{
    NSLog(@"返回");
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];    
}

@end
