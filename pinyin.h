//
//  pinyin.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface pinyin : NSObject
//创建映射列表
@property (assign,nonatomic) int id;
@property (retain,nonatomic) NSString *pinyin;

+(NSMutableArray *) findbypinyin:(NSString *)pinYin;
@end
