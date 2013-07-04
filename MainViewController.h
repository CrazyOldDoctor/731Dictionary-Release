//
//  MainViewController.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARCMacro.h"
@class YLProgressBar;
@interface MainViewController : UIViewController<UITextFieldDelegate>
{
@protected
    NSTimer *progressTimer;
}

@property (retain,nonatomic) UILabel *topLabel;
@property (retain,nonatomic) UIButton *backButton,*mainButton;//返回按钮和主页按钮

@property(retain,nonatomic)UITextField *txtField;//输入框
@property(retain,nonatomic)UIButton *pyziButton;//拼音按钮
@property(retain,nonatomic)UIButton *bsziButton;
@property(retain,nonatomic)UIButton *ABCButton;//abc按钮
@property(retain,nonatomic)UIButton *OneButton;

@property(retain,nonatomic)UILabel * pyzmLabel;

@property(retain,nonatomic)UIView *ABCView;//ABC图片视图
@property(retain,nonatomic)UIView *OneView;//123图片视图

@property(retain,nonatomic)NSArray *pyArray;
@property(retain,nonatomic)NSArray *bsArray;

@property (retain,nonatomic) NSString *buShouURL;
@property (retain,nonatomic) NSMutableArray *TabArray;
@property (retain,nonatomic) NSArray *pinYArrray;
@property (retain,nonatomic) NSMutableArray *ziTiArray;
@property (retain,nonatomic) NSString *pinYinURL;

@property (retain,nonatomic) YLProgressBar *progressView;//进度条
@property (retain, nonatomic)UILabel *progressValueLabel;
@property(retain,nonatomic)UIImageView*beijingImgV;
@property (retain,nonatomic)UIButton *zjBtn;


@end
