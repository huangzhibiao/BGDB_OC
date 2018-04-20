# BGDB OC版震撼出世.
BGFMDB是在FMDB的基础上进行封装,由于多了中间一层的转化,所以性能有所下降,为了能满足更高性能需求的app,所以我特意重构sqlite API层逻辑,打造这款‘简约时尚强悍版’存储框架,名为BGDB,此款是OC版.
# swift版正在着手计划中,用swift的同学们,请拭目以待😊.
## 功能和BGFMDB基本相同,完美支持大部分数据类型的存储.
# 使用说明.
## CocoaPods方式
### Podfile
platform :ios, '8.0'   
target '工程名称' do   
pod ‘BGDB_OC’, '~> 1.9’   
end
## 手动导入
1.直接下载库源码   
2.添加所需依赖库：libsqlite3   
## 导入头文件
```Objective-C
/**
只要在自己的类中导入了BGDB.h这个头文件,本类就具有了存储功能.
*/
#import <Foundation/Foundation.h>
#import "BGDB.h"
```
## 主键
```Objective-C
/**
本库自带的自动增长主键.
*/
@property(nonatomic,strong)NSNumber* ID;
```
## 唯一约束
```Objective-C
/**
 想要定义'唯一约束',实现该函数返回相应的key即可.
 */
+(NSArray *)bg_uniqueKeys{
    return @[@"name"];
}
```
## 存储
```Objective-C
/**
存储.
*/
[p bg_save];

/**
 存储.
 当有'唯一约束'时使用此API存储会更方便些,此API会自动判断如果同一约束数据已存在则更新,没有则存储.
 */
[p bg_saveOrUpdate];

/**
忽略某些属性存储.
*/
[p bg_saveIgnoredkeys:@[@"name",@"age",@"dog->name",@"dog->age"]];
```
## 更新
```Objective-C
/**
更新(条件语句跟sqlite原生的一样).
 */
[p bg_updateWhere:@"where name='大哥哥' and dog->name='二哈'"];

/**
忽略某些属性不要更新(条件语句跟sqlite原生的一样).
*/
[p bg_updateWhere:@"where age=26 and dog->name='二哈111'" ignoredkeys:@[@"name",@"dog->name",@"dog->age"]];

/**
sql语句批量更新设置.
*/
[People bg_updateSet:@"set name='黄芝标' where age=26"];
```
## 查询
```Objective-C
/**
 查询全部.
*/
NSArray* All = [People bg_findAll];

/**
条件查询(条件语句跟sqlite原生的一样).
*/
NSArray* pSome = [People bg_findWhere:@"where age=26 or dog->name='二哈'"];
```
## 删除.
```Objective-C
/**
条件删除(条件语句跟sqlite原生的一样).
*/
[People bg_deleteWhere:@"where name='黄芝标'"];
```
## 字典转模型
```Ojective-C
/**
在只需要字典转模型功能的情况下,可以不必要再引入MJExtension那么多文件,造成代码冗余,缩减安装包.
用法跟MJExtension一样.
*/
+(id)bg_objectWithKeyValues:(id)keyValues;
+(id)bg_objectWithDictionary:(NSDictionary*)dictionary;
```
# 更多功能请下载demo运行测试使用.
