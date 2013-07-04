//
//  pinyin.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "pinyin.h"
#import "connection.h"
@implementation pinyin
@synthesize id,pinyin;
//根据拼音查询,查询id>26的字母
+(NSMutableArray *) findbypinyin:(NSString *)pinYin{
    NSLog(@"%@",pinYin);
    NSMutableArray * pinyinArray=nil;//返回查询结果
    sqlite3 *sql3=[connection createDB];//获取数据连接
    //声明sql语句对象
    sqlite3_stmt *st;
    NSString *sqlStr=[NSString stringWithFormat:@"select * from ol_pinyins where substr(pinyin,1,1)='%@'and id>26 order by pinyin",pinYin];
    
    int p=sqlite3_prepare_v2(sql3,[sqlStr UTF8String], -1, &st, nil);//开辟sql3连接，st对象
    if (p==SQLITE_OK) {//判断sql语法正确性
        pinyinArray=[[[NSMutableArray alloc]init]autorelease];//如果正确则开辟空间
        sqlite3_bind_text(st, 1, [pinYin UTF8String], -1, nil);//绑定问号语句
        while (sqlite3_step(st)==SQLITE_ROW) {//SQLITE_ROW宏定义 表示是否查询到了记录，如果查询到了才可以操作这条记录
            pinyin *detail=[[[pinyin alloc]init]autorelease];
            detail.id=sqlite3_column_int(st,0);//一条记录对应一个学生对象
            //把C语言类型的指针转换成OC类型的指针，并进行UIF8码转码
            detail.pinyin=[NSString stringWithCString:(char *) sqlite3_column_text(st,1) encoding:NSUTF8StringEncoding];
            [pinyinArray addObject:detail];
        }
    }
    sqlite3_finalize(st);//关闭语句对象
    return pinyinArray;    
}
@end
