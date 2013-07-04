/*此类是自定义单元格，用来做外观的展示，声明需要的控件(也就是接数据的容器)类型*/
#import <UIKit/UIKit.h>

@interface DetailCell : UITableViewCell<UITableViewDataSource,UITableViewDelegate>
@property (retain,nonatomic) UILabel *titleLab,*pinYinLab,*buShouLab,*biHuaLab;//文字、拼音、部首、笔画
@property (retain,nonatomic) UIButton *round;

@end
