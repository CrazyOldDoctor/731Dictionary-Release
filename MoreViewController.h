//
//  MoreViewController.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreViewController : UIViewController
@property (retain,nonatomic) UILabel *topLabel;
@property (retain,nonatomic) UIButton *backButton,*mainButton;//返回按钮和主页按钮
@property (retain,nonatomic) UIButton *shouChangBtn;
//便利构造方法
-(id)setView:(CGRect)labCGR andtitle:(NSString *)title andImgCGR:(CGRect)imgCGR andbtnCGR:(CGRect) btnCGR andBtnSel:(SEL)btnSel andViewCGR:(CGRect) viewCGR;
@end
