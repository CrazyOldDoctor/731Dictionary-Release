//
//  ShouChanrShuXing.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShouChanrShuXing : NSObject
//类与表的映射
@property (assign, nonatomic) int hzid;
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


+(NSMutableArray *)findAll;//查找全部
+(void)insertWithZiTi:(NSString *) ziTi
            andPinYin:(NSString *) pinYin
             andFanTi:(NSString *) fanTi
            andBuShou:(NSString *) buShou
            andBiShun:(NSString *) bisShun
            andZhuYin:(NSString *) zhuYin
            andJieGou:(NSString *) jieGou
       andBushouBiHua:(NSString *) buShouBiHua
             andBiHua:(NSString *) biHua
       andJinBenXinXi:(NSString *) jiBenXinxi
          andHyZiDian:(NSString *) hyZiDian
       andZuCiChengYu:(NSString *) zuCiChengYu
        andYiWenFanYi:(NSString *) yiWenFanYi;//插入

//  delete from book where bookid=
@end
