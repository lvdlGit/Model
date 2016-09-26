//
//  Model.m
//  Model
//
//  Created by lvdl on 16/9/23.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id)initWithDic:(NSDictionary *)jsonDic
{
    self = [super init];
    if (self) {
        
        [self setAttributes:jsonDic];
        
    }
    return self;
}

- (void)setAttributes:(NSDictionary *)jsonDic
{
    /*
     key: json字典的key名
     value: model对象的属性名
     */
    
    // mapDic: 属性名与json字典的key的映射关系
    NSDictionary *mapDic = [self attributeMapDictionary:jsonDic];
    for (NSString *jsonKey in mapDic) {
        
        
        NSString *modelArr = [mapDic objectForKey:jsonKey];
        SEL seletor = [self stringToSel:modelArr];
        
        // 判断是否有 seletor 方法
        if ([self respondsToSelector:seletor]) {
            // json 字典中的 value
            id value = [jsonDic objectForKey:jsonKey];
            
            if ([value isKindOfClass:[NSNull class]]) {
                value = @"";
            }
            
            // 调用属性的设置器方法, 参数是json的value
            [self performSelector:seletor withObject:value];
        }
    }
}

/*
 属性名与json字典中key的映射关系
 key: json字典的key名
 value: model对象的属性名
 */
- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic
{
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
    
    for (id key in jsonDic) {
        [mapDic setObject:key forKey:key];
    }
    
    return mapDic;
}

// 将属性名 转成SEL类型的set方法
//  grade --->  setGrade:
- (SEL)stringToSel:(NSString *)attName
{
    NSString *first = [[attName substringToIndex:1] uppercaseString];
    NSString *end = [attName substringFromIndex:1];
    
    NSString *setMethod = [NSString stringWithFormat:@"set%@%@:", first, end];
    
    /*
     SEL 创建方式
     1. SEL selector = @selector(setGrade:)
     2. SEL selector = NSSelectorFromString(@"setGrade:");
     */
    return NSSelectorFromString(setMethod);
}

@end
