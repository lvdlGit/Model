//
//  Cinema.m
//  Model
//
//  Created by lvdl on 16/9/23.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "Cinema.h"

@implementation Cinema

- (void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    
    _cinemaid = [jsonDic objectForKey:@"id"];
    
}

@end
