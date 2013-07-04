//
//  connection.h
//  HanZiDictionary
//
//  Created by ibokan on 13-6-26.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface connection : NSObject
+(sqlite3 *) createDB;

@end
