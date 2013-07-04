//
//  AboutUSViewController.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutUSViewController : UIViewController
@property (retain,nonatomic) UILabel *topLabel,*middleLabel,*topTitleLabel,*downTitleLabel,*middleView,*titleLab,*netWebLab,*weiBoLab,*weiXinLab;
@property (retain,nonatomic) UIButton *backButton,*mainButton;//返回按钮和主页按钮
@property (retain,nonatomic) UIView *bgView;
@property (retain,nonatomic) UIImageView *imagee;
@property (retain,nonatomic) UITextView *textView;
@end
