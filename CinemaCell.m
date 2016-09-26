//
//  CinemaCell.m
//  Model
//
//  Created by lvdl on 16/9/26.
//  Copyright © 2016年 www.palcw.com. All rights reserved.
//

#import "CinemaCell.h"
#import "Cinema.h"

@interface CinemaCell ()

@property (nonatomic, strong) UILabel *label1;

@property (nonatomic, strong) UILabel *label2;

@property (nonatomic, strong) Cinema *cinema;

@end

@implementation CinemaCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createView];
        
    }
    return self;
}

- (void)createView
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 40;
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 11, width, 15)];
    [self.contentView addSubview:_label1];
    _label1.textColor = [UIColor colorWithRed:80 / 255.0 green:80 / 255.0 blue:80 / 255.0 alpha:1];
    _label1.font = [UIFont systemFontOfSize:15];
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_label1.frame) + 14, width, 12)];
    [self.contentView addSubview:_label2];
    _label2.textColor = [UIColor colorWithRed:153 / 255.0 green:153 / 255.0 blue:153 / 255.0 alpha:1];
    _label2.font = [UIFont systemFontOfSize:12];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(20, 62.5, width + 20, 0.5)];
    [self.contentView addSubview:line];
    line.backgroundColor = [UIColor colorWithRed:121 / 255.0 green:121 / 255.0 blue:121 / 255.0 alpha:1];
}

- (void)layoutCellView:(Cinema *)cinema
{
    _cinema = cinema;
    
    _label1.text = cinema.name;
    _label2.text = [NSString stringWithFormat:@"最低价:￥%@元", cinema.lowPrice];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
