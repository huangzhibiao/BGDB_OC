//
//  ViewController.m
//  BGDB_OC
//
//  Created by huangzhibiao on 17/3/25.
//  Copyright © 2017年 Biao. All rights reserved.
//

#import "ViewController.h"
#import "People.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

-(NSString*)stringWithDate:(NSDate*)date{
    NSDateFormatter* formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [formatter stringFromDate:date];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    bg_setDebug(YES);
    People* p = [People new];
    p.fa = YES;
    p.aId = @"100";
    p.name = @"黄芝标";
    p.age = 28;
    p.f = 1.2;
    p.flag = YES;
    p.image = [UIImage imageNamed:@"ima2"];
    
    Dog* dog = [Dog new];
    dog.name = @"二哈-------";
    dog.sex = @"男";
    dog.age = 10;
    dog.image = p.image;
    dog.BGCreateTime = @"2016-23-12 21:32:12";
    dog.BGUpdateTime = @"2016-23-12 21:32:12";
    
    Cat* cat = [Cat new];
    cat.name = @"蓝猫1";
    
    p.dog = dog;
    
    p.array = @[dog,cat,[UIImage imageNamed:@"ima2"]];
    
    /**
     存储.
     */
    [p bg_saveOrUpdate];
    
    /**
     忽略某些属性存储.
     */
    //[p bg_saveIgnoredkeys:@[@"name",@"age",@"dog.name",@"dog.age"]];
    
    /**
     更新(条件语句跟sqlite原生的一样).
     */
    //[p bg_updateWhere:@"where name='大哥哥' and dog.name='二哈'"];
    
    /**
     忽略某些属性不要更新(条件语句跟sqlite原生的一样).
     */
    //[p bg_updateWhere:@"where age=26 and dog.name='二哈111'" ignoredkeys:@[@"name",@"dog.name",@"dog.age"]];
    
    /**
     sql语句批量更新设置.
     */
    //[People bg_updateSet:@"set name='黄芝标' where age=26"];
    
    /**
     条件查询(条件语句跟sqlite原生的一样).
     */
    //NSArray* pSome = [People bg_findWhere:@"where age=26 or dog.name='二哈-------'"];
    
    /**
     条件删除(条件语句跟sqlite原生的一样).
     */
    //[People bg_deleteWhere:@"where name='黄芝标'"];
    
    /**
     直接调用sqliteb的原生函数计算sun,min,max,avg等.
     */
//    NSInteger sum = [People bg_sqliteMethodWithType:bg_avg key:@"dog.age" where:@"where dog.age>15"];
//    NSLog(@"----sum = %ld",sum);
    
    /**
     查询全部.
     */
    NSArray* pAll = [People bg_findAll];
    for(People* p in pAll){
        NSLog(@"主键ID = %@",p.ID);
    }
    People* lastOne = pAll.lastObject;
    _imageView.image = p.array.lastObject;
}


@end
