//
//  ZuiJinSouSuo.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-29.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "ZuiJinSouSuo.h"
#import "connection.h"
@implementation ZuiJinSouSuo
//+(NSMutableArray *)findAll{
//    NSMutableArray *zuiJinArray=nil;
//    sqlite3 *sql3=[connection createDB];
//    sqlite3_stmt *st;
//    int p=sqlite3_prepare_v2(sql3, "select *from ZuiJinSouSuo", -1, &st , nil);
//    if (p == SQLITE_OK) {//判断sql语法正确性
//        zuiJinArray=[[NSMutableArray alloc]init];
//        while (sqlite3_step(st)==SQLITE_ROW) {//是否查询到记录
//            ZuiJinSouSuo * zuijin = [[ZuiJinSouSuo alloc]init];
//            zuijin.hzid = sqlite3_column_int(st, 0);
//            zuijin.ziTi = [NSString stringWithCString:(char *)sqlite3_column_text(st, 1) encoding:NSUTF8StringEncoding];
//            zuijin.time = [NSString stringWithCString:(char *)sqlite3_column_text(st, 2) encoding:NSUTF8StringEncoding];
//            [zuiJinArray addObject:zuijin];
//        }
//    }
//    sqlite3_finalize(st);
//    return zuiJinArray;
//}
////更新
//+(void)updateHzID:(int )hzid andZiTi:(NSString *)ziti andTime:(NSString *) time{
//    sqlite3 *sql3=[connection createDB];
//    NSString *sql=[NSString stringWithFormat:@"update ZuiJinSouSuo set ziTi=?,time=? where hzid=?"];//  update ZuiJinSouSuo set ziTi='毛' ,time='20130629211828'  where hzid=11   //   update ZuiJinSouSuo set ziTi=? time=? where bookid=?
//    sqlite3_stmt *st;
//    if(sqlite3_prepare_v2(sql3, [sql UTF8String], -1, &st, nil)==SQLITE_OK){
//        sqlite3_bind_int(st, 0, hzid);
//        sqlite3_bind_text(st, 1, [ziti UTF8String], -1, SQLITE_STATIC);
//        sqlite3_bind_text(st, 2, [time UTF8String], -1, SQLITE_STATIC);
//        sqlite3_step(st);//执行sql
//    }
//    sqlite3_finalize(st);
//}
////插入
//+(void)insertZiTi:(NSString *)ziti andTime:(NSString *) time{
//    sqlite3 *sql3=[connection createDB];
//    NSString *sql=[NSString stringWithFormat:@"insert into ZuiJinSouSuo (ziTi,time) values(?,?)"];//  insert into ZuiJinSouSuo (ziTi,time) values('好','20130629211828')
//    sqlite3_stmt *st;
//    if(sqlite3_prepare_v2(sql3, [sql UTF8String], -1, &st, nil)==SQLITE_OK){
//    sqlite3_bind_text(st, 1, [ziti UTF8String], -1, SQLITE_STATIC);
//    sqlite3_bind_text(st, 2, [time UTF8String], -1, SQLITE_STATIC);
//    sqlite3_step(st);//执行sql
//    }
//    sqlite3_finalize(st);
//}
//
//======================================================================================
+(NSMutableArray *)findAll{
    NSMutableArray *zuiJinArray=nil;
    sqlite3 *sql3=[connection createDB];
    sqlite3_stmt *st;
    int p=sqlite3_prepare_v2(sql3, "select *from ZuiJinSouSuo", -1, &st , nil);
    if (p == SQLITE_OK) {//判断sql语法正确性
        zuiJinArray=[[[NSMutableArray alloc]init]autorelease];
        while (sqlite3_step(st)==SQLITE_ROW) {//是否查询到记录
            ZuiJinSouSuo * zuijin = [[[ZuiJinSouSuo alloc]init]autorelease];
            zuijin.hzid = sqlite3_column_int(st, 0);
            zuijin.ziTi = [NSString stringWithCString:(char *)sqlite3_column_text(st, 1) encoding:NSUTF8StringEncoding];
            zuijin.time = [NSString stringWithCString:(char *)sqlite3_column_text(st, 2) encoding:NSUTF8StringEncoding];
            [zuiJinArray addObject:zuijin];
        }
    }
    sqlite3_finalize(st);
    return zuiJinArray;
    
}
//更新//  update ZuiJinSouSuo set ziTi='毛' ,time='20130629211828'  where hzid=11   //   update ZuiJinSouSuo set ziTi=? time=? where bookid=?
+(void)updateTime:(NSString*)time andZiTi:(NSString *)ziti {
    sqlite3 *sql3=[connection createDB];//where  time (select min(time))
    NSString *sql=[NSString stringWithFormat:@"update ZuiJinSouSuo set ziTi=?, time=? where time=(select min(time) from ZuiJinSouSuo) "];
    sqlite3_stmt *st;
    if(sqlite3_prepare_v2(sql3, [sql UTF8String], -1, &st, nil)==SQLITE_OK){
        //sqlite3_bind_int(st, 0, hzid);
        sqlite3_bind_text(st, 1, [ziti UTF8String], -1, SQLITE_STATIC);
        sqlite3_bind_text(st, 2, [time UTF8String], -1, SQLITE_STATIC);
        sqlite3_step(st);//执行sql
    }
    sqlite3_finalize(st);
}

@end
