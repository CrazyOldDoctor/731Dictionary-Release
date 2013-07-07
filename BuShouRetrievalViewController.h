//
//  BuShouRetrievalViewController.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuShouRetrievalViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (retain,nonatomic) UILabel *topLabel;//充当导航条
@property (retain,nonatomic) UIButton *backButton;//返回上一页按钮
@property (retain,nonatomic) UITableView *tabView;//单元格
@property (retain,nonatomic) NSArray *tabelCellArray;

@property (retain,nonatomic) NSArray *sections;//分区
@property (retain,nonatomic) NSMutableArray *tabArray;
@property (retain,nonatomic) NSArray *bihuaArray;
@property (retain,nonatomic) NSString *buShouURL;

@property (retain,nonatomic) UILabel *zilab;
@property (retain,nonatomic) UIView *vie;
@end
