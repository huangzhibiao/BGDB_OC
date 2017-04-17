//
//  People.h
//  BGDB_OC
//
//  Created by huangzhibiao on 17/3/25.
//  Copyright © 2017年 Biao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSObject+BGModel.h"

@interface father : NSObject
@property(nonatomic,copy)NSString* aId;
@property(nonatomic,assign)BOOL fa;

@end

@interface Cat : NSObject
@property(nonatomic,copy)NSString* name;
@end

@interface Dog : NSObject
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString* sex;
@property (nonatomic, assign) int age;
@property(nonatomic,strong)UIImage* image;
@property (nonatomic, copy) NSString * BGCreateTime;
@property (nonatomic, copy) NSString * BGUpdateTime;
//@property(nonatomic,strong)UIImage* image;
//@property(nonatomic,strong)Cat* cat;
@end

@interface People : father

@property(nonatomic,copy)NSString* name;
@property(nonatomic,assign)int age;
@property(nonatomic,assign)float f;
@property(nonatomic,assign)BOOL flag;
@property(nonatomic,strong)UIImage* image;
@property(nonatomic,strong)NSArray* array;
@property(nonatomic,strong)Dog* dog;

@end
