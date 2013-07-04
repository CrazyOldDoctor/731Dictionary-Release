//
//  BuShou.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuShou : NSObject
//创建映射列表
@property (assign,nonatomic) int id;
@property (assign,nonatomic) int bihua;
@property (retain,nonatomic) NSString *title;
+(NSMutableArray *) findbyBiHua:(int) biHua;//按笔画查询
//+(NSMutableArray *) findAll;//查询全部
@end
