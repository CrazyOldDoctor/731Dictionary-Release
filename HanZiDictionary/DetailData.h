/*此类的创建是为DetailCell提供数据，声明相关类型的属性*/
#import <Foundation/Foundation.h>
@interface DetailData : NSObject
@property (retain,nonatomic) NSString *titleStr,*pinYinStr,*buShouStr,*biHuaStr;
//+(id)detailCreate:(NSString *)title;
////便利构造方法
//+(id)detailCreate:(NSString *)title andPinYin:(NSString *)pinYin andBuShou:(NSString *)buShou andBiHua:(NSString *)biHua;
@end
