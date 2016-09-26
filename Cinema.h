//
//  Cinema.h
//  Model
//
//  Created by lvdl on 16/9/23.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "Model.h"

/*
 "lowPrice": "40.00",
 "grade": "8.8",
 "coord": "116.36047,40.01433",
 "distance": null,
 "address": "北京市海淀区学清路甲8号，圣熙8号购物中心五层西侧。",
 "name": "嘉华国际影城",
 "id": "1396",
 "msg": null,
 "districtId": "1015",
 "tel": "010-82732228",
 "isSeatSupport": "1",
 "isCouponSupport": "1",
 "isImaxSupport": "0",
 "isGroupBuySupport": "0",
 "circleName": "五道口"
 */

@interface Cinema : Model

@property (nonatomic, strong) NSString *cinemaid;
@property (nonatomic, strong) NSString *lowPrice;
@property (nonatomic, strong) NSString *grade;
@property (nonatomic, strong) NSString *coord;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *tel;
@property (nonatomic, strong) NSString *isSeatSupport;
@property (nonatomic, strong) NSString *isCouponSupport;
@property (nonatomic, strong) NSString *isGroupBuySupport;
@property (nonatomic, strong) NSString *circleName;

@end
