//
//  NSObject+BGModel.h
//  BGDB_OC
//
//  Created by huangzhibiao on 17/3/25.
//  Copyright © 2017年 Biao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BGProtocol <NSObject>
//可选择操作
@optional
/**
 自定义 “唯一约束” 函数,如果需要 “唯一约束”字段,则在自定类中自己实现该函数.
 @return 返回值是 “唯一约束” 的字段名(即相对应的变量名).
 */
+(NSArray*)uniqueKeys;
/**
 数组中需要转换的模型类
 @return 字典中的key是数组属性名，value是数组中存放模型的Class
 */
- (NSDictionary *)objectClassInArray;
@end

@interface NSObject (BGModel)<BGProtocol>
@property(nonatomic,strong)NSNumber* ID;//本库自带的自动增长主键.
/**
 为了方便开发者，特此加入以下两个字段属性供开发者做参考.(自动记录数据的存入时间和更新时间)
 @createTime 数据创建时间(即存入数据库的时间).
 @updateTime 数据最后那次更新的时间.
 */
//@property(nonatomic,copy)NSString* _Nonnull createTime;
//@property(nonatomic,copy)NSString* _Nonnull updateTime;
#pragma mark 以下是使用API
/**
 设置调试模式
 */
+(void)setDebug:(BOOL)debug;
/**
 存储.
 */
-(BOOL)save;
/**
 存储.
 @ignoredkeys 忽略某些属性不要存.
 */
-(BOOL)saveIgnoredkeys:(NSArray* const)ignorekeys;
/**
 批量存储.
 */
+(BOOL)saveArray:(NSArray* const)array;
/**
 批量存储.
 @ignoredkeys 忽略某些属性不要存.
 */
+(BOOL)saveArray:(NSArray* const)array ignoredkeys:(NSArray* const)ignorekeys;
/**
 查询全部.
 */
+(NSArray*)findAll;
/**
 条件查询.
 */
+(NSArray*)findWhere:(NSString*)where;
/**
 更新.
 */
-(BOOL)updateWhere:(NSString*)where;
/**
 忽略某些属性不要更新.
 @ignoredkeys 忽略某些属性不要更新.
 */
-(BOOL)updateWhere:(NSString*)where ignoredkeys:(NSArray* const)ignoredkeys;
/**
 批量更新.
 */
+(BOOL)updateSet:(NSString*)setSql;
/**
 根据条件删除数据.
 @where 删除条件语句,nil时删除全部.
 */
+(BOOL)deleteWhere:(NSString*)where;
/**
 删除数据库.
 */
+(BOOL)drop;
@end
