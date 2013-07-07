//
//  ViewController.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-21.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (retain,nonatomic) UILabel *topLabel;
@property (retain,nonatomic) UIButton *backButton,*mainButton;//返回按钮和主页按钮

@property (assign,nonatomic) int num;
@property (retain,nonatomic) NSMutableArray *weiZiArrray;//表格数据，提供内容
@property (retain,nonatomic) UITableView *tableView;//表格对象，提供外观

@property (retain,nonatomic) NSArray*ary;
@property (retain,nonatomic) NSString *urlStr;//用来接上个界面的网址
@property (retain,nonatomic) UIActivityIndicatorView *act;

@property (retain,nonatomic) NSTimer *time;
@property (retain,nonatomic) NSString *titleOne;
-(void)getData:(int)num;
@end
