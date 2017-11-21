//
//  BGSqliteConfig.h
//  BGDB_OC
//
//  Created by biao on 2017/7/18.
//  Copyright © 2017年 Biao. All rights reserved.
//

#ifndef BGSqliteConfig_h
#define BGSqliteConfig_h

// 过期方法注释
#define BGDBDeprecated(instead) NS_DEPRECATED(2_0, 2_0, 2_0, 2_0, instead)

typedef NS_ENUM(NSInteger,bg_sqliteMethodType){//处理状态
    bg_min,//求最小值
    bg_max,//求最大值
    bg_sum,//求总和值
    bg_avg//求平均值
};

#endif /* BGSqliteConfig_h */
