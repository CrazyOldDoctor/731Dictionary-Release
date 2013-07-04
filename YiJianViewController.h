//
//  YiJianViewController.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-25.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YiJianViewController : UIViewController<UITextViewDelegate>
@property (retain,nonatomic) UILabel *topLabel, *noLabel;
@property (retain,nonatomic) UIButton *backButton, *mainButton;//返回按钮和主页按钮
@property (retain,nonatomic) UILabel *leftLab, *rightLab;
@property (retain,nonatomic) UIView *pushLeftV, *pushRightV;
@end
