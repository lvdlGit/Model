//
//  Model.h
//  Model
//
//  Created by lvdl on 16/9/23.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

- (id)initWithDic:(NSDictionary *)jsonDic;

- (void)setAttributes:(NSDictionary *)jsonDic;

- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic;

@end
