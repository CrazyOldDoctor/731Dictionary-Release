//
//  ShouChanrShuXing.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "ShouChanrShuXing.h"
#import "connection.h"
@implementation ShouChanrShuXing
//全表查询
+(NSMutableArray *)findAll{
    NSMutableArray *shouChangArray=nil;
    sqlite3 *sql3=[connection createDB];
    sqlite3_stmt *st;
    int p=sqlite3_prepare_v2(sql3, "select *from ShouChang", -1, &st , nil);
    if (p == SQLITE_OK) {//判断sql语法正确性
        shouChangArray=[[[NSMutableArray alloc]init]autorelease];
        while (sqlite3_step(st)==SQLITE_ROW) {//是否查询到记录
            ShouChanrShuXing * shouChang = [[[ShouChanrShuXing alloc]init]autorelease];
            shouChang.hzid = sqlite3_column_int(st, 0);            
            shouChang.ziTi = [NSString stringWithCString:(char *)sqlite3_column_text(st, 1) encoding:NSUTF8StringEncoding];
            shouChang.pinYin =[NSString stringWithCString:(char *)sqlite3_column_text(st, 2) encoding:NSUTF8StringEncoding];;
            shouChang.fanTi = [NSString stringWithCString:(char *)sqlite3_column_text(st, 3) encoding:NSUTF8StringEncoding];
            shouChang.buShou = [NSString stringWithCString:(char *)sqlite3_column_text(st, 4) encoding:NSUTF8StringEncoding];
            shouChang.biShun = [NSString stringWithCString:(char *)sqlite3_column_text(st, 5) encoding:NSUTF8StringEncoding];
            shouChang.zhuYin = [NSString stringWithCString:(char *)sqlite3_column_text(st, 6) encoding:NSUTF8StringEncoding];
            shouChang.jieGou = [NSString stringWithCString:(char *)sqlite3_column_text(st, 7) encoding:NSUTF8StringEncoding];
            shouChang.buShouBiHua = [NSString stringWithCString:(char *)sqlite3_column_text(st, 8) encoding:NSUTF8StringEncoding];
            shouChang.biHua = [NSString stringWithCString:(char *)sqlite3_column_text(st, 9) encoding:NSUTF8StringEncoding];
            shouChang.jinBenXinXi = [NSString stringWithCString:(char *)sqlite3_column_text(st, 10) encoding:NSUTF8StringEncoding];
            shouChang.hyZiDian = [NSString stringWithCString:(char *)sqlite3_column_text(st, 11) encoding:NSUTF8StringEncoding];
            shouChang.zuCiChengYu = [NSString stringWithCString:(char *)sqlite3_column_text(st, 12) encoding:NSUTF8StringEncoding];
            shouChang.yinWenFanYi = [NSString stringWithCString:(char *)sqlite3_column_text(st, 13) encoding:NSUTF8StringEncoding];            
            [shouChangArray addObject:shouChang];
        }
    }
    sqlite3_finalize(st);    
    return shouChangArray;    
}
//插入
+(void)insertWithZiTi:    (NSString *) ziTi
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
            andYiWenFanYi:(NSString *) yiWenFanYi
{    
    sqlite3 *sql3=[connection createDB];
    sqlite3_stmt *st;
    int p=sqlite3_prepare_v2(sql3, "insert into ShouChang(ziti,pinyin,fanti,bushou,bishun,zhuyin,jiegou,bushoubihua,bihua,jinbenxinxi,hyzidian,zucichengyu,yiwenfanyi) values(?,?,?,?,?,?,?,?,?,?,?,?,?)", -1, &st, nil);  //  insert into ZuiJinSouSuo (ziTi) values('书')
    //  delete from ZuiJinSouSuo where hzid=1     select *from  ZuiJinSouSuo
    if (p==SQLITE_OK) {        
        sqlite3_bind_text(st, 1, [ziTi UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 2, [pinYin UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 3, [fanTi UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 4, [buShou UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 5, [bisShun UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 6, [zhuYin UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 7, [jieGou UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 8, [buShouBiHua UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 9, [biHua UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 10, [jiBenXinxi UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 11, [hyZiDian UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 12, [zuCiChengYu UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 13, [yiWenFanYi UTF8String], -1, SQLITE_STATIC);
        
        if (sqlite3_step(st)==SQLITE_ERROR) {
            NSLog(@"error:failed in kit update database");
        }
        else{
            NSLog(@"sql语法错误");
        }
        sqlite3_step(st);
    }
    sqlite3_finalize(st);    
}

@end
