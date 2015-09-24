//
//  ListTableViewCell.m
//  ECPA
//
//  Created by 花生 on 15/9/22.
//  Copyright (c) 2015年 花生. All rights reserved.
//

#import "ListTableViewCell.h"
#import "MyUtils.h"

#define TITLE_FONT_COLOR [UIColor colorWithRed:50.0/255.0f green:50.0/255.0f blue:50.0/255.0f alpha:1.0]
#define DATE_FONT_COLOR [UIColor colorWithRed:191.0/255.0f green:191.0/255.0f blue:191.0/255.0f alpha:1.0]

@interface ListTableViewCell()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic) float cellTotalHeight;
@end

@implementation ListTableViewCell
- (void)awakeFromNib{
    [super awakeFromNib];
    self.titleLabel=[[UILabel alloc]init];
    self.dateLabel=[[UILabel alloc]init];
    // 添加组件
    [self addSubview:self.titleLabel];
    [self addSubview:self.dateLabel];
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    //Add cell's border
    self.layer.borderColor=[UIColor colorWithRed:214.0/255.0f green:214.0/255.0f blue:214.0/255.0f alpha:0.5f].CGColor;
    self.layer.borderWidth=0.5;
    //Get cell's size
    float cellWidth=self.bounds.size.width;
    float compWidth=cellWidth-SIDE_MARGIN*2;
    //获得文字的高度
    float titleTextHeight=[MyUtils getTextHeightWithText:self.articleTitle andWidth:compWidth andFontSize:TITLE_FONT_SIZE];
    //初始化组件
    self.titleLabel.frame=CGRectMake(SIDE_MARGIN, TOP_MARGIN, compWidth, titleTextHeight);
    self.titleLabel.text=self.articleTitle;
    [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:TITLE_FONT_SIZE]];
    [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [self.titleLabel setTextColor:TITLE_FONT_COLOR];
    self.titleLabel.numberOfLines=0;
    
    float dateTextHeight=[MyUtils getTextHeightWithText:self.articleDate andWidth:compWidth andFontSize:DATE_FONT_SIZE];
    self.dateLabel.frame=CGRectMake(SIDE_MARGIN, TOP_MARGIN+titleTextHeight+LABEL_SAPERAT, compWidth, dateTextHeight);
    [self.dateLabel setFont:[UIFont fontWithName:@"Helvetica" size:DATE_FONT_SIZE]];
    [self.dateLabel setTextAlignment:NSTextAlignmentRight];
    [self.dateLabel setTextColor:DATE_FONT_COLOR];
    self.dateLabel.text=self.articleDate;
    
    self.cellTotalHeight=TOP_MARGIN*2+titleTextHeight+LABEL_SAPERAT+dateTextHeight;
    
}

- (float)getCellHeight {
    return self.cellTotalHeight;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
