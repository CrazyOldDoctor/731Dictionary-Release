//
//  MyCollectCell.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-27.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>
@property (retain,nonatomic) UILabel *titleLab,*pinYinLab,*buShouLab,*biHuaLab;//文字、拼音、部首、笔画
@property (retain,nonatomic) UIButton *round;

@end
