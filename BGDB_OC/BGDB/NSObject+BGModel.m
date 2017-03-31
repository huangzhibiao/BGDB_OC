//
//  NSObject+BGModel.m
//  BGDB_OC
//
//  Created by huangzhibiao on 17/3/25.
//  Copyright © 2017年 Biao. All rights reserved.
//

#import "NSObject+BGModel.h"
#import <objc/message.h>
#import "BGSqlite.h"

@implementation NSObject (BGModel)

//分类中只生成属性get,set函数的声明,没有声称其实现,所以要自己实现get,set函数.
-(NSNumber*)ID{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setID:(NSNumber*)ID{
    objc_setAssociatedObject(self,@selector(ID),ID,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//-(NSString *)createTime{
//    return objc_getAssociatedObject(self, _cmd);
//}
//-(void)setCreateTime:(NSString *)createTime{
//    objc_setAssociatedObject(self,@selector(createTime),createTime,OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//-(NSString *)updateTime{
//    return objc_getAssociatedObject(self, _cmd);
//}
//-(void)setUpdateTime:(NSString *)updateTime{
//    objc_setAssociatedObject(self,@selector(updateTime),updateTime,OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
#pragma mark 以下是使用API实现.

/**
 设置调试模式
 */
+(void)setDebug:(BOOL)debug{
    if ([BGSqlite shareInstance].debug != debug){//防止重复设置.
        [BGSqlite shareInstance].debug = debug;
    }
}


/**
 存储.
 */
-(BOOL)save{
    return [BGSqlite insert:self];
}
/**
 存储.
 @ignoredkeys 忽略某些属性不要存.
 */
-(BOOL)saveIgnoredkeys:(NSArray* const)ignorekeys{
    return [BGSqlite insert:self ignoredKeys:ignorekeys];
}
/**
 批量存储.
 */
+(BOOL)saveArray:(NSArray* const)array{
    return [BGSqlite inserts:array];
}
/**
 批量存储.
 @ignoredkeys 忽略某些属性不要存.
 */
+(BOOL)saveArray:(NSArray* const)array ignoredkeys:(NSArray* const)ignorekeys{
    return [BGSqlite inserts:array ignoredKeys:ignorekeys];
}
/**
 查询全部.
 */
+(NSArray*)findAll{
    return [BGSqlite queryWithClass:[self class] where:nil];
}
/**
 条件查询.
 */
+(NSArray*)findWhere:(NSString*)where{
    return [BGSqlite queryWithClass:[self class] where:where];
}
/**
 更新.
 */
-(BOOL)updateWhere:(NSString*)where{
    return [BGSqlite updateObj:self where:where];
}
/**
 忽略某些属性不要更新.
 @ignoredkeys 忽略某些属性不要更新.
 */
-(BOOL)updateWhere:(NSString*)where ignoredkeys:(NSArray* const)ignoredkeys{
    return [BGSqlite updateObj:self ignoredKeys:ignoredkeys where:where];
}
/**
 更新.
 */
+(BOOL)updateSet:(NSString*)setSql{
    return [BGSqlite updateSet:[self class] sql:setSql];
}
/**
 根据条件删除数据.
 @where 删除条件语句,nil时删除全部.
 */
+(BOOL)deleteWhere:(NSString*)where{
    return [BGSqlite deleteWithClass:[self class] where:where];
}
/**
 删除数据库.
 */
+(BOOL)drop{
    return [BGSqlite dropWithClass:[self class]];
}


@end
