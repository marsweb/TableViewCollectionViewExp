//
//  MenuCollectionViewCell.m
//  ECPA
//
//  Created by 花生 on 15/9/9.
//  Copyright (c) 2015年 花生. All rights reserved.
//

#import "MenuCollectionViewCell.h"

#define CELL_FONT_COLOR [UIColor colorWithRed:179.0/255.0f green:181.0/255.0f blue:182.0/255.0f alpha:1.0]
#define IMAGE_LABEL_SAPERAT 5

@interface MenuCollectionViewCell()
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *nameLabel;

@end
@implementation MenuCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //Get cell's size
    float cellWidth=self.bounds.size.width;
    //Add cell's border
    self.layer.borderColor=[UIColor colorWithRed:214.0/255.0f green:214.0/255.0f blue:214.0/255.0f alpha:0.5f].CGColor;
    self.layer.borderWidth=0.5;
    //Add cell's content
    self.imageView=[[UIImageView alloc]initWithFrame:CGRectMake(cellWidth/3, cellWidth/6, cellWidth/3, cellWidth/3)];
    [self.imageView setImage:self.menuImage];
    self.nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, cellWidth/2+IMAGE_LABEL_SAPERAT, cellWidth, cellWidth/3)];
    self.nameLabel.text=self.menuName;
    [self.nameLabel setFont:[UIFont fontWithName:@"Helvetica" size:14]];
    [self.nameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.nameLabel setTextColor:CELL_FONT_COLOR];
    //Add subviews
    [self addSubview:self.imageView];
    [self addSubview:self.nameLabel];
    
}

@end
