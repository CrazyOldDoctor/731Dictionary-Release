//
//  ZuiJinSouSuo.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-29.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZuiJinSouSuo : NSObject
@property (assign, nonatomic) int hzid;
@property (retain,nonatomic ) NSString *ziTi;
@property (retain,nonatomic) NSString *time;
+(NSMutableArray *)findAll;
+(void)updateTime:(NSString*)time andZiTi:(NSString *)ziti;
+(void)insertZiTi:(NSString *)ziti;

//+(void)updateHzID:(int )hzid andZiTi:(NSString *)ziti andTime:(NSString *) time;
//+(void)insertZiTi:(NSString *)ziti andTime:(NSString *) time;
@end
