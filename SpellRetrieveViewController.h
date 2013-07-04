//
//  SpellRetrieveViewController.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpellRetrieveViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (retain,nonatomic) UILabel *topLabel;//充当导航条
@property (retain,nonatomic) UIButton *backButton;//返回上一页按钮
@property (retain,nonatomic) UITableView *tabView;//单元格
@property (retain,nonatomic) NSArray *tabelCellArray;

//@property (retain,nonatomic) UIImage *rightImage;//右边字母显示底图
//@property (retain,nonatomic) UIImageView *rightImageView;
@property (retain,nonatomic) NSMutableArray *sections;//分区
@property (retain,nonatomic) NSMutableArray *tabArray;
@property (retain,nonatomic) NSString *pinYinURL;

@property (retain,nonatomic) UIImageView *rightImageView;

@end
