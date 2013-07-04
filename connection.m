//
//  connection.m
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "connection.h"

@implementation connection
static sqlite3 *instanc=nil;
+(sqlite3 *) createDB{
    if (instanc!=nil) {
        return instanc;
    }
    //打开SQL文件路径
    //先指出数据库文件的源路径
    NSString *sourcePath=[[NSBundle mainBundle]pathForResource:@"ol_pinyins" ofType:@"sqlite"];
    
    //再把数据库文件的目标路径指向document
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    //目标路径,stringByAppendingPathComponent附加路径组件字符串，就是数据库名称。
    NSString *targetPath=[docPath stringByAppendingPathComponent:@"ol_pinyins.sqlite"];
    NSLog(@"targetPath=%@",targetPath);
    //单例对象文件管理器创建
    NSFileManager *fm=[NSFileManager defaultManager];
    NSError *error=nil;
    //判断目录下文件是否存在,当不存在的时候就进行拷贝，否则返回instanc
    if (![fm fileExistsAtPath:targetPath]) {
        if ([fm copyItemAtPath:sourcePath toPath:targetPath error:&error]) {
            NSLog(@"拷贝成功");
        }else{
            NSLog(@"error=%@",error);
            return instanc;
        }
    }
    //UTF8String将OC类型的指针转换成C类型的指针
    sqlite3_open([targetPath UTF8String], &instanc);
    NSLog(@"instance=%p",instanc);
    
    return instanc;
}
@end
