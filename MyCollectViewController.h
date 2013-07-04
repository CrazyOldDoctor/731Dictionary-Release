//
//  MyCollectViewController.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-24.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (retain,nonatomic) UILabel *topLabel;
@property (retain,nonatomic) UIButton *backButton,*mainButton;//返回按钮和主页按钮
@property (retain,nonatomic) UITableView *tableView;//表格对象，提供外观

@property (retain,nonatomic) NSMutableArray *showArray;

@property (copy,nonatomic ) NSString *ziTi;
@property (copy, nonatomic) NSString *pinYin;
@property (copy, nonatomic) NSString *fanTi;
@property (copy, nonatomic) NSString *buShou;
@property (copy, nonatomic) NSString *biShun;
@property (copy, nonatomic) NSString *zhuYin;
@property (copy, nonatomic) NSString *jieGou;
@property (copy, nonatomic) NSString *buShouBiHua;
@property (copy, nonatomic) NSString *biHua;

@property (copy, nonatomic) NSString *jinBenXinXi;
@property (copy, nonatomic) NSString *hyZiDian;
@property (copy, nonatomic) NSString *zuCiChengYu;
@property (copy, nonatomic) NSString *yinWenFanYi;



@end
