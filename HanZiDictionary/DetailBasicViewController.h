//
//  DetailBasicViewController.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-22.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailBasicViewController : UIViewController<UIScrollViewDelegate,UITextViewDelegate>
@property (retain,nonatomic) UILabel *topLabel,*titleLabel;//顶端信息和文字标题 
@property (retain,nonatomic) UIButton *backButton,*mainButton;//返回按钮和主页按钮
@property (retain,nonatomic) UIButton *pinYinButton,*zhuYinButton;//拼音和注音发声
@property (retain,nonatomic) UIButton *jiBenXinXi,*hanYuZiDian,*zuCiChengYu,*yingWenFanYi;
@property (retain,nonatomic) UILabel *pinYinLab,*fanTiLab,*buShouLab,*biShunLab,*zhuYinLab,*jieGouLab,*buShouBiHuaLab,*biHuaLab,*basicInfoLab,*detailInfoLab;
@property (retain,nonatomic) UIView *jiBenView, *huangXingZhengView;
@property (retain,nonatomic) UILabel *jiBenXinXiLab, *DetailLab;

@property (retain,nonatomic) UILabel *downFourthLab,*backLab;//底部控件
@property (retain,nonatomic) UIView *downFourthView;
@property (retain,nonatomic) UITextView *textView;
@property (retain,nonatomic) NSString *jiBenStr,*hanYuStr,*zuCeStr,*yinWenStr;
//创建构造方法
-(id)setAA:(CGRect)FCG andFimg:(NSString *)img andFLabel:(CGRect) FLabel andText:(NSString *)txt andbtnCG:(CGRect)btCG andBtn:(SEL)btn;
@property (retain,nonatomic) NSString *urlSt;
@end
