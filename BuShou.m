//
//  BuShou.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "BuShou.h"
#import "connection.h"
@implementation BuShou
@synthesize id,bihua,title;
+(NSMutableArray *) findbyBiHua:(int) biHua{
    NSMutableArray *biHuaArray=nil;//表示返回的查询结果
    sqlite3 *sql3=[connection createDB];//获取数据连接
    //声明sql语句对象
    sqlite3_stmt *st;
    //给sql语句对象赋值
    NSString *sqlStr=[NSString stringWithFormat:@"select * from ol_bushou where bihua='%d'",biHua+1];
    int p=sqlite3_prepare_v2(sql3, [sqlStr UTF8String], -1, &st, nil);//开辟sql3连接，st对象
    if (p==SQLITE_OK) {//判断sql语法正确性
        biHuaArray=[[[NSMutableArray alloc]init]autorelease];
        while (sqlite3_step(st)==SQLITE_ROW) {//SQLITE_ROW宏定义 表示是否查询到了记录
            BuShou *bushou=[[[BuShou alloc]init]autorelease];
            //把C语言类型的指针转换成OC类型的指针，并进行UTF8码转码
            bushou.id=sqlite3_column_int(st, 0);
            bushou.bihua= sqlite3_column_int(st, 1);
            bushou.title=[NSString stringWithCString:(char *)sqlite3_column_text(st, 2) encoding:NSUTF8StringEncoding];
            [biHuaArray addObject:bushou];
        }
    }
    sqlite3_finalize(st);//关闭语句对象
    return biHuaArray;
}

@end
